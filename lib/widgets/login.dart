import 'package:flutter/material.dart';
import 'package:hungerkitchen/apiCalls/loginApi.dart';
import 'package:hungerkitchen/globalStates/hotelLoginProvider.dart';
import 'package:hungerkitchen/models/hotelModel.dart';
import 'package:hungerkitchen/widgets/register.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final hotelNameController = TextEditingController();
  final hotelPasswordController = TextEditingController();
  Future<HotelLoginResponse> loginHandler(){
    print(hotelNameController.text);
    print(hotelPasswordController.text);
    Future<HotelLoginResponse> h = hotelLogin(hotelNameController.text, hotelPasswordController.text); 
    return h;
    //hotelNameController.text="";
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        //image:const DecorationImage(
                          //image: AssetImage("assets/download (1).jpg"),
                        //),
                        color: Colors.brown[500],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child:Consumer<LoginInfoProvider>(
                      builder: (context,hotel,child){
                        return InkWell(
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          onTap:(){
                            hotel.setLoginInfo(loginHandler());
                          },
                        );
                      },
                    )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 5,),
                      Text("Don't Have Account? ",
                        style: TextStyle(
                      color: Colors.brown[700],
                          fontSize: 17,
                          fontWeight: FontWeight.w400
                      ),),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder:(BuildContext context){
                              return RegisterPage(title: "Hotel Register",);
                            })
                          );
                        },
                        child: Text("SignUp",
                          style: TextStyle(
                              color: Colors.green[700],
                              fontSize: 17,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                    ],
                  ),
                ],),
              )
            ]
          ),
        )
      )
    );
  }
}
