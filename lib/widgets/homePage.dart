import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/bg4.jpeg",
                  ),
                  fit: BoxFit.cover,
                  //opacity: 10
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/homeshop.png",
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ghilbi Food Shop",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: const Color.fromARGB(255, 39, 12, 7))),
                    Text("June-25-2024  Tuesday",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: const Color.fromARGB(255, 48, 18, 13))),
                    SizedBox(
                      height: 5,
                    ),
                    //Text("Welcome manager",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.brown[800])),
                    Text("Let's work",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromARGB(255, 65, 25, 6)))
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Orders Stats",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.auto_graph)
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Filter",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 2,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(6, (index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.orange[200],
                    borderRadius: BorderRadius.circular(10),
                    /*image: const DecorationImage(
                      image: AssetImage(
                        "assets/bg2.jpeg",
                      ),
                      fit: BoxFit.cover,
                      //opacity: 10
                    ),*/
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/pizza.png",
                        height: 60,
                        width: 60,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Pizza",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                         Text("Total 3",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),)],
                      )
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
