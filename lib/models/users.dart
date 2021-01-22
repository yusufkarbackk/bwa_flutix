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

  User copyWith({String name, String profilePicture, int balance}) =>
      User(this.id, this.email,
          name: name ?? this.name,
          profilePicture: profilePicture ?? this.profilePicture,
          balance: balance ?? this.balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

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
