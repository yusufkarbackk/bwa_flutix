part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
        body: Container(
          color: mainColor,
          child: Stack(
            children: [
              Center(
                  child: Container(
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
                                        context
                                            .bloc<PageBloc>()
                                            .add(GoToMainPage());
                                      },
                                      child: Icon(Icons.arrow_back,
                                          color: Colors.white))),
                            ],
                          ),
                        ),
                        BlocBuilder<UserBloc, UserState>(
                            builder: (_, userState) {
                          if (userState is UserLoaded) {
                            User user = userState.user;
                            return Column(
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: (user.profilePicture != "")
                                              ? NetworkImage(
                                                  user.profilePicture)
                                              : AssetImage(
                                                  "assets/user_pic.png"))),
                                ),
                                SizedBox(height: 10),
                                Text(user.name,
                                    style:
                                        whiteTextFont.copyWith(fontSize: 18)),
                                SizedBox(height: 8),
                                Text(user.email,
                                    style: greyTextFont.copyWith(fontSize: 16)),
                              ],
                            );
                          } else {
                            return SizedBox();
                          }
                        })
                      ],
                    )
                  ],
                ),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //NOTE: edit profile
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: 30,
                                left: defaultMargin,
                                right: defaultMargin),
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/account_circle_24px_outlined.png"),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text("Edit Profile",
                                    style:
                                        whiteTextFont.copyWith(fontSize: 16)),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                        onTap: () {
                                          context
                                              .bloc<PageBloc>()
                                              .add(GoToMainPage());
                                        },
                                        child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: Colors.white)))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 30,
                                left: defaultMargin,
                                right: defaultMargin),
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/account_balance_wallet_24px_outlined.png"),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text("My Wallet",
                                    style:
                                        whiteTextFont.copyWith(fontSize: 16)),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                        onTap: () {
                                          context
                                              .bloc<PageBloc>()
                                              .add(GoToMainPage());
                                        },
                                        child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: Colors.white)))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 30,
                                left: defaultMargin,
                                right: defaultMargin),
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/translate_24px_outlined.png"),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text("Change Language",
                                    style:
                                        whiteTextFont.copyWith(fontSize: 16)),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                        onTap: () {
                                          context
                                              .bloc<PageBloc>()
                                              .add(GoToMainPage());
                                        },
                                        child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: Colors.white)))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 30,
                                left: defaultMargin,
                                right: defaultMargin),
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/verified_user_24px_outlined.png"),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text("Help Centre",
                                    style:
                                        whiteTextFont.copyWith(fontSize: 16)),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                        onTap: () {
                                          context
                                              .bloc<PageBloc>()
                                              .add(GoToMainPage());
                                        },
                                        child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: Colors.white)))
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 250,
                      height: 45,
                      margin: EdgeInsets.only(bottom: 28),
                      child: RaisedButton(
                        color: Colors.red,
                        child: Text("Sign Out",
                            style: whiteTextFont.copyWith(fontSize: 16)),
                        onPressed: () {
                          context.bloc<UserBloc>().add(SignOut());
                          AuthServices.SignOut();
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
