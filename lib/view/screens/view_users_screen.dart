import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_list_app/view/widgets/user_list_tile.dart';

import '../../logic/controller/main_controller.dart';

class ViewUsersScreen extends StatelessWidget {
  const ViewUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        elevation: 1,
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final main = watch.read(getData);

                  if (main.isDataLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: main.userList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final user = main.userList[index];
                return UserListTile(user: user);
              },
            );
          }
        },
      ),
    );
  }
}
