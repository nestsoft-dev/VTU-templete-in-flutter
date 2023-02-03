import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vtu_flutter/screens/main_page.dart';
import 'package:vtu_flutter/screens/register.dart';

import '../auth/auth_services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 15,),
          Text('Welcome Back',style: TextStyle(color: Colors.purple,fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
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
                    Text('Login Account',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 25),),
                    SizedBox(height: 20,),


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

                    GestureDetector(
                      onTap: () async{
                        if (_email.text == "" || _password.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('All field are required !'),backgroundColor: Colors.red,));

                        } else{
                          User? result = await AuthService().login(_email.text, _password.text);
                          if (result != null) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));

                          }
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
                      ),
                    ),
                    SizedBox(height: 20,),

                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),));
                    }, child: Text('Don\'t have an Account? SignUp',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
