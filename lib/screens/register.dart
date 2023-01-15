import 'package:flutter/material.dart';

import 'login_screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();


}




class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text('Welcome to VTU-Pay',style: TextStyle(color: Colors.purple,fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade100,
                      boxShadow: [
                        BoxShadow(color: Colors.black26,offset: Offset(2, 3),blurRadius: 6,spreadRadius: 2),
                      ]
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        Container(height: 100,
                        width: 150,
                        child: Image.asset('assets/first.png'),),

                        SizedBox(height: 15,),
                        Text('Create New Account',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 25),),
                        SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),
                                label: Text('Enter Username')
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email_outlined),
                                label: Text('Enter Email')
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.password),
                                label: Text('Enter password')
                            ),
                          ),
                        ),


                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.password),
                                label: Text('Confirm password')
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),

                        GestureDetector(
                          onTap: (){
                            setState(() {

                            });
                          },
                          child: Container(
                            height: 60,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(child: Text('Register',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
                          ),
                        ),
                        SizedBox(height: 20,),
                        
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                        }, child: Text('Already have an Account? SignIn',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
