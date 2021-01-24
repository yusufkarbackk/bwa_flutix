part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;
  final Color color;
  final MainAxisAlignment alignment;

  RatingStars({this.voteAverage, this.starSize, this.fontSize, this.color, this.alignment});
  @override
  Widget build(BuildContext context) {
    int n = voteAverage ~/ 2;

    List<Widget> widgets = List.generate(
        5,
        (index) => Icon(
              index < n ? MdiIcons.star : MdiIcons.starOutline,
              color: accentColor2,
              size: starSize,
            ));

    widgets.add(SizedBox(width: 3));

    widgets.add(Text("$voteAverage/10",
        style: yellowNumberFont.copyWith(
            fontWeight: FontWeight.w300, fontSize: fontSize)));
    return Row(children: widgets);
  }
}
