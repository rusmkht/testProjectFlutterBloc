// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network_bloc/bloc/user_bloc.dart';
import 'package:flutter_network_bloc/bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(
            child: Text(
              "No data recieved. Press button 'Load'",
              style: TextStyle(fontSize: 20),
            ),
          );
        }
        if (state is UserLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.black87,
            ),
          );
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) {
              return Container(
                color: (index % 2 == 0) ? Colors.white : Colors.blue,
                height: 60,
                child: ListTile(
                  leading: Text(
                    "ID ${state.loadedUser[index].id}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Column(
                    children: [
                      Text(
                        "${state.loadedUser[index].name}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${state.loadedUser[index].email}",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          Text("${state.loadedUser[index].phone}")
                        ],
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
              );
            },
          );
        }

        if (state is UserErrorState) {
          return Center(
            child: Text(
              "Error, fetching users",
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
