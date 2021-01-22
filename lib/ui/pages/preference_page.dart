part of "pages.dart";

class PreferencePage extends StatefulWidget {
  final List<String> genres = [
    'Horror',
    'Music',
    'Action',
    'Drama',
    'War',
    'Crime'
  ];
  final List<String> languages = ['Bahasa', 'English', 'Jappanese', 'Korean'];

  final RegistrationData registrationData;
  PreferencePage(this.registrationData);

  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.registrationData.password = "";

        context
            .bloc<PageBloc>()
            .add(GoToRegistrationPage(widget.registrationData));
        return;
      },
      child: Scaffold(
          body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  margin: EdgeInsets.only(top: 20, bottom: 4),
                  child: GestureDetector(
                      onTap: () {
                        widget.registrationData.password = "";

                        context
                            .bloc<PageBloc>()
                            .add(GoToRegistrationPage(widget.registrationData));
                        return;
                      },
                      child: Icon(Icons.arrow_back)),
                ),
                Text("Select your four\nfavorite genres",
                    style: blackTextFont.copyWith(fontSize: 30)),
                SizedBox(height: 16),
                Wrap(
                  spacing: 24,
                  runSpacing: 14,
                  children: generateGenreWidgets(context),
                ),
                SizedBox(height: 26),
                Text("Select your four\nfavorite language",
                    style: blackTextFont.copyWith(fontSize: 30)),
                SizedBox(height: 16),
                Wrap(
                  spacing: 24,
                  runSpacing: 14,
                  children: generateLangWidgets(context),
                ),
                SizedBox(height: 16),
                Center(
                  child: FloatingActionButton(
                    child: Icon(Icons.arrow_forward),
                    backgroundColor: mainColor,
                    elevation: 0,
                    onPressed: () {
                      if (selectedGenres.length != 4) {
                        Flushbar(
                          duration: Duration(seconds: 2),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Please choose 4 favourite genres",
                        )..show(context);
                      } else {
                        widget.registrationData.selectedGenres = selectedGenres;
                        widget.registrationData.selectedLang = selectedLanguage;

                        context
                            .bloc<PageBloc>()
                            .add(GoToAccountConfirmationPage(widget.registrationData));
                        return;
                      }
                    },
                  ),
                ),
                SizedBox(height: 50),
              ],
            )
          ],
        ),
      )),
    );
  }

  List<Widget> generateGenreWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.genres
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedGenres.contains(e),
              onTap: () {
                onSelectedGenre(e);
              },
            ))
        .toList();
  }

  List<Widget> generateLangWidgets(BuildContextcontext) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.languages
        .map((e) => SelectableBox(
              e,
              width: width,
              isSelected: selectedLanguage.contains(e),
              onTap: () {
                setState(() {
                  selectedLanguage = e;
                });
              },
            ))
        .toList();
  }

  void onSelectedGenre(String genre) {
    if (selectedGenres.contains(genre)) {
      setState(() {
        selectedGenres.remove(genre);
      });
    } else {
      if (selectedGenres.length < 4) {
        setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }
}
