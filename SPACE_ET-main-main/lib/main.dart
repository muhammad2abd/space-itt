import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:space_et_first_assignment/routes/intro.dart';
import 'package:space_et_first_assignment/routes/quiz.dart';
import 'package:space_et_first_assignment/routes/video.dart';


void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: const [Locale('fa', '')],
    path: 'languages',
    fallbackLocale: const Locale('fa'),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: debugDisableShadows,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      home: VideoPage(),
    );
  }
}
