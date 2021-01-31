part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final Ticket ticket;
  final FlutixTransaction transaction;

  SuccessPage(this.ticket, this.transaction);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return;
        },
        child: Scaffold(
            body: FutureBuilder(
                future: ticket != null
                    ? proccessingTicketOrder(context)
                    : proccessingTopUp(),
                builder: (_, snapshot) => (snapshot.connectionState ==
                        ConnectionState.done
                    ? Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 150,
                                  height: 150,
                                  margin: EdgeInsets.only(bottom: 70),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: (ticket != null)
                                              ? AssetImage("assets/Frame 1.png")
                                              : AssetImage(
                                                  "assets/Frame 2.png")))),
                              Text(
                                  (ticket != null)
                                      ? "Happy Watching!"
                                      : "Successfully Top Up",
                                  style: blackTextFont.copyWith(fontSize: 20)),
                              SizedBox(height: 16),
                              Text(
                                  (ticket != null)
                                      ? "You have successfully\nbought the ticket"
                                      : "You successfully Top Up",
                                  textAlign: TextAlign.center,
                                  style: blackTextFont.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(height: 20),
                              Container(
                                width: 250,
                                height: 45,
                                child: RaisedButton(
                                    child: Text("Enjoy Your Movie!",
                                        style: whiteTextFont.copyWith(
                                            fontSize: 16)),
                                    elevation: 0,
                                    color: Color(0xFF3E9D9D),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    onPressed: () {}),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Discover new movie? ",
                                      style: blackTextFont),
                                  GestureDetector(
                                      onTap: () {
                                        context
                                            .bloc<PageBloc>()
                                            .add(GoToMainPage());
                                      },
                                      child: Text("Back to Home",
                                          style: blackTextFont.copyWith(
                                              color: mainColor)))
                                ],
                              )
                            ]),
                      )
                    : Center(
                        child: SpinKitFadingCircle(
                        color: mainColor,
                        size: 50,
                      ))))));
  }

  Future<void> proccessingTicketOrder(BuildContext context) async {
    context.bloc<UserBloc>().add(Purchase(ticket.totalPrice));
    context.bloc<TicketBloc>().add(BuyTicket(ticket, transaction.userID));

    await FlutixTransactionServices.saveTransaction(transaction);
  }

  Future<void> proccessingTopUp() async {}
}
