import 'package:flutter/foundation.dart';
import 'auth_methods.dart'; // Assuming you have the AuthMethods class defined in this file

class UserProvider with ChangeNotifier {
  Users? _user;
  AuthMethods _authMethod = AuthMethods();

  Users? get user => _user;

  Future<void> refreshUser() async {
    Users? user = await _authMethod.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
