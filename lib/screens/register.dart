import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vtu_flutter/screens/home.dart';

import '../auth/auth_services.dart';
import 'login_screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();


}

TextEditingController _username = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _conpassword = TextEditingController();


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
                            controller: _username,
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
                            controller: _email,
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
                            controller: _password,
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
                            obscureText: true,
                            controller: _conpassword,
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
                          onTap: () async{
                           if (_email.text == "" || _password.text == "" || _conpassword.text == "") {
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('All field are required !'),backgroundColor: Colors.red,));

                           }  else if (_password.text != _conpassword.text) {
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password not correct'),backgroundColor: Colors.red,));

                           }  else{
                            User? result = await AuthService().register(_email.text, _password.text);
                            if (result != null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account Created'),backgroundColor: Colors.green,));

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                            }
                           }
                          },
                          child: Container(
                            height: 50,
                            width: 210,
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
