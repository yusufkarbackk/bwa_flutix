part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSignIn = false; //apakah sedang melakukan proses sign in atau tidak

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: 100,
                          bottom: 120,
                        ),
                        child: Text('Welcome Back,\nMovie Mania',
                            style: blackTextFont.copyWith(fontSize: 20))),
                    Container(
                        height: 100,
                        width: 85,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/logo.png")))),
                  ],
                ),
                TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Email Address",
                        hintText: "Email Address")),
                SizedBox(height: 16),
                TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Password",
                        hintText: "Password")),
                SizedBox(height: 6),
                Row(
                  children: [
                    Text('Forgot Password? ',
                        style: greyTextFont.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                    Text('Get Now ',
                        style: purpleTextFont.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold))
                  ],
                ),
                Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.only(top: 40, bottom: 30),
                    child: FloatingActionButton(
                      child: Icon(Icons.arrow_forward),
                      backgroundColor: mainColor,
                      onPressed: () {},
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Start Fresh? ',
                        style: greyTextFont.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                    Text('Sign Up ',
                        style: purpleTextFont.copyWith(
                            fontSize: 12, fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
