part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genres;

  BrowseButton(this.genres);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(genres),
        Container(
          decoration: BoxDecoration(
              color: Color(0xFFEEF1F8), borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.only(bottom: 8),
          width: 60,
          height: 60,
          child: Center(
            child: SizedBox(
              height: 40,
              child: Image(image: AssetImage(getImageFromGenres(genres))),
            ),
          ),
        )
      ],
    );
  }

  String getImageFromGenres(genres) {
    switch (genres) {
      case "War":
        return "assets/Frame4.png";
        break;
      case "Crime":
        return "assets/Frame 6.png";
        break;
      case "Music":
        return "assets/music.png";
        break;
      case "Action":
        return "assets/Frame 3.png";
        break;
      case "Horror":
        return "assets/horror.png";
        break;
      case "Drama":
        return "assets/Frame 5.png";
        break;
      default:
        "";
    }
  }
}
