import 'package:flutter/material.dart';

class ProductInfoScreen extends StatelessWidget {
  String name;
  String description;
  String imgUrl;
  ProductInfoScreen(
      {super.key,
      required this.name,
      required this.description,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black12,
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Image.network(imgUrl),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            name,
            style: const TextStyle(
              color: Color.fromARGB(255, 26, 25, 25),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Description',
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 26, 25, 25),
                fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: const TextStyle(
                height: 2,
                color: Color.fromARGB(255, 26, 25, 25),
                fontSize: 14),
          ),
          SizedBox(height: 100),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 61, 65, 119),
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Text(
                'Sell your product',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
        ]),
      ),
    );
  }
}
