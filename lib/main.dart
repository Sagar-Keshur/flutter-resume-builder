import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_builder/core/data/constants.dart';
import 'package:flutter_resume_builder/core/data/firebase_options.dart';
import 'package:flutter_resume_builder/core/utils/preferences.dart';
import 'package:flutter_resume_builder/provider/form_provider.dart';
import 'package:flutter_resume_builder/route.dart';
import 'package:flutter_resume_builder/views/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Preferences.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    String uid = const Uuid().v4();
    if (preferences.uid == nullValue) {
      preferences.uid = uid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FormProvider()),
      ],
      child: MaterialApp(
        title: productName,
        navigatorKey: defaultNavigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          inputDecorationTheme: const InputDecorationTheme(),
          textTheme: const TextTheme(),
          useMaterial3: true,
        ),
        initialRoute: HomePage.route,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
