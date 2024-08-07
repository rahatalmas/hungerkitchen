import 'package:flutter/material.dart';
import 'package:hungerkitchen/apiCalls/deleteOrderApi.dart';
import 'package:hungerkitchen/apiCalls/orderApi.dart';
import 'package:hungerkitchen/globalStates/hotelLoginProvider.dart';
import 'package:hungerkitchen/models/hotelModel.dart';
import 'package:hungerkitchen/models/orderModel.dart';
import 'package:hungerkitchen/widgets/orderCard.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget{
  const OrderPage({super.key});
  @override
  State<OrderPage> createState() => _OrderPage();
}

class _OrderPage extends State<OrderPage>{

  HotelLoginResponse? _hotelData;
  List<Order> _orders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final loginInfoProvider =
      Provider.of<LoginInfoProvider>(context, listen: false);
      final loginInfo = await loginInfoProvider.loginInfo;
      if (loginInfo != null) {
        List<Order> orders = await fetchOrders(loginInfo.hotelId);
        setState(() {
          _hotelData = loginInfo;
          _orders = orders;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

    List<Order> getPendingOrders() {
    return _orders.where((order) => order.orderStatus==false && order.orderTime.day+1 == DateTime.now().day).toList();
  }

  @override 
  Widget build(BuildContext context){
    return _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _hotelData != null
          ? SingleChildScrollView(
        child: Column(
            children: [
              Container(
                padding:const EdgeInsets.all(10),
                margin:const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange[200], 
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  DateTime.now().day.toString()+"/",
                                  style: TextStyle(
                                    
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 73, 12, 4)
                                  ),
                                ),
                                Text(DateTime.now().month.toString()+"/"),
                                Text(DateTime.now().year.toString())
                               
                              ],
                            ),
                            Text(
                              "Order Status",
                              style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 73, 12, 4)
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              const Text("Total",style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500
                                  ),
                              ),
                              //Text(_orders[_orders.length-1].orderTime.day.toString()+" "+DateTime.now().day.toString()),
                              Text(_orders.where((order){
                                return order.orderTime.day+1 == DateTime.now().day;
                              }).toList().length.toString(),style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                  ),
                              ),
                            ],),
                            Column(children: [
                              Text("Pending",style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500
                                  ),
                              ),
                              Text(_orders.where((order){
                                return order.orderStatus == false && order.orderTime.day+1 == DateTime.now().day;
                              }).toList().length.toString(),style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                  ),
                              ),
                            ],),
                            Column(children: [
                              Text("Delivered",style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500
                                  ),
                              ),
                              Text(_orders.where((order){
                                return order.orderStatus == true && order.orderTime.day+1 == DateTime.now().day;
                              }).toList().length.toString(),style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                  ),
                              ),
                            ],),
                          ],
                        )
                      ],
                    ),
                    
                  ],
                )
              ),
              Container(
                margin:EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(),
                  child:const  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Row(children: [
                        Text("Orders",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                        ),),SizedBox(width: 5,),
                        Icon(Icons.electric_bike)
                       ],),
                        Row(children: [
                        Text("Filter",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                  ),),SizedBox(width: 5,),
                        Icon(Icons.arrow_drop_down)
                       ],),
                    ],
                  )
              ),
              ListView.builder(
                shrinkWrap: true,          
                physics:const NeverScrollableScrollPhysics(),
                itemCount: getPendingOrders().length,
                itemBuilder: (BuildContext context,int index){
                  print(_orders.length );
                  return  OrderCard(
                  foodImage: getPendingOrders()[index].foodInfo.foodPicture, 
                  foodName: getPendingOrders()[index].foodInfo.foodName,
                  foodQuantity: getPendingOrders()[index].quantity,
                  totalPrice:getPendingOrders()[index].foodInfo.foodPrice.toInt(),
                  userName: getPendingOrders()[index].userInfo.userName,
                  userLocation: getPendingOrders()[index].deliveryLocation,
                  userContact: getPendingOrders()[index].userInfo.userContact,
                  orderId:_orders[index].orderId,       
                );
              })
            ],
        )
      ):Center(
          child: Text(' data not available'),
       );
  }
}