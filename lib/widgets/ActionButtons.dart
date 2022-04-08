// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network_bloc/bloc/user_bloc.dart';
import 'package:flutter_network_bloc/bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final UserBloc userBloc = context.read<UserBloc>();

    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
      RaisedButton(onPressed: (){
        userBloc.add(UserLoadEvent());
      },
      child: Text("Load"),
      color: Colors.green,),
      SizedBox(width: 10,),
      RaisedButton(onPressed: (){
        userBloc.add(UserClearEvent());
      },
        child: Text("Clear"),
        color: Colors.red,)

    ],);
  }
}