import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
      super.key,
      required this.foodImage,
      required this.foodName,
      required this.foodQuantity,
      required this.userName,
      required this.userLocation,
      required this.userContact
  });

  final String foodImage;
  final String foodName;
  final int foodQuantity;
  final String userName;
  final String userLocation;
  final String userContact;
  @override 
  State<OrderCard> createState() => _OrderCard();
}

class _OrderCard extends State<OrderCard> {
  @override 
  Widget build(BuildContext context) {
    return Container(
      padding:const  EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.orange[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/pizza.png",
              width: 125,
              height: 125,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pizza x 2 = 200 tk",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                "Rahat Almas",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                "yunus Khan scholars garden",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                "01*********",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}


OrderCard a = OrderCard(foodImage: "assets/pizza.png", foodName: "Pizza", foodQuantity: 2, userName: "Rahat Almas", userLocation: "Yunus Khan Scohalars Gargen", userContact: "01733783039")