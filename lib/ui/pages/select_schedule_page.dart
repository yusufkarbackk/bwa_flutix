part of 'pages.dart';

class SelectSchedulePage extends StatefulWidget {
  final MovieDetail movieDetail;

  SelectSchedulePage(this.movieDetail);
  @override
  _SelectSchedulePageState createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  List<DateTime> dates;
  DateTime selectedDate;
  int selectedTime;
  Theater selectedTheatre;
  bool isValid = false;

  @override
  void initState() {
    super.initState();

    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMovieDetailPage(widget.movieDetail));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(color: Colors.white),
            SafeArea(
              child: Container(
                color: Colors.white,
              ),
            ),
            ListView(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: defaultMargin),
                      padding: EdgeInsets.all(1),
                      child: GestureDetector(
                        onTap: () {
                          context
                              .bloc<PageBloc>()
                              .add(GoToMovieDetailPage(widget.movieDetail));
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 16),
                  child: Text("Choose Date",
                      style: blackTextFont.copyWith(fontSize: 20)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  height: 90,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dates.length,
                      itemBuilder: (_, index) => Container(
                            margin: EdgeInsets.only(
                                left: (index == 0) ? defaultMargin : 0,
                                right: (index < dates.length - 1)
                                    ? 16
                                    : defaultMargin),
                            child: DateCard(
                              dates[index],
                              isSelected: selectedDate == dates[index],
                              tap: () {
                                setState(() {
                                  selectedDate = dates[index];
                                });
                              },
                            ),
                          )),
                ),
                generateTimeTable(),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.topCenter,
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, userstate) {
                        return FloatingActionButton(
                          elevation: 0,
                          backgroundColor:
                              (isValid) ? mainColor : Color(0xFFE4E4E4),
                          child: Icon(Icons.arrow_forward,
                              color:
                                  isValid ? Colors.white : Color(0xFFBEBEBE)),
                          onPressed: () {
                            if (isValid) {
                              context.bloc<PageBloc>().add(GoToSelectSeatPage(
                                  Ticket(
                                      widget.movieDetail,
                                      selectedTheatre,
                                      DateTime(
                                          selectedDate.year,
                                          selectedDate.month,
                                          selectedDate.day,
                                          selectedTime),
                                      randomAlphaNumeric(12).toUpperCase(),
                                      null,
                                      (userstate as UserLoaded).user.name,
                                      null)));
                            }
                          },
                        );
                      },
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Column generateTimeTable() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    for (var theatre in dummyTheatres) {
      widgets.add(Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
          child:
              Text(theatre.name, style: blackTextFont.copyWith(fontSize: 20))));

      widgets.add(Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 20),
          child: ListView.builder(
              itemCount: schedule.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(
                        left: (index == 0) ? defaultMargin : 0,
                        right: (index < dates.length - 1) ? 16 : defaultMargin),
                    child: SelectableBox(
                      "${schedule[index]}:00",
                      height: 50,
                      isSelected: selectedTheatre == theatre &&
                          selectedTime == schedule[index],
                      isEnabled: schedule[index] > DateTime.now().hour ||
                          selectedDate.day != DateTime.now().day,
                      onTap: () {
                        setState(() {
                          selectedTheatre = theatre;
                          selectedTime = schedule[index];
                          isValid = true;
                        });
                      },
                    ),
                  ))));
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
  }
}
