part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  PromoCard(this.promo);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
              color: mainColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(promo.title,
                      style: whiteTextFont.copyWith(fontSize: 14)),
                  Text(promo.subtitle,
                      style: whiteTextFont.copyWith(fontSize: 14))
                ],
              ),
              Text("OFF ${promo.discount}%",
                  style: yellowNumberFont.copyWith(fontSize: 16))
            ],
          ),
        ),
        ShaderMask(
          shaderCallback: (rectangle) {
            return LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.white.withOpacity(0.5), Colors.transparent])
                .createShader(Rect.fromLTRB(0, 0, 100, 80));
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            height: 80,
            width: 140,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Image.asset("assets/Vector 2.png")),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (rectangle) {
              return LinearGradient(
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft,
                  colors: [
                    Colors.white.withOpacity(0.9),
                    Colors.transparent
                  ]).createShader(Rect.fromLTRB(0, 0, 96, 45));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 80,
              width: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset("assets/Rectangle 19.png")),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (rectangle) {
              return LinearGradient(
                  end: Alignment.centerRight,
                  begin: Alignment.centerLeft,
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.transparent
                  ]).createShader(Rect.fromLTRB(0, 0, 96, 25));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 80,
              width: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset("assets/Rectangle 20.png")),
            ),
          ),
        )
      ],
    );
  }
}
