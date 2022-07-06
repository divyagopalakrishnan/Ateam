import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';

import '../../business_logic/repo/modelclass.dart';
import '../notification_settings_screen/notificationscreen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductResponse _productResponse = ProductResponse();
  @override

  void initState() {
    super.initState();
    _readDetailsData().then((value) {
      setState(() {
        _productResponse = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _scaffoldBody(),
      ),
    );
  }

  Widget _scaffoldBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _title(),
        SizedBox(
          height: 10,
        ),
        _productstitle(),
        GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 340,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (BuildContext context, int index) {
              return _productTemplate();
            }),
        _settingsbutton()
      ],
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'What would you like to purchase today?',
        style: TextStyle(
            fontSize: 23.0, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _productstitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        'Latest Collections',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _productTemplate() {
    return Container(
      margin: EdgeInsets.all(9.0),
      width: MediaQuery.of(context).size.height / 4.6,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) => const Center(
                        child: Image(
                      image: AssetImage('assets/images/no_image.jpg'),
                    )),
                    fit: BoxFit.fill,
                    width: 250,
                    height: 150,
                    imageUrl: "https://m.media-amazon.com/images/I/51pWphyMz-L._UL1100_.jpg",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Tops and shirt",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "1234/-",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _settingsbutton(){
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NotificationScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: const Text(
          'Go to settings',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color:Colors.white,
          ),
        ),
      ),
    );
  }

  Future<ProductResponse> _readDetailsData() async {
    final String response =
    await rootBundle.loadString('assets/mock_data/product.json');
    final _itemList = json.decode(response);
    print(response);
    return ProductResponse.fromJson(_itemList);
  }
}

