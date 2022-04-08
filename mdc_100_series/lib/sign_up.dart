import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shrine/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }
}

Widget _bodyWidget(BuildContext context){
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFEFEFEF),
                hintText: "Username",
                contentPadding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  // borderSide: BorderSide(
                  //   width: 1, color: Color(0xFFD1D1D1),
                  // ),
                ),
              ),
              obscureText: false,
              validator: (value){
                if(value!.isEmpty){
                  return "Fill in Username!";
                }
                else
                  return null;
              },
            ),
          ),
      Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: TextFormField(
          controller: _passwordTextController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFEFEFEF),
            hintText: "Password",
            contentPadding:
            EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5)),
            ),
          ),
          obscureText: true,
          validator: (value){
            if(value!.isEmpty){
              return "Fill in password!";
            }
            else
              return null;
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: TextFormField(
          controller: _confirmTextController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFEFEFEF),
            hintText: "Confirm Password",
            contentPadding:
            EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5)),
              // borderSide: BorderSide(
              //   width: 1, color: Color(0xFFD1D1D1),
              // ),
            ),
          ),
          obscureText: true,
          validator: (value){
            if(value!.isEmpty){
              return "Fill in here!";
            }
            else
              return null;
          },
        ),
      ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextFormField(
              controller: _emailTextController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFEFEFEF),
                hintText: "Email Address",
                contentPadding:
                EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  // borderSide: BorderSide(
                  //   width: 1, color: Color(0xFFD1D1D1),
                  // ),
                ),
              ),
              obscureText: false,
              validator: (value){
                if(value!.isEmpty){
                  return "Fill in email address!";
                }
                else
                  return null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () async {
                  print(_usernameTextController.text);
                  print(_passwordTextController.text);
                  print(_confirmTextController.text);
                  print(_emailTextController.text);
                  print(_usernameTextController.text == _passwordTextController.text);

                  if(_passwordTextController.text != _confirmTextController.text)
                    return;
                  if(_formKey.currentState!.validate()){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                },
                child: Text(
                  "SIGN UP",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(primary: Color(0xFFD1D1D1)),
              ),
              SizedBox( width: 20,),
            ],
          ),
        ],
      ),
    ),
  );
}

// class myTextField extends StatelessWidget {
//   const myTextField({
//     Key? key,
//     required TextEditingController myTextController, required this.hintText, required this.obsecure, required this.type,
//   }) : _myController = myTextController, super(key: key);
//
//   final TextEditingController _myController;
//   final String hintText;
//   final bool obsecure;
//   final int type;
//
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 16.0),
// //       child: TextFormField(
// //         controller: _myController,
// //         decoration: InputDecoration(
// //           filled: true,
// //           fillColor: Color(0xFFEFEFEF),
// //           hintText: hintText,
// //           contentPadding:
// //           EdgeInsets.symmetric(vertical: 20, horizontal: 12),
// //           border: UnderlineInputBorder(
// //             borderRadius: BorderRadius.only(
// //                 topLeft: Radius.circular(5),
// //                 topRight: Radius.circular(5)),
// //             // borderSide: BorderSide(
// //             //   width: 1, color: Color(0xFFD1D1D1),
// //             // ),
// //           ),
// //         ),
// //         obscureText: obsecure,
// //         validator: (value){
// //           if(value!.isEmpty){
// //             return "Fill in $hintText!";
// //           }
// //           else
// //             return null;
// //         },
// //       ),
// //     );
// //   }
// // }