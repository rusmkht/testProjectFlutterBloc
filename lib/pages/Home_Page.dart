// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network_bloc/bloc/user_bloc.dart';
import 'package:flutter_network_bloc/widgets/User_List.dart';
import 'package:flutter_network_bloc/services/user_repository.dart';
import 'package:flutter_network_bloc/widgets/ActionButtons.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(create: (context) => UserBloc(usersRepository),
    child: Scaffold(
      appBar: AppBar(title: Text("Users List"),centerTitle: true,),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ActionButtons(),
          Expanded(child: UserList()),

        ],
      ),
    ),);

  }
}
