import 'package:flutter/material.dart';

class CustomProductWidget extends StatelessWidget {
  final String imageUrl, description, name;
  const CustomProductWidget({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
              color: Color.fromARGB(14, 94, 97, 87),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 130,
                  height: 200,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 182, 182),
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.network(imageUrl),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: size.width * 0.4,
                  height: 300,
                  child: Column(
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 7, 38, 29),
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        description,
                        maxLines: 5, softWrap: true,
                        // overflow: TextOverflow.clip,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 26, 25, 25),
                            fontSize: 14),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        )
      ],
    );
  }
}
