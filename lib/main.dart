import 'package:flutter/material.dart';
import 'package:hungerkitchen/globalStates/hotelLoginProvider.dart';
import 'package:hungerkitchen/widgets/foodPage.dart';
import 'package:hungerkitchen/widgets/homePage.dart';
import 'package:hungerkitchen/widgets/login.dart';
import 'package:hungerkitchen/widgets/orderPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
     MultiProvider(
         providers:[
           ChangeNotifierProvider(create: (context)=>LoginInfoProvider()),
         ],
       child: const MyApp(),
     ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hunger',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Consumer<LoginInfoProvider>(
          builder: (context,hotel,child){
            print("Main Page 1st ${hotel.loginInfo}");
            if(hotel.loginInfo != null){
              print(hotel.loginInfo);
              return FutureBuilder(
                  future: hotel.loginInfo,
                  builder: (context,snapshot){
                    print(snapshot.hasData);
                if(snapshot.hasData){
                  return RootPage();
                }else{
                  return LoginPage(title: "Hunger Kitchen");
                }
              });
            }else{
              return LoginPage(title: "Hunger Kitchen");
            }
          },
        )

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

  final List<Widget> widgets = const [
    OrderPage(),
    FoodPage(),
    HomePage(),
  ];
  
  int selectedIndex = 0;
  void changePage(int idx){
     setState((){
      selectedIndex = idx;
     });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.orange[100],//const Color.fromARGB(255,251,249,227),
      appBar: AppBar(
        title:const Text(
          "Hunger Kitchen",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor:const Color.fromARGB(255, 75, 25, 15),
      ),
      body: widgets[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor:const Color.fromARGB(255, 75, 25, 15),
        selectedItemColor:const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Colors.white,
        onTap: (int idx){
          changePage(idx);
        },
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.delivery_dining_outlined),label: "Orders",backgroundColor: Color.fromARGB(255, 75, 25, 15),),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "Foods",backgroundColor: Color.fromARGB(255, 75, 25, 15),),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank),label: "MyShop",backgroundColor: Color.fromARGB(255, 75, 25, 15),),
        ],
      ),
    );
  }
}




//form (login page)
