import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:offer_informing_app/firebase_options.dart';
import 'package:offer_informing_app/screens/signin_screen.dart';
import 'package:offer_informing_app/services/pick_files_provider.dart';
import 'package:offer_informing_app/services/registration_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegistrationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PickFilesProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const SignInScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
