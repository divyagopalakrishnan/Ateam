


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _scaffoldBody(),
      ),
    );
  }

  Widget _scaffoldBody(){
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        SizedBox(height: 10,),
        _productstitle(),
        _productTemplate()

      ],
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'What would you like to purchase today?',
        style: TextStyle(fontSize: 23.0, color: Colors.black,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _productstitle(){
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        'Latest Product',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _productTemplate(/*DataCourse elementAt*/) {
    return Container(
      margin: EdgeInsets.all(9.0),
      width: MediaQuery.of(context).size.height/4.6,
      height: MediaQuery.of(context).size.height/3.5,
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
                    fit: BoxFit.cover,
                    width: 250,
                    height: 150,
                    imageUrl:" elementAt.course!.thumbnail.toString()",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "elementAt.course!.title.toString()",
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


}
