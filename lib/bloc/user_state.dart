part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  //state dimana data user sudah di load

  final User
      user; //user yang disini yang akan digunakan untuk menyimpan data user
  UserLoaded(this.user);

  List<Object> get props => [user];
}
