import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_list_app/model/user_model.dart';

import '../../api_helper/get_methods.dart';

final getData = ChangeNotifierProvider<DataNotifier>((ref) => DataNotifier());

class DataNotifier extends ChangeNotifier {
  bool _isDataLoading = false;
  List<User> _userList = [];
  bool _isGettingUserById = false;
  User _user = User();

  DataNotifier() {
    _fetchUsersFromApi(); // Call the function in the constructor
  }

  bool get isDataLoading => _isDataLoading;
  List<User> get userList => _userList;
  bool get isGettingUserById => _isGettingUserById;
  User get user => _user;

  Future<void> _fetchUsersFromApi() async {
    _isDataLoading = true;
    _userList.clear();
    notifyListeners();

    try {
      final data = await GetMethods().getAllUsers();
      _userList = data;
    } catch (error) {
      print('Error fetching data: $error');
     } finally {
      _isDataLoading = false;
      notifyListeners();
    }
  }

  Future<void> getUserById(int id) async {
    _isGettingUserById = true;
    notifyListeners();
    try {
      _user = await GetMethods().getUserById(id);
       print('User details for id $id: $_user');
     } catch (error) {
      print('Error fetching user details for id $id: $error');
     } finally {
      _isGettingUserById = false;
      notifyListeners();
    }
  }
}
