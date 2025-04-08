import 'package:exchange_app/core/app/themes/light_theme.dart';
import 'package:exchange_app/core/di/injectable.dart';
import 'package:exchange_app/generated/l10n.dart';
import 'package:exchange_app/src/cubits/auth/auth_cubit.dart';
import 'package:exchange_app/src/cubits/cryptocurrency/cryptocurrency_cubit.dart';
import 'package:exchange_app/src/cubits/navigation/navigation_cubit.dart';
import 'package:exchange_app/src/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final providers = [
  BlocProvider<NavigationCubit>(create: (context) => getIt<NavigationCubit>()),
  BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()..check()),
  BlocProvider<CryptocurrencyCubit>(
    create: (context) => getIt<CryptocurrencyCubit>()..fetchData(),
  ),
];

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: lightTheme,
        // darkTheme: darkTheme,
        // themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routes: {'/': (context) => const HomeScreen()},
      ),
    );
  }
}
