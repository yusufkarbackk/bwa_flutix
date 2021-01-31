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
        body: Center(
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
                                  context.bloc<PageBloc>().add(GoToMainPage());
                                },
                                child: Icon(Icons.arrow_back,
                                    color: Colors.black))),
                      ],
                    ),
                  ),
                  BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
                    if (userState is UserLoaded) {
                      return Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            margin: EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: (userState.user.profilePicture != "")
                                        ? NetworkImage(
                                            userState.user.profilePicture)
                                        : AssetImage("assets/user_pic.png"))),
                          ),
                          SizedBox(height: 10),
                          Text(userState.user.name,
                              style: blackTextFont.copyWith(fontSize: 18)),
                          SizedBox(height: 8),
                          Text(userState.user.email,
                              style: greyTextFont.copyWith(fontSize: 16)),
                          SizedBox(height: 30),
                          Row(
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
                                  style: blackTextFont.copyWith(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 28),
                          Row(
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
                                  style: blackTextFont.copyWith(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 28),
                          Row(
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
                                  style: blackTextFont.copyWith(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 28),
                          Row(
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
                                  style: blackTextFont.copyWith(fontSize: 16)),
                            ],
                          ),
                          SizedBox(height: 40),
                          Container(
                            width: 250,
                            height: 45,
                            child: RaisedButton(
                              color: Colors.red[400],
                              child: Text("Sign Out",
                                  style: whiteTextFont.copyWith(fontSize: 16)),
                              onPressed: () {
                                context.bloc<UserBloc>().add(SignOut());
                                AuthServices.SignOut();
                              },
                            ),
                          ),
                          SizedBox(height: 18)
                        ],
                      );
                    }
                  })
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
