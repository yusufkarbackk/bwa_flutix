part of 'widgets.dart';

class DateCard extends StatelessWidget {
  final bool isSelected;
  final double width;
  final double height;
  final DateTime date;
  final Function tap;

  DateCard(this.date,
      {this.isSelected = false, this.height = 90, this.width = 70, this.tap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (tap != null) {
            tap();
          }
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: isSelected ? accentColor2 : Colors.transparent,
              border: Border.all(
                  color: isSelected ? Colors.transparent : Colors.grey)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(date.shortday,
                  style: blackTextFont.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 6),
              Text(date.day.toString(),
                  style: whiteNumberFont.copyWith(color: Colors.black,
                  fontSize: 16, fontWeight: FontWeight.w400))
            ],
          ),
        ));
  }
}
