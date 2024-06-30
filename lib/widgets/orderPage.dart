import 'package:flutter/material.dart';
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
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "27",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 73, 12, 4)
                                  ),
                                ),
                      
                                Column(
                                  children: [
                                    Text("June"),
                                    Text("Sat")
                                  ],
                                )
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
                              Text(_orders.length.toString(),style: const TextStyle(
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
                              Text("15",style: TextStyle(
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
                              Text("10",style: TextStyle(
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
                itemCount: _orders.length,
                itemBuilder: (BuildContext context,int index){
                  return  OrderCard(
                  foodImage: _orders[index].foodInfo.foodPicture, 
                  foodName: _orders[index].foodInfo.foodName,
                  foodQuantity: _orders[index].quantity,
                  totalPrice:_orders[index].foodInfo.foodPrice.toInt(),
                  userName: _orders[index].userInfo.userName,
                  userLocation: "Yunus Khan Scohalars Gargen",
                  userContact: "01733783039"
                );
              })
            ],
        )
      ):Center(
          child: Text(' data not available'),
       );
  }
}