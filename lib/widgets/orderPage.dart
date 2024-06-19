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
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  color:Colors.orange[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/burger.png",
                        width: 125,
                        height: 125,
                        fit:BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Burger x 2 = 200 tk",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                        ),),
                        Text("Pretty Dey",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                        ),),
                        Text("Rowsonwara Scholars Garden",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                        ),),
                        Text("01*********",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                        ),),                   
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  color:Colors.orange[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/ramen.png",
                        width: 125,
                        height: 125,
                        fit:BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ramen x 3 = 200 tk",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                        ),),
                        Text("Sirus",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                        ),),
                        Text("House of PtAlmu",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                        ),),
                        Text("01*********",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                        ),),                   
                      ],
                    )
                  ],
                ),
              ),
              const OrderCard(
                 foodImage: "assets/pizza.png", 
                 foodName: "Pizza",
                 foodQuantity: 2,
                 userName: "Rahat Almas",
                 userLocation: "Yunus Khan Scohalars Gargen",
                 userContact: "01733783039"
              )
            ],
        )
      );
  }
}