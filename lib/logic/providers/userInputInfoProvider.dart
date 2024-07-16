import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserInputInfoProvider extends ChangeNotifier {
  String emailAddress;
  UserInputInfoProvider({
    this.emailAddress = "",
  });
  void retrieveUserInput(String userInput) {
    emailAddress = userInput;
    notifyListeners();
  }
}