import 'package:flutter/material.dart';
import 'package:hungerkitchen/apiCalls/deleteOrderApi.dart';

class OrderCard extends StatefulWidget {
  const OrderCard(
      {super.key,
      required this.foodImage,
      required this.foodName,
      required this.foodQuantity,
      required this.totalPrice,
      required this.userName,
      required this.userLocation,
      required this.userContact,
      required this.orderId,
      required this.fetchData});

  final String foodImage;
  final String foodName;
  final int foodQuantity;
  final int totalPrice;
  final String userName;
  final String userLocation;
  final String userContact;
  final int orderId;
  final Function() fetchData;
  @override
  State<OrderCard> createState() => _OrderCard();
}

class _OrderCard extends State<OrderCard> {
  void _deleteOrder(int orderId) async {
    String message = await deleteOrder(orderId);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Deleted'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.orange[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              widget.foodImage,
              width: 125,
              height: 125,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.foodName.length>10?widget.foodName.substring(0,10)+"...":widget.foodName} x ${widget.foodQuantity.toString()} = ${widget.totalPrice.toString()}",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              Text(
                widget.userName,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                widget.userLocation,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                maxLines: 2,
              ),
              Text(
                widget.userContact,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Status'),
                            content: Text("Not Delivered Yet..."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 35, 151, 41),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            "Pending..",
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.send,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  InkWell(
                    onTap: () {
                      _deleteOrder(widget.orderId);
                      widget.fetchData();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 182, 21, 21),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Row(
                        children: [
                          //Text("Remove",style:const TextStyle(fontSize: 17, fontWeight: FontWeight.w500,color: Color.fromARGB(255, 255, 255, 255)),),
                          //SizedBox(width: 3,),
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
