import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';

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
    child: ListView (
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _usernameTextController,
                  decoration: const InputDecoration(
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
                    if(value!.trim().isEmpty){
                      return "성함을 입력해주세요!";
                    }
                    else if(!RegExp(r'^[A-Za-z0-9]{3,}$').hasMatch(value)){
                      //!RegExp(
                      //                     r'^
                      //                     ((
                      //                     [^<>()[\]\\.,;:\s@\"] + (\.[^<>()[\]\\.,;:\s@\"]+ ) *) | (\". + \"))
                      //                     @
                      //                     ((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\]) | ( ([a-zA-Z\-0-9]+\.) + [a-zA-Z]{2,}) )$')
                      //                     .hasMatch(value))
                      return 'Username is invalid';
                    }
                    else {
                      return null;
                    }
                  },
                ),
              ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextFormField(
              controller: _passwordTextController,
              decoration: const InputDecoration(
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
                if(value!.trim().isEmpty){
                  return "비밀번호를 입력해주세요!";
                }
                else {
                  return null;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextFormField(
              controller: _confirmTextController,
              decoration: const InputDecoration(
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
                if(value!.trim().isEmpty){
                  return "비밀번호를 한 번 더 입력해주세요!";
                }
                // if(_passwordTextController.value != _confirmTextController.value){
                //   return "Validation Message: Confirm Password doesnʼt match Password";
                // }
                else {
                  return null;
                }
              },
            ),
          ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _emailTextController,
                  decoration: const InputDecoration(
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
                    if(value!.trim().isEmpty){
                      return "이메일 주소를 입력해주세요!";
                    }
                    else if(!RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value)){
                      return '잘못된 이메일 형식입니다.';
                    }
                    else {
                      return null;
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if(_passwordTextController.value != _confirmTextController.value) {
                        Get.snackbar('Validation Message',
                            "Confirm Password doesnʼt match Password");
                        return;
                      }
                      if(_formKey.currentState!.validate()){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      }
                    },
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(primary: const Color(0xFFD1D1D1)),
                  ),
                  const SizedBox( width: 20,),
                ],
              ),
            ],
          ),
        ),
      ],
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