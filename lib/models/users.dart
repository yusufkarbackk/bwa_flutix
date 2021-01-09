part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  User(this.id, this.email,
      {this.name,
      this.balance,
      this.profilePicture,
      this.selectedGenres,
      this.selectedLanguage});

  @override
  String toString() {
    // TODO: implement toString
    return "[$id] - $name, $email, $selectedLanguage";
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        email,
        balance,
        name,
        profilePicture,
        selectedGenres,
        selectedLanguage
      ];
}
