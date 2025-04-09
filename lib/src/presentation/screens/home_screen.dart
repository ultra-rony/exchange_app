import 'package:exchange_app/generated/l10n.dart';
import 'package:exchange_app/src/cubits/auth/auth_cubit.dart';
import 'package:exchange_app/src/cubits/cryptocurrency/cryptocurrency_cubit.dart';
import 'package:exchange_app/src/cubits/navigation/navigation_cubit.dart';
import 'package:exchange_app/src/presentation/screens/auth_screen.dart';
import 'package:exchange_app/src/presentation/screens/convert_screen.dart';
import 'package:exchange_app/src/presentation/screens/rates_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static final List<Widget> _widgetOptions = <Widget>[
    const RatesScreen(key: PageStorageKey('rate_screen')),
    const ConvertScreen(),
  ];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationState = context.watch<NavigationCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).app_name),
        leading:
            navigationState == 0
                ? IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    context.read<CryptocurrencyCubit>().fetchData();
                  },
                )
                : null,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthCubit>().logout();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.monetization_on_outlined),
            label: S.of(context).rates,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.swap_horiz),
            label: S.of(context).convert,
          ),
        ],
        currentIndex: navigationState,
        onTap: (index) {
          context.read<NavigationCubit>().setIndex(index);
        },
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthUnauthenticatedState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AuthScreen()),
            );
          }
        },
        child: _widgetOptions.elementAt(navigationState),
      ),
    );
  }
}
