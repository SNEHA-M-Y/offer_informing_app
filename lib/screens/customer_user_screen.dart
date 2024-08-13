import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offer_informing_app/screens/custom_product_widget.dart';
import 'package:offer_informing_app/screens/product_info.dart';
import 'package:offer_informing_app/screens/signin_screen.dart';

class CustomerUserScreen extends StatefulWidget {
  const CustomerUserScreen({super.key});

  @override
  State<CustomerUserScreen> createState() => _CustomerUserScreenState();
}

class _CustomerUserScreenState extends State<CustomerUserScreen> {
  final Stream<QuerySnapshot> _locationStream =
      FirebaseFirestore.instance.collection('Products').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Customer User",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: StreamBuilder<QuerySnapshot>(
            stream: _locationStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductInfoScreen(
                                    name: data['productName'],
                                    description: data['Description'],
                                    imgUrl: data['image']),
                              ));
                        },
                        child: CustomProductWidget(
                            imageUrl: data['image'],
                            description: data['Description'],
                            name: data['productName']),
                      );
                    })
                    .toList()
                    .cast(),
              );
            }),
      ),
      drawer: NavigationDrawer(children: [
        const DrawerHeader(
            child: CircleAvatar(
          child: Icon(
            Icons.person_2_outlined,
            color: Color.fromARGB(189, 74, 94, 243),
            size: 50,
          ),
        )),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: () {
            FirebaseAuth.instance.signOut().then(
              (value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            );
          },
        ),
      ]),
    );
  }
}
