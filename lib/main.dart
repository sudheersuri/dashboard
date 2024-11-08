import 'package:dashboard/providers/global_state.dart';
import 'package:dashboard/responsive/desktop_body.dart';
import 'package:dashboard/responsive/mobile_body.dart';
import 'package:dashboard/responsive/responsive_layout.dart';
import 'package:dashboard/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
 
  @override
  Widget build(BuildContext context) {
     final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard App',
      theme: themeMode == 'light' ? lightmode : darkmode,
      home: const MyHomePage(title: ''),
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
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        toolbarHeight: 0,
      ),
      body: ResponsiveLayout(mobileBody: MobileBody(), desktopBody: DesktopBody()),
    );
  }
}