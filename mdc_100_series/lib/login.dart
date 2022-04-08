// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:shrine/sign_up.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                const Text('SHRINE'),
              ],
            ),
            const SizedBox(height: 120.0),
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)
            // TODO: Add TextField widgets (101)
            // TODO: Add button bar (101)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
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
                  ),
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _passwordTextController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFEFEFEF),
                  hintText: "password",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                  ),
                ),
                obscureText: true,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        _usernameTextController.clear();
                        _passwordTextController.clear();
                      },
                      child: Text(
                        "CANCEL",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 0.0)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 0.0),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text(
                      "NEXT",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(primary: Color(0xFFD1D1D1)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Add AccentColorOverride (103)
