import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rewire/provider/user_provider.dart';
import 'package:rewire/screens/authentication_screen/signUp_screen.dart';
import 'package:rewire/screens/integrativeTherapy_screen/integrativeTherapy_Videoscreen.dart';
import 'package:rewire/screens/onboarding_screen/onboarding_screen.dart';
import 'package:rewire/screens/onboarding_screen/splash_screen.dart';
import 'package:rewire/services/apple_auth_service.dart';
import 'package:rewire/services/apple_sign_in_available.dart';
import 'package:rewire/video_player.dart';

Future<void> main() async {
  runApp(const MyApp());
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final appleSignInAvailable = await AppleSignInAvailable.check();
    runApp(Provider<AppleSignInAvailable>.value(
      value: appleSignInAvailable,
      child: const MyApp(),
    ));
  } catch (e) {
    print('Error in fetching the cameras: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => AuthServiceApple()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        /* ChangeNotifierProvider(
          create: (context) => (
              FacebookAuth.instance, Permission.appTrackingTransparency),
        ),*/
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
