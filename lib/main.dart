import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hunger Kitchen'),
    );
  }
}



//RootPage
class RootPage extends StatefulWidget{
  const RootPage({super.key});
  @override
  State<RootPage> createState()=> _RootPage();
}

class _RootPage extends State<RootPage>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.orange[100],//const Color.fromARGB(255,251,249,227),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(Icons.menu,color: Colors.white,),
        ),
        title:const Text(
          "Hunger Kitchen",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Color.fromARGB(255, 75, 25, 15),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                padding:EdgeInsets.all(10),
                margin:EdgeInsets.all(10),
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
                        "assets/pizza.png",
                        width: 125,
                        fit:BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pizza x 2 = 200 tk",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                        ),),
                        Text("Rahat Almas",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                        ),),
                        Text("yunus Khan scholars garden",style: TextStyle(
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
              )
             
            ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Color.fromARGB(255, 75, 25, 15),
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        onTap: (int idx){
          print(idx);
        },
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Color.fromARGB(255, 75, 25, 15),),
          BottomNavigationBarItem(icon: Icon(Icons.delivery_dining_outlined),label: "Orders",backgroundColor: Color.fromARGB(255, 75, 25, 15),),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "Sales",backgroundColor: Color.fromARGB(255, 75, 25, 15),),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank),label: "MyShop",backgroundColor: Color.fromARGB(255, 75, 25, 15),),
        ],
      ),
    );
  }
}




//form (login page)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final hotelNameController = TextEditingController();
  final hotelPasswordController = TextEditingController();

  void loginHandler(){
    print(hotelNameController.text);
    print(hotelPasswordController.text);
    hotelNameController.text="";
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return RootPage();
    }));
  }

  @override
  void dispose() {
    hotelNameController.dispose();
    hotelPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          decoration:const BoxDecoration(
            image: DecorationImage(
              image:AssetImage("assets/loginbg1.jpeg"),
              fit:BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/loginres.png",height: 100,width: 100,fit: BoxFit.cover,),
              ),
              SizedBox(width: 10,),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Welcome",
              style: TextStyle(
                  color: Color.fromARGB(255, 44, 97, 0),
                  fontSize: 15,
                  fontWeight: FontWeight.w400
                  ),
              ),
              Text("Hunger Kitchen",
              style: TextStyle(
                  color: Color.fromARGB(255, 51, 1, 1),
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                  ),
                )
              ],)
              ],),
              //SizedBox(height: 10,),
              //Text("Get Order Deliver Food Manage Business"),
              SizedBox(height: 25,),
              Form(
                child: Column(children: [
                  TextFormField(
                    controller: hotelNameController,
                    decoration:const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(244, 255, 254, 254),
                      label: Text("Hotel Name"),
                      border:OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color:Color.fromARGB(255, 44, 12, 1),
                          width: 3
                        )
                      ),
                      disabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color:Color.fromARGB(255, 44, 12, 1),
                          width: 3
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color:Color.fromARGB(255, 44, 12, 1),
                          width: 3
                        )
                      ),
                      focusedBorder:  OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color:Color.fromARGB(255, 92, 49, 34),
                          width: 3
                        )
                      ),
                    )
                  ),
                  SizedBox(height: 10,)
                  ,
                  TextFormField(
                    controller: hotelPasswordController,
                    obscureText: true,
                    decoration:const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(244, 255, 254, 254),
                      label: Text("password"),
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color:Color.fromARGB(255, 44, 12, 1),
                          width: 3
                        )
                      ),
                      disabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color:Color.fromARGB(255, 44, 12, 1),
                          width: 3
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color:Color.fromARGB(255, 44, 12, 1),
                          width: 3
                        )
                      ),
                      focusedBorder:  OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color:Color.fromARGB(255, 92, 49, 34),
                          width: 3
                        )
                      ),
                    )
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: loginHandler,
                    child:Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding:EdgeInsets.all(12),
                      decoration:BoxDecoration(
                          color: const Color.fromARGB(255, 77, 38, 24),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black45,width: 3,style: BorderStyle.solid)
                      ),
                      child: Text("Login",style: TextStyle(color: Colors.white,fontSize:17,fontWeight: FontWeight.bold ),),
                    )
                  )
                ],),
              )
            ]
          ),
        )
      )
    );
  }
}
