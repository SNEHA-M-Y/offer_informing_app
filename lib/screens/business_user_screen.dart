import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offer_informing_app/screens/signin_screen.dart';
import 'package:offer_informing_app/services/pick_files_provider.dart';
import 'package:provider/provider.dart';

class BusinessUserScreen extends StatelessWidget {
  BusinessUserScreen({super.key});

  TextEditingController productnamecontroller = TextEditingController();

  TextEditingController productdetailscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(
        children: [
          CircleAvatar(
            child: Icon(
              Icons.hourglass_top_outlined,
              color: Colors.black,
              size: 40,
            ),
            radius: 50,
          ),
          ListTile(
            leading: Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ),
            title: Text(
              "Log Out",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut().then(
                (onValue) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
      appBar: AppBar(
        title: Text(
          "Business User",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Consumer<PickFilesProvider>(
        builder: (context, filepickervalue, child) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: () {
                    filepickervalue.pickFile();
                  },
                  child: Text("Pick files"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Product Name",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          0,
                        ),
                      ),
                      enabled: true),
                  controller: productnamecontroller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Product Details",
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          0,
                        ),
                      ),
                      enabled: true),
                  maxLength: 1000,
                  controller: productdetailscontroller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    filepickervalue.upLoadfile(
                        context,
                        productnamecontroller.text,
                        productdetailscontroller.text);
                  },
                  child: Text(
                    "Distribute this Product",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
