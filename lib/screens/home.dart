import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:vtu_flutter/screens/profile.dart';
import 'package:vtu_flutter/screens/top_up.dart';

import '../constants/service_box.dart';
import '../widgets/app_bar.dart';
import 'airtime.dart';
import 'data_purchase.dart';
import 'history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<String> images = [
    "assets/first",
    "assets/second",
    "assets/third",
    "assets/forth",
    "assets/fifth",
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //head image
              MyAppBarCus(),
              SizedBox(
                height: 15,
              ),

              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Features',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),

              //slider
           Container(
             height: 250,
             width: double.maxFinite,
             child:   ListView.builder(
                 itemCount: 5,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (BuildContext context,int index){
                   return  Container(
                     height: 190,
                     width: MediaQuery.of(context).size.width ,
                     margin: EdgeInsets.only(left: 20, right: 20),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         image: DecorationImage(
                             image: AssetImage("${images[index]}.png"), fit: BoxFit.cover)),
                   );
                 }),
           ),




              SizedBox(
                height: 15,
              ),

              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'More',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),

              //services container
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  AirtimePurchase(),));
                },
                      child: Box(
image: 'assets/phone.png',
                        icon: Icons.network_cell,
                        name: 'Airtime',
                        mycolor: (0xFFbfeb91),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  DataPurchase(),));

                      },
                      child: Box(
                        image: 'assets/web.png',
                        icon: Icons.web,
                        name: 'Data', mycolor: (0xffEEAE04 ),
                      ),
                    ),
                    Box(
                      image: 'assets/cable.png',
                      icon: Icons.cable,
                      name: 'Cable', mycolor: (0xff07DD00 ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Box(
                      image: 'assets/bills.png',
                      mycolor: (0xffCC00DD),
                      icon: Icons.electric_bike,
                      name: 'PayBills',
                    ),
                    Box(
                      image: 'assets/e-pins.png',
                      mycolor: (0xff00CFCF),
                      icon: Icons.web,
                      name: 'E-pins',
                    ),
                    Box(
                      image: 'assets/swap.png',
                      mycolor: (0xffED4B00),
                      icon: Icons.cable,
                      name: '2Cash',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
