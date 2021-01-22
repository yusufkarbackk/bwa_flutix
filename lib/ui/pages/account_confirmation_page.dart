part of "pages.dart";

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;
  AccountConfirmationPage(this.registrationData);
  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<PageBloc>()
            .add(GoToPreferencePage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Column(
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
                                  context.bloc<PageBloc>().add(
                                      GoToPreferencePage(
                                          widget.registrationData));
                                },
                                child: Icon(Icons.arrow_back,
                                    color: Colors.black))),
                        Center(
                            child: Text('Confirm Your\nAccount',
                                style: blackTextFont.copyWith(fontSize: 20),
                                textAlign: TextAlign.center))
                      ],
                    ),
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  (widget.registrationData.profileImage == null)
                                      ? AssetImage("assets/user_pic.png")
                                      : FileImage(
                                          widget.registrationData.profileImage),
                              fit: BoxFit.cover))),
                  SizedBox(
                    height: 26,
                  ),
                  Text("Welcome", style: blackTextFont.copyWith(fontSize: 20)),
                  Text(widget.registrationData.name,
                      textAlign: TextAlign.center,
                      style: blackTextFont.copyWith(fontSize: 26)),
                  SizedBox(
                    height: 26,
                  ),
                  (isSigningUp)
                      ? SpinKitFadingCircle(
                          color: Color(0xFF3E9D9D),
                          size: 45,
                        )
                      : SizedBox(
                          width: 250,
                          height: 45,
                          child: RaisedButton(
                              color: Color(0xFF3E9D9D),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text("Create My Account",
                                  style: whiteTextFont.copyWith(fontSize: 16)),
                              onPressed: () async {
                                setState(() {
                                  isSigningUp = true;
                                });

                                imageFileToUpload =
                                    widget.registrationData.profileImage;

                                SignInSignUpResult result =
                                    await AuthServices.SignUp(
                                        widget.registrationData.email,
                                        widget.registrationData.password,
                                        widget.registrationData.name,
                                        widget.registrationData.selectedGenres,
                                        widget.registrationData.selectedLang);

                                if (result.user == null) {
                                  setState(() {
                                    isSigningUp = false;
                                  });

                                  Flushbar(
                                      duration: Duration(seconds: 2),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: Color(0xFFFF5C83),
                                      message: result.message)
                                    ..show(context);
                                }
                              }),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
