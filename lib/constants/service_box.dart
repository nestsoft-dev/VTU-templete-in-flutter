import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  IconData icon;
  String name;
  String image;
  int mycolor;
   Box({Key? key,required this.icon,required this.name,required this.mycolor, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 150,
      width: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(mycolor),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.3),
          blurRadius: 3,
          spreadRadius: 3,
          offset: Offset(2, 3))
        ],
        border: Border.all(color: Colors.purple.shade200,width: 1.0)
      ),
      child: Column(
        children: [
          SizedBox(height: 30,),
         Container(
           height: 40,
           width: 40,
           child:  Center(
             child: Image(image: AssetImage(image),)
         ),),
          SizedBox(height: 30,),
          Text(name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)
        ],
      ),
    );
  }
}
