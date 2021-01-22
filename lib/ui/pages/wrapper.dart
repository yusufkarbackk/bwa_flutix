part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(GoToSplashPage());
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(GoToMainPage());
      }
    }
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pagestate) => (pagestate is OnSplashPage)
            ? SplashPage()
            : (pagestate is OnLoginPage)
                ? SignInPage()
                : (pagestate is OnRegistrationPage)
                    ? SignUpPage(pagestate.registrationData)
                    : (pagestate is OnPreferencePage)
                        ? PreferencePage(pagestate.registrationData)
                        : (pagestate is OnAccountConfirmationPage)
                            ? AccountConfirmationPage(
                                pagestate.registrationData)
                            : Mainpage());
  }
}
