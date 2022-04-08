import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network_bloc/bloc/user_event.dart';
import 'package:flutter_network_bloc/bloc/user_state.dart';
import 'package:flutter_network_bloc/models/User.dart';
import 'package:flutter_network_bloc/services/user_repository.dart';


class UserBloc extends Bloc<UserEvent, UserState> {

  final UsersRepository usersRepository;

  UserBloc(this.usersRepository) : super(UserEmptyState()) {

    on<UserLoadEvent>((event, emit) async {

      emit(UserLoadingState());

      try{
        final List<User> _loadedUserList = await usersRepository.getAllUsers();
        emit(UserLoadedState(loadedUser: _loadedUserList));
      }catch(_){
        emit(UserErrorState());
      }

    }
    );

    on<UserClearEvent>((event, emit) async {
      emit(UserEmptyState());
    });

  }






  // FLUTTER_BLOC 6.0.1
  // @override
  // Stream<UserState> mapEventToState(UserEvent event) async* {
  //  if(event is UserLoadEvent){
  //    yield UserLoadingState();
  //    try{
  // final List<User> _loadedUserList = await usersRepository.getAllUsers();
  // yield UserLoadedState(loadedUser: _loadedUserList);
  //    }catch(_){
  //      yield UserErrorState();
  //    }
  //  }else if(event is UserClearEvent){
  //
  //    yield UserEmptyState();
  //
  //  }
  //
  // }

}

// FLUTTER_BLOC 4.0.1
// class UserBloc extends Bloc<UserEvent, UserState> {
//
//   final UsersRepository usersRepository;
//
//   UserBloc({required this.usersRepository}) : assert(usersRepository != null);
//
//   @override
//   UserState get initialState => UserEmptyState();
//
//   @override
//   Stream<UserState> mapEventToState(UserEvent event) async* {
//    if(event is UserLoadEvent){
//      yield UserLoadingState();
//      try{
//   final List<User> _loadedUserList = await usersRepository.getAllUsers();
//   yield UserLoadedState(loadedUser: _loadedUserList);
//      }catch(_){
//        yield UserErrorState();
//      }
//    }else if(event is UserClearEvent){
//
//      yield UserEmptyState();
//
//    }
//
//   }
//
// }