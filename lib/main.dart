import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koa_test/features/thoughts/presentation/pages/thoughts_list_page.dart';
import 'package:koa_test/theme.dart';

const appTitle = 'KoaTest';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: koaTheme,
      home: const ThoughtsPage(),
    );
  }
}
