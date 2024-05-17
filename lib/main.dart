import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/blocs/bloc_observer.dart';


import 'package:trim_spot_barber_side/firebase_options.dart';
import 'package:trim_spot_barber_side/screens/splash_screen.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/providers/main_providers_list.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: mainProviders,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
              textSelectionTheme:
                  TextSelectionThemeData(selectionHandleColor: cyanColor),
              bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: introductionColor,
              )),
          home: SplashScreen()),
    );
  }
}
