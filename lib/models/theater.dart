part of 'models.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheatres = [
  Theater("XXI AEON MALL"),
  Theater("XXI THE BREEZE"),
  Theater("XXI SUMARECON MALL SERPONG"),
  Theater("CGV TERASKOTA")
];


