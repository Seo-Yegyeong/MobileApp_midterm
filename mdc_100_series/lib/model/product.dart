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

//enum Category { all, accessories, clothing, home, }

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.requtation,
    required this.location,
    required this.telephone,
    required this.description,
    required this.isLoved,
  });

  final int id;
  final String name;
  final int requtation;
  final String location;
  final String telephone;
  final String description;
  final bool isLoved;
  // final Category category;
  // final int id;
  //final String name;

  String get assetName => '$id-0.PNG';
  String get assetPackage => 'shrine_images';

  @override
  String toString() => "$name (id=$id)";
}
