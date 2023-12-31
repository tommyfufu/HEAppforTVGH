import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_connection_test/games/colors_vs_words_game/colors_vs_word_ready_view.dart';
import 'package:number_connection_test/constants/routes.dart';
import 'package:number_connection_test/firebase_options.dart';
import 'package:number_connection_test/games/number_connection_game/number_connection_game_ending_view.dart';
import 'package:number_connection_test/games/number_connection_game/number_connection_game_ready_view.dart';
import 'package:number_connection_test/services/auth/auth_service.dart';
import 'package:number_connection_test/views/account_view.dart';
import 'package:number_connection_test/views/home_view.dart';
import 'package:number_connection_test/views/login_view.dart';
import 'package:number_connection_test/views/records_view.dart';
import 'package:number_connection_test/views/register_view.dart';
import 'package:number_connection_test/views/verified.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // lock the device orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home'),
      routes: {
        numberConnectionReadyRoute: (context) =>
            const NumberConnectionReadyView(),
        colorVsWordsGameRoute: (context) => const ColorsVsWordGameReadyView(),
        homeRoute: (context) => const HomeView(),
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        accountRoute: (context) => const AccountView(),
        recordsRoute: (context) => const RecordsView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        ncgameoverRoute: (context) => const NCGameOverView(),
        // cwgameoverRoute: (context) => const CWGameOverView(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const HomeView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
