import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hungerkitchen/apiCalls/foodUploadApi.dart';
import 'package:hungerkitchen/apiCalls/hoteApi.dart';
import 'package:hungerkitchen/apiCalls/hotelFoodsApi.dart';
import 'package:hungerkitchen/globalStates/hotelLoginProvider.dart';
import 'package:hungerkitchen/models/foodModel.dart';
import 'package:hungerkitchen/models/hotelModel.dart';
import 'package:hungerkitchen/widgets/uploadFood.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  HotelLoginResponse? _hotelData;
  Hotel? _hotel;
  List<Food> _foods = [];
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
        // Fetch foods based on hotel ID
        List<Food> foods = await fetchFood(loginInfo.hotelId);

        // Fetch hotel details based on hotel ID
        Hotel? hotel = await fetchHotelDetails(loginInfo.hotelId);

        if (hotel != null) {
          setState(() {
            _hotelData = loginInfo;
            _hotel = hotel;
            _foods = foods;
            _isLoading = false;
          });
        } else {
          setState(() {
            _isLoading = false;
          });
        }
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _hotelData != null && _hotel != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      // Hotel and Food information widgets
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: Colors.orange[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text("Total Foods",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                                  Text(_foods.length.toString(),style: TextStyle(fontSize: 20),),
                                  InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return FoodUploadPage(
                                    hotelId: _hotelData!.hotelId,
                                  );
                                },
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                              decoration: BoxDecoration(
                                color:Colors.brown[700],borderRadius: BorderRadius.circular(10)
                              ),
                              child: Icon(Icons.add,color: Colors.white,)
                            ),
                          ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      _hotel!.hotelPicture,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(_hotel!.hotelName),
                                  Text(_hotel!.hotelDescription),
                                  // Add more hotel details if needed
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      // Actions and list of foods
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("All Foods",style: TextStyle(fontSize:17),),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return FoodUploadPage(
                                    hotelId: _hotelData!.hotelId,
                                  );
                                },
                              ));
                            },
                            child: Container(
                              
                              decoration: BoxDecoration(),
                              child: Row(
                                children: [Text("Add",style: TextStyle(fontSize:17),), Icon(Icons.add)],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // List of foods
                      Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _foods.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange[200],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        _foods[index].foodPicture,
                                        width: MediaQuery.of(context).size.width,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _foods[index].foodName.length>15?_foods[index].foodName.substring(0,15)+"...":_foods[index].foodName,
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.brown[500],
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(
                                              "Price: "+ _foods[index].foodPrice+"",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.brown[400],
                                              ),
                                            ),
                                            SizedBox(width: 10,child: Center(child: Text("|"),),),
                                            Text("Category: "+_foods[index].foodCategory,style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.brown[400],
                                              ),),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(children: [
                                          InkWell(
                                          onTap: () {
                                            // Handle food removal logic
                                            print("Remove food: ${_foods[index].foodName}");
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.green[500],
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Row(children: [
                                              Text("Update",style: TextStyle(color: Colors.white),),
                                              Icon(Icons.edit,color: Colors.white,)
                                            ],),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        InkWell(
                                          onTap: () {
                                            // Handle food removal logic
                                            print("Remove food: ${_foods[index].foodName}");
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.red[400],
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Row(children: [
                                              Text("Remove",style: TextStyle(color: Colors.white),),
                                              Icon(Icons.delete,color:Colors.white)
                                            ],),
                                          ),
                                        ),
                                        ],)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      
                      SizedBox(height: 10),
                    ],
                  ),
                )
              : Center(
                  child: Text('Data not available'),
                ),
    );
  }
}
