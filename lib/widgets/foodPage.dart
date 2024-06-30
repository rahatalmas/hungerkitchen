import 'package:flutter/material.dart';
import 'package:hungerkitchen/apiCalls/hotelFoodsApi.dart';
import 'package:hungerkitchen/globalStates/hotelLoginProvider.dart';
import 'package:hungerkitchen/models/foodModel.dart';
import 'package:hungerkitchen/models/hotelModel.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  HotelLoginResponse? _hotelData;

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
        List<Food> foods = await fetchFood(loginInfo.hotelId);
        setState(() {
          _hotelData = loginInfo;
          _foods = foods;
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _hotelData != null
              ? SingleChildScrollView(
                  child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset("assets/pizza.png",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(_hotelData!.hotelId.toString()),
                              //Text(_userData!.user_email)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //pending                       SizedBox(height: 10,),
                    Row(
                      children: [Text("All Foods")],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _foods.length,
                        itemBuilder: (context, index) {
                          return Container(
                            //height: 150,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.orange[200],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Image.network(
                                        _foods[index].foodPicture,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                    //
                                    ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _foods[index].foodName,
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.brown[500],
                                            letterSpacing: 1),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            _foods[index].foodPrice,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.brown[400],
                                                letterSpacing: 0),
                                          ),
                                          Text(_foods[index].foodCategory)
                                        ],
                                      ),
                                      Text(
                                        _foods[index].foodInstock.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.brown[400],
                                            letterSpacing: 0),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          print("food details");
                                        },
                                        child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.green[500],
                                          ),
                                          child: Text("Remove"),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  
                  ],
                ))
              : Center(
                  child: Text(' data not available'),
                ),
    );
  }
}
