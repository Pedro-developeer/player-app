import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:player/constants.dart';
import 'package:player/error.dart';
import 'package:player/screens/Settings/setting_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:player/loading.dart';
import 'manager/page_manager.dart';
import 'screens/Home/home_page.dart';
import 'services/notification.dart';
import 'services/service_locator.dart';

Future initializeHive() async {
  await Hive.initFlutter();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeHive();

  if (await Permission.storage.isDenied) {
    await Permission.storage.request();
  }

  if (await Permission.storage.isGranted) {
    await setupServiceLocator();
    runApp(const ProviderScope(child: MyApp()));
    return;
  }

  runApp(const Error());
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  int selectedIndex = 0;
  late Future _isLoading;

  List screens = const [HomePage(), SettingPage()];

  @override
  void initState() {
    super.initState();
    _isLoading = getIt<PageManager>().init();
    getIt<NotificatioService>().init();
  }

  @override
  void dispose() {
    getIt<PageManager>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      home: FutureBuilder(
        future: _isLoading,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: Constants.colorBackGround,
              body: screens[selectedIndex],
              bottomNavigationBar: navBar(context),
            );
          }
          return const Loading();
        },
      ),
    );
  }

  NavigationBar navBar(context) {
    return NavigationBar(
      backgroundColor: Constants.colorBackGround,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home_outlined),
          selectedIcon: Icon(
            Icons.home_filled,
            color: Constants.colorPrimaryWhite,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.settings,
            color: Constants.colorPrimaryWhite,
          ),
          selectedIcon: Icon(
            Icons.settings,
            color: Constants.colorPrimaryWhite,
          ),
          label: 'Settings',
        ),
      ],
      onDestinationSelected: (index) => setState(() => selectedIndex = index),
      selectedIndex: selectedIndex,
      animationDuration: const Duration(milliseconds: 900),
    );
  }
}
