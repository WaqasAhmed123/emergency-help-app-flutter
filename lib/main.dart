import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squip/app/app.bottomsheets.dart';
import 'package:squip/app/app.dialogs.dart';
import 'package:squip/app/app.router.dart';
import 'package:squip/models/serviceprovider_model.dart';
import 'package:squip/models/user_model.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.locator.dart';
import 'firebase_options.dart';

Future<String> getInitialRoute() async {
  final prefs = await SharedPreferences.getInstance();
  // final serviceProviderId = prefs.getString("userId");
  if (prefs.containsKey("userId") && prefs.getBool("isLoggedIn") == true) {
    await UserModel.getDataFromFirebase();
    return Routes.homeView;
  }
  if (prefs.containsKey("serviceProviderId") &&
      prefs.getBool('isLoggedIn') == true) {
    await ServiceProviderModel.getDataFromFirebase();
    return Routes.dashboardServiceProviderView;
  }
  return Routes.startupView;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String initialRoute = await getInitialRoute();
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(MyApp(initialRoute: initialRoute));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String initialRoute;
  MyApp({super.key, required this.initialRoute});
  @override
  Widget build(BuildContext context) {
    const Map<int, Color> color = {
      50: Color.fromRGBO(50, 205, 48, .1),
      100: Color.fromRGBO(50, 205, 48, .2),
      200: Color.fromRGBO(50, 205, 48, .3),
      300: Color.fromRGBO(50, 205, 48, .4),
      400: Color.fromRGBO(50, 205, 48, .5),
      500: Color.fromRGBO(50, 205, 48, .6),
      600: Color.fromRGBO(50, 205, 48, .7),
      700: Color.fromRGBO(50, 205, 48, .8),
      800: Color.fromRGBO(50, 205, 48, .9),
      900: Color.fromRGBO(50, 205, 48, 1),
    };

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0XFF32CD30),
          primarySwatch: const MaterialColor(0XFF32CD30, color),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w900, color: Colors.black),
            titleMedium: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w900, color: Colors.black),
            titleSmall: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w900, color: Colors.black),
            labelLarge: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w900, color: Colors.white),
          )),

      initialRoute: initialRoute,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
