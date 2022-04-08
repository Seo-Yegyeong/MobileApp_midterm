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

import 'package:Shrine/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login.dart';
import 'model/products_repository.dart';
import 'model/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => buildScaffold(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => buildScaffold(),
        '/search': (context) => buildScaffold(),
        '/favorite': (context) => buildScaffold(),
        '/mypage': (context) => SignUpPage(),
        '/logout': (context) => const LoginPage(),
      },
    );
  }
}


class buildScaffold extends StatefulWidget {
  const buildScaffold({Key? key}) : super(key: key);

  @override
  State<buildScaffold> createState() => _buildScaffoldState();
}

class _buildScaffoldState extends State<buildScaffold> {
  // static const String _url = 'https://www.handong.edu/';
  // final isSelected = <bool>[false, false];
  //
  // void _launchURL() async {
  //   if(!await launch(_url)) throw 'Could not launch $_url';
  // }
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHRINE'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: (){}
          ),
          IconButton(
            icon: const Icon(
              Icons.language,
              semanticLabel: 'language',
            ),
            onPressed: (){}//_launchURL,
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),

      //Column(
        //children: [
          // Container(
          //   height: 80,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       ToggleButtons(
          //         color: Colors.black.withOpacity(0.60),
          //         selectedColor: Color(0xFF6200EE),
          //         selectedBorderColor: Color(0xFF6200EE),
          //         fillColor: Color(0xFF6200EE).withOpacity(0.08),
          //         splashColor: Color(0xFF6200EE).withOpacity(0.12),
          //         hoverColor: Color(0xFF6200EE).withOpacity(0.04),
          //         borderRadius: BorderRadius.circular(4.0),
          //         isSelected: isSelected,
          //         onPressed: (index) {
          //           // Respond to button selection
          //           setState(() {
          //             isSelected[index] = !isSelected[indviex];
          //           });
          //         },
          //         children: [
          //           // Icon(isSelected[0]? Icons.list : Icons.list),
          //           // Icon(isSelected[1]? Icons.grid_view : Icons.grid_view),
          //           Icon(Icons.list),
          //           Icon(Icons.grid_view),
          //
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          // OrientationBuilder(
          //   builder: (context, orientation) {
          //     return GridView.count(
          //       crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          //       padding: const EdgeInsets.all(16.0),
          //       childAspectRatio: 8.0 / 9.0,
          //       children: _buildGridCards(context),
          //     );
          //   },
          // ),
       // ],
      //),
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pages",
                    style: TextStyle(fontSize: 25, color: Colors.white),),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 35),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.home,
                      semanticLabel: 'home',
                      color: Colors.lightBlue,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  SizedBox(width: 20,),
                  Text("Home", style: TextStyle(color: Colors.black54),),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      semanticLabel: 'Search',
                      color: Colors.lightBlue,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/search');
                    },
                  ),
                  SizedBox(width: 20,),
                  Text("Search", style: TextStyle(color: Colors.black54),),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            ListTile(
              title: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.location_city,
                      semanticLabel: 'Favorite Hotel',
                      color: Colors.lightBlue,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/favorite');
                    },
                  ),
                  SizedBox(width: 20,),
                  Text(
                    "Favorite Hotel", style: TextStyle(color: Colors.black54),),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/favorite');
              },
            ),
            ListTile(
              title: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.person,
                      semanticLabel: 'my page',
                      color: Colors.lightBlue,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/mypage');
                    },
                  ),
                  SizedBox(width: 20,),
                  Text("My Page", style: TextStyle(color: Colors.black54),),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/mypage');
              },
            ),
            ListTile(
              title: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.logout,
                      semanticLabel: 'log out',
                      color: Colors.lightBlue,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/logout');
                    },
                  ),
                  SizedBox(width: 20,),
                  Text("Log Out", style: TextStyle(color: Colors.black54),),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/logout');
              },
            ),
          ],
        ),
      ),
    );
  }

  List<Card> _buildGridCards(context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        // TODO: Adjust card heights (103)
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
                    Text(
                      product.name,
                      style: theme.textTheme.headline6,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
