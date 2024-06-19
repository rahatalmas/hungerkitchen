import 'package:flutter/material.dart';
import 'package:hungerkitchen/widgets/orderCard.dart';

class OrderPage extends StatefulWidget{
  const OrderPage({super.key});
  @override
  State<OrderPage> createState() => _OrderPage();
}

class _OrderPage extends State<OrderPage>{
  @override 
  Widget build(BuildContext context){
    return SingleChildScrollView(
        child: Column(
            children: [
              Container(
                padding:const EdgeInsets.all(10),
                margin:const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange[200], 
                  borderRadius: BorderRadius.circular(10)
                ),
                child:const Column(
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
                              Text("Total",style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500
                                  ),
                              ),
                              Text("25",style: TextStyle(
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
                decoration: BoxDecoration(),
                  child: Row(
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
              const OrderCard(
                 foodImage: "assets/ramen.png", 
                 foodName: "Ramen",
                 foodQuantity: 3,
                 totalPrice:1100,
                 userName: "Sirus",
                 userLocation: "PtAlmu House",
                 userContact: "01733783039"
              ),
              const OrderCard(
                 foodImage: "assets/burger.png", 
                 foodName: "Chicken Burger",
                 foodQuantity: 2,
                 totalPrice:200,
                 userName: "Pretty Dey",
                 userLocation: "Rowsonwara Scohalars Gargen",
                 userContact: "01*********"
              ),
              ListView.builder(
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context,int index){
                  return const OrderCard(
                  foodImage: "assets/pizza.png", 
                  foodName: "Pizza",
                  foodQuantity: 2,
                  totalPrice:200,
                  userName: "Rahat Almas",
                  userLocation: "Yunus Khan Scohalars Gargen",
                  userContact: "01733783039"
                );
              })
            ],
        )
      );
  }
}