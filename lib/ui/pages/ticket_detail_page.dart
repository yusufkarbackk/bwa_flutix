part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;

  TicketDetailPage(this.ticket);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              BlocBuilder<TicketBloc, TicketState>(
                builder: (_, ticketState) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 22),
                            height: 56,
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: GestureDetector(
                                        onTap: () {
                                          context
                                              .bloc<PageBloc>()
                                              .add(GoToMainPage());
                                        },
                                        child: Icon(Icons.arrow_back,
                                            color: Colors.black))),
                                Center(
                                    child: Text('Ticket Details',
                                        style: blackTextFont.copyWith(
                                            fontSize: 20),
                                        textAlign: TextAlign.center))
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 170,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imageBaseURL +
                                    "w500" +
                                    ticket.movieDetail.backdropPath),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                      ),
                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticket.movieDetail.title,
                              style: blackTextFont.copyWith(fontSize: 18)),
                          SizedBox(height: 6),
                          Text(ticket.movieDetail.genresAndLanguage,
                              style: blackTextFont.copyWith(fontSize: 12)),
                          SizedBox(height: 6),
                          RatingStars(
                              voteAverage: ticket.movieDetail.voteAverage),
                          SizedBox(height: 16),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Cinema",
                                    style: greyTextFont.copyWith(fontSize: 16)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: Text(ticket.theater.name,
                                      style:
                                          blackTextFont.copyWith(fontSize: 16),
                                      textAlign: TextAlign.end),
                                ),
                              ]),
                          SizedBox(height: 8),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date & Time",
                                    style: greyTextFont.copyWith(fontSize: 16)),
                                Text(ticket.time.dateAndTime,
                                    style:
                                        blackTextFont.copyWith(fontSize: 16)),
                              ]),
                          SizedBox(height: 8),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Seat Number",
                                    style: greyTextFont.copyWith(fontSize: 16)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: Text(ticket.seatString,
                                      style:
                                          blackTextFont.copyWith(fontSize: 16),
                                      textAlign: TextAlign.end),
                                ),
                              ]),
                          SizedBox(height: 8),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ID Order",
                                    style: greyTextFont.copyWith(fontSize: 16)),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    ticket.bookingCode,
                                    style: blackTextFont.copyWith(fontSize: 16),
                                    maxLines: 2,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ]),
                          SizedBox(height: 19),
                          Divider(color: Color(0xFFE4E4E4), thickness: 1),
                          SizedBox(height: 19),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name",
                                      style:
                                          greyTextFont.copyWith(fontSize: 16)),
                                  Text(ticket.name,
                                      style:
                                          blackTextFont.copyWith(fontSize: 16)),
                                  SizedBox(height: 8),
                                  Text("Paid",
                                      style:
                                          greyTextFont.copyWith(fontSize: 16)),
                                  Text(
                                      NumberFormat.currency(
                                              locale: "id_ID",
                                              decimalDigits: 0,
                                              symbol: "IDR ")
                                          .format(ticket.totalPrice),
                                      style: whiteNumberFont.copyWith(
                                          color: Colors.black, fontSize: 16)),
                                ],
                              ),
                              QrImage(
                                version: 6,
                                foregroundColor: Colors.black,
                                errorCorrectionLevel: QrErrorCorrectLevel.M,
                                padding: EdgeInsets.all(0),
                                size: 100,
                                data: ticket.bookingCode,
                              )
                            ],
                          ),
                          SizedBox(height: 30)
                        ],
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
