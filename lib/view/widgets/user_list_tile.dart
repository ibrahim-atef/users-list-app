import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import '../screens/user_detail_screen.dart';

// Define the UserListTile widget
class UserListTile extends StatelessWidget {
  // Declare properties to hold user data
  final User user;

  // Constructor to initialize the user property
  const UserListTile({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Display user information in the ListTile
      leading: CircleAvatar(
        // Use the first letter of the username as the avatar
        child: Text(user.username![0]),
      ),
      title: Text(user.name!),
      subtitle: Text(user.email!),
      // Navigate to user detail screen when tapped
      onTap: () {
        // Navigate to user detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailsScreen(
              userId: user.id!,
            ),
          ),
        );
      },
    );
  }
}
