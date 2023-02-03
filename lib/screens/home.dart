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

  List<String> icons = [
    "assets/airtime",
    "assets/data",
    "assets/cable",
    "assets/bills",
    "assets/e-pin",
  ];

  List<String> names = [
    "Airtime",
    "Data",
    "Cable",
    "Bills",
    "E-pin",
  ];

  List screens = [
    AirtimePurchase(),
    DataPurchase(),

  ];

  var current = 0;

  onTap(int index){
    setState(() {
     current = index;
     screens[current];
    });
  }



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
             Padding(padding: EdgeInsets.only(left: 15,right: 15),
             child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10,

             ),
                 scrollDirection: Axis.vertical,
                 itemCount: icons.length,

                 itemBuilder: (context,index){
               return   GestureDetector(
               onTap: (){
                 onTap(index);
               },
                 child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20)
                   ),
                   child: Column(
                     children: [
                       Center(
                         child: Image.asset("${icons[index]}.png",height: 50,width: 50,fit: BoxFit.cover),
                       ),
                       SizedBox(height: 10,),
                       Text('${names[index]}',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),)
                     ],
                   ),
                 ),
               );
                 }),)
            ],
          ),
        ),
      ),
    );
  }

  Widget myCard(){

    return   GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  AirtimePurchase(),));
      },
      child: Box(
        image: 'assets/phone.png',
        icon: Icons.network_cell,
        name: 'Airtime',
        mycolor: (0xFFbfeb91),
      ),
    );
  }
}
