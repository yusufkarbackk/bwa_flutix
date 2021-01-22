part of 'widgets.dart';

class ComingSoonMovieCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  ComingSoonMovieCard(this.movie, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(imageBaseURL + "w780" + movie.backdropPath),
              fit: BoxFit.cover)),
      child: Container(
        height: 140,
        width: 100,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Colors.black.withOpacity(0.61),
                  Colors.black.withOpacity(0)
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.title,
                style: whiteTextFont.copyWith(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
