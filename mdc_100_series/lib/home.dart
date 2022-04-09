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

import 'package:Shrine/detail.dart';
import 'package:Shrine/sign_up.dart';
import 'package:Shrine/util/size.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
      //onGenerateInitialRoutes: '/',
      // onGenerateRoute: (settings){
      //   if(settings.name == '/detail'){
      //     final Product p = settings.arguments;
      //   }
      // },

      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const buildScaffold(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => const buildScaffold(),
        '/search': (context) => const buildScaffold(),
        '/favorite': (context) => const buildScaffold(),
        '/mypage': (context) => const SignUpPage(),
        '/logout': (context) => const LoginPage(),
        //'/detail': (context) => const DetailPage(),
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
  final isSelected = <bool>[true, false];
  //
  // void _launchURL() async {
  //   if(!await launch(_url)) throw 'Could not launch $_url';
  // }
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('         Main')),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () {}),
          IconButton(
              icon: const Icon(
                Icons.language,
                semanticLabel: 'language',
              ),
              onPressed: () {} //_launchURL,
              ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: getScreenHeight(context) * 0.05,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ToggleButtons(
                    color: Colors.black.withOpacity(0.60),
                    selectedColor: const Color(0xFF6200EE),
                    selectedBorderColor: const Color(0xFF6200EE),
                    fillColor: const Color(0xFF6200EE).withOpacity(0.08),
                    splashColor: const Color(0xFF6200EE).withOpacity(0.12),
                    hoverColor: const Color(0xFF6200EE).withOpacity(0.04),
                    borderRadius: BorderRadius.circular(4.0),
                    isSelected: isSelected,
                    onPressed: (index) {
                      // Respond to button selection
                      setState(() {
                        isSelected[0] = !isSelected[0];
                        isSelected[1] = !isSelected[1];
                      });
                    },
                    children: const [
                      Icon(Icons.list),
                      Icon(Icons.grid_view),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getScreenHeight(context) * 0.8,
            child: isSelected[0]
                ? _buildListView(context)
                : OrientationBuilder(
                    builder: (context, orientation) {
                      return GridView.count(
                        crossAxisCount:
                            orientation == Orientation.portrait ? 2 : 3,
                        padding: const EdgeInsets.all(16.0),
                        childAspectRatio: 8.0 / 10.0,
                        children: _buildGridCards(context),
                      );
                    },
                  ),
          ),
        ],
      ),
      //resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Pages",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
              decoration: const BoxDecoration(
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
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Home",
                    style: TextStyle(color: Colors.black54),
                  ),
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
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Search",
                    style: TextStyle(color: Colors.black54),
                  ),
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
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Favorite Hotel",
                    style: TextStyle(color: Colors.black54),
                  ),
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
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "My Page",
                    style: TextStyle(color: Colors.black54),
                  ),
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
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Log Out",
                    style: TextStyle(color: Colors.black54),
                  ),
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

  ListView _buildListView(context) {
    List<Product> products =
        ProductsRepository.loadProducts(-1); //Category.all);
    var _favoriteSaved = Set<int>();
    bool _alreadySaved;

    if (products.isEmpty) {
      //return const products;
    }

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        _alreadySaved = _favoriteSaved.contains(products[index].id);

        return Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 5),
          padding: const EdgeInsets.fromLTRB(16, 16, 5, 16),
          height: getScreenHeight(context) * 0.18,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 10 / 10,
                child: Hero(
                  tag: "imageHero",
                  child: Image.asset(
                    products[index].assetName,
                    package: products[index].assetPackage,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: getScreenWidth(context) * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StarWidget(reputation_count: products[index].requtation),
                    Text(
                      products[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Expanded(child: Text(products[index].location))
                  ],
                ),
              ),
              Container(
                width: getScreenWidth(context) * 0.11,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        "more",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      //onPressed: () => DetailPage(product: products[index]),
                      onPressed: () {
                        //List<Product> newProduct = ProductsRepository.loadProducts(products[index].id);
                        //Navigator.pushNamed(context, '/detail', arguments: products[index]);


                        Icon myIcon = Icon(Icons.favorite, color: Colors.red);
                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (BuildContext context) {

                          return Scaffold(
                            appBar: AppBar(
                              title: const Text('Detail'),
                            ),
                            body: ListView(
                              children: [
                                Stack(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 18 / 12,
                                      child: Hero(
                                        tag: "imageHero",
                                        child: Image.asset(
                                          products[index].assetName,
                                          package: products[index].assetPackage,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        right: 10,
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (_alreadySaved) {
                                                  _favoriteSaved.remove(products[index].id);
                                                  myIcon = Icon(Icons.favorite_border, color: Colors.red,);
                                                } else {
                                                  _favoriteSaved.add(products[index].id);
                                                  myIcon = Icon(Icons.favorite, color: Colors.red);
                                                }
                                                _alreadySaved = !_alreadySaved;
                                              });
                                            },
                                            icon: myIcon,
                                        ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      StarWidget(reputation_count: products[index].requtation),
                                      SizedBox(height: 15,),
                                      AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            products[index].name,
                                            textStyle: const TextStyle(
                                              fontSize: 32.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            speed: const Duration(milliseconds: 400),
                                          ),
                                        ],
                                        totalRepeatCount: 4,
                                        pause: const Duration(milliseconds: 1000),
                                        displayFullTextOnTap: true,
                                        stopPauseOnTap: true,
                                      ),
                                      SizedBox(height: 15,),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.lightBlue,
                                            size: 20,
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Text(
                                              products[index].location,
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: Colors.lightBlue,
                                            size: 20,
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Text(
                                              products[index].telephone,
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(thickness: 2,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Expanded(
                                          child: Text(
                                            products[index].description,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  List<Card> _buildGridCards(context) {
    List<Product> products = ProductsRepository.loadProducts(-1);
    //Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 12,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    StarWidget(reputation_count: product.requtation),
                    Text(
                      product.name,
                      style: TextStyle(fontSize: 15),
                      maxLines: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Colors.lightBlue,
                            size: 20,
                          ),
                          Expanded(
                            child: Text(
                              product.location,
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text(
                            "more",
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/detail');
                          },
                        )
                      ],
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

class StarWidget extends StatelessWidget {
  const StarWidget({
    Key? key,
    required this.reputation_count,
  }) : super(key: key);

  final int reputation_count;

  @override
  Widget build(BuildContext context) {
    if (reputation_count == 2) {
      return Row(
        children: [
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
        ],
      );
    } else if (reputation_count == 3) {
      return Row(
        children: [
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
        ],
      );
    } else if (reputation_count == 4) {
      return Row(
        children: [
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
        ],
      );
    } else if (reputation_count == 5) {
      return Row(
        children: [
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
          Icon(
            Icons.star,
            size: 18,
            color: Colors.yellow,
          ),
          //무식하면 이렇게 고생합니다.. 허허허
        ],
      );
    } else
      return Icon(
        Icons.star,
        size: 18,
        color: Colors.yellow,
      );
  }
}
