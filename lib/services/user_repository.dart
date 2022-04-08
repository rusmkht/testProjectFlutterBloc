import 'package:flutter_network_bloc/models/User.dart';
import 'package:flutter_network_bloc/services/user_api_provider.dart';

class UsersRepository {
  UserProvider _usersProvider = UserProvider();


  Future<List<User>> getAllUsers() => _usersProvider.getUser();

}