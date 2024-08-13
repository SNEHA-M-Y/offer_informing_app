import 'package:flutter/material.dart';

class RegistrationProvider extends ChangeNotifier {
  List<String> choice = ["Customer", "Business"];

  String choiceSelected = "Customer";
  String customerOrBusiness = "Customer";
  String email = "";
  void dropDownVariable(UpdatedChoiceselected) {
    choiceSelected = UpdatedChoiceselected!;
    customerOrBusiness = UpdatedChoiceselected;
    notifyListeners();
  }

  notifyListeners();
  void updateEmail(updatedemailvalue) {
    email = updatedemailvalue;
    notifyListeners();
  }
}
