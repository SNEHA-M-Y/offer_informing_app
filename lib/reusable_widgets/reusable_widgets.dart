import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:offer_informing_app/services/registration_provider.dart';
import 'package:provider/provider.dart';

TextFormField reusableTextFormfield(
    String text,
    IconData icon,
    bool isPasswordType,
    TextEditingController controller,
    var validator,
    var onSaved) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: isPasswordType,
    autocorrect: isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white.withOpacity(0.9),
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(0.9),
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    validator: validator,
  );
}

Container signInSignupButton(
    BuildContext context, bool isLogin, Function onTap, String email) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90),
    ),
    child: Consumer<RegistrationProvider>(
      builder: (context, updatedemailvalue, child) {
        return ElevatedButton(
          onPressed: () {
            updatedemailvalue.updateEmail(email);
            log("updatedemailValue");
            onTap();
          },
          child: Text(
            isLogin ? 'LOG IN' : 'SIGN UP',
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.black26;
                }
                return Colors.white;
              },
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        );
      },
    ),
  );
}
