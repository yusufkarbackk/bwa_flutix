part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(
        context); // menyimpan aktivitas trakhir user, sign in atau sign out

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(GoToSplashPage());
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context
            .bloc<UserBloc>()
            .add(LoadUser(firebaseUser.uid)); //mengambil user
        context
            .bloc<TicketBloc>()
            .add(GetTickets(firebaseUser.uid)); //mengambil ticket

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
                            : (pagestate is OnMovieDetailPage)
                                ? MovieDetailPage(pagestate.movie)
                                : (pagestate is OnSelectSchedulePage)
                                    ? SelectSchedulePage(pagestate.movieDetail)
                                    : (pagestate is OnSelectSeatPage)
                                        ? SelectSeatPage(pagestate.ticket)
                                        : (pagestate is OnCheckoutPage)
                                            ? CheckoutPage(pagestate.ticket)
                                            : (pagestate is OnSuccessPage)
                                                ? SuccessPage(pagestate.ticket,
                                                    pagestate.transaction)
                                                : (pagestate
                                                        is OnTicketDetailPage)
                                                    ? TicketDetailPage(
                                                        pagestate.ticket)
                                                    : (pagestate
                                                            is OnProfilePage)
                                                        ? ProfilePage()
                                                        : (pagestate
                                                                is OnTopUpPage)
                                                            ? TopUpPage(
                                                                pagestate
                                                                    .pageEvent)
                                                            : (pagestate
                                                                    is OnWalletPage)
                                                                ? WalletPage(
                                                                    pagestate
                                                                        .pageEvent)
                                                                : (pagestate
                                                                        is OnEditProfilePage)
                                                                    ? EditProfilePage(
                                                                        pagestate
                                                                            .user)
                                                                    : Mainpage());
  }
}
