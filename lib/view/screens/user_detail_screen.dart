import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_list_app/logic/controller/main_controller.dart';
import 'package:user_list_app/model/user_model.dart';

 
class UserDetailsScreen extends StatelessWidget {
  final int userId;

  const UserDetailsScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final dataProvider = watch.watch(getData); // Accessing the DataNotifier
          final user = dataProvider.userList.firstWhere(
                (user) => user.id == userId,
            orElse: () => User(), // Return an empty user if not found
          );

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${user.name ?? "N/A"}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Username: ${user.username ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Email: ${user.email ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Phone: ${user.phone ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Website: ${user.website ?? "N/A"}'),
                SizedBox(height: 8),
                Text('Address:'),
                SizedBox(height: 4),
                Text(
                  'Street: ${user.address?.street ?? "N/A"}',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'Suite: ${user.address?.suite ?? "N/A"}',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'City: ${user.address?.city ?? "N/A"}',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  'Zipcode: ${user.address?.zipcode ?? "N/A"}',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
