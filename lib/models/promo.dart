part of 'models.dart';

class Promo extends Equatable {
  final int discount;
  final String title;
  final String subtitle;

  Promo(this.discount, this.title, this.subtitle);

  @override
  // TODO: implement props
  List<Object> get props => [discount, title, subtitle];
}

List<Promo> dummyPromo = [
  Promo(50, 'Student day', 'Maximal only for 2 people'),
  Promo(70, 'Family day', 'Maximal only for 4 members'),
  Promo(50, 'Holiday special', 'Only for 2 seats'),
];
