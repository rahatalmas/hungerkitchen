import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
      super.key,
      required this.foodImage,
      required this.foodName,
      required this.foodQuantity,
      required this.totalPrice,
      required this.userName,
      required this.userLocation,
      required this.userContact
  });

  final String foodImage;
  final String foodName;
  final int foodQuantity;
  final int totalPrice;
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
              widget.foodImage,
              width: 125,
              height: 125,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.foodName} x ${widget.foodQuantity.toString()} = ${widget.totalPrice.toString()}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                widget.userName,
                style:const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                widget.userLocation,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                widget.userContact,
                style:const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
