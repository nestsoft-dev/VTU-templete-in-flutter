import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class AirtimePurchase extends StatelessWidget {
   AirtimePurchase({Key? key}) : super(key: key);

  TextEditingController _number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Purchase Airtime'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          MyAppBarCus(),
          SizedBox(height: 20,),


          //Network dropdown will be here

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
             maxLength: 11,
             controller: _number,
             keyboardType: TextInputType.number,
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               prefixIcon: Icon(Icons.phone_android_outlined),
               label: Text('Enter Phone Number')
             ),
            ),
          ),
          SizedBox(height: 15,),

          Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                onPressed: (){
                  if(_number.text == ""){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please Provide a Phone Number"),backgroundColor: Colors.red,)
                    );
                  }
                  else if(_number.text.length < 11){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please Provide a complete Number"),backgroundColor: Colors.red,)
                    );
                  }else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please wait"),backgroundColor: Colors.green,)
                    );
                  }
                }, child: Text('Buy Airtime')),
          )

        ],
      ),
    );
  }


}


