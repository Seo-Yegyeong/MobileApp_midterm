import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/product.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.product}) : super(key: key);
  final Product product;
  // final List<Product> product;

  // String get assetName => '$product[id]-0.PNG';
  // String get assetPackage => 'shrine_images';
  //
  @override
  Widget build(BuildContext context) {
    //final product = ModalRoute.of(context)!.settings.arguments as DetailPage;
    final imageWidget = Image.asset(
      product.assetName,
      package: product.assetPackage,
      fit: BoxFit.cover,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Container(
        // The blue background emphasizes that it's a new route.
          child: Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18 / 12,
                child: Hero(
                  tag: "imageHero",
                  child: imageWidget,
                ),
              ),
              Positioned(
                top: 20,
                  right: 20,
                  child: Icon(Icons.monitor_heart_rounded)

                  //IconButton(onPressed: (){}, icon: Icon(Icons.monitor_heart_rounded)),
              ),
            ],
          ),

      ),
    );
  }
}
//
//
// class DetailPage extends StatefulWidget {
//   const DetailPage({Key? key, required this.p}) : super(key: key);
//   final Product p;
//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }
//
// class _DetailPageState extends State<DetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     final product = ModalRoute.of(context)!.settings.arguments as DetailPage;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail'),
//       ),
//       body: Container(
//         // The blue background emphasizes that it's a new route.
//       //   child: AspectRatio(
//       //     aspectRatio: 18 / 12,
//       //     child: Hero(
//       //       tag: "imageHero",
//       //       child: Image.asset(
//       //         '${product.assetName}',
//       //         package: product?.assetPackage,
//       //         fit: BoxFit.fitWidth,
//       //       ),
//       //     ),
//       //   ),
//       ),
//     );
//   }
// }
