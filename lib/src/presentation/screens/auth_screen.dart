import 'package:exchange_app/generated/l10n.dart';
import 'package:exchange_app/src/cubits/auth/auth_cubit.dart';
import 'package:exchange_app/src/presentation/screens/home_screen.dart';
import 'package:exchange_app/src/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _loginTextField = TextEditingController();
  final _passwordTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final state = context.watch<AuthCubit>().state;
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthWrongDataState) {}
          if (state is AuthAuthenticatedState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.25),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).welcome_text,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: screenSize.height * 0.07),
                    Text(
                      S.of(context).login_text,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    TextFormField(
                      controller: _loginTextField,
                      onChanged: (value) {
                        context.read<AuthCubit>().reset();
                      },
                      decoration: InputDecoration(
                        errorText:
                            state is AuthWrongDataState
                                ? state.errorText
                                : null,
                      ),
                    ),
                    Text(
                      S.of(context).password_text,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    TextField(
                      controller: _passwordTextField,
                      onChanged: (value) {
                        context.read<AuthCubit>().reset();
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText:
                            state is AuthWrongDataState
                                ? state.errorText
                                : null,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    CustomButtonWidget(
                      onTap: () {
                        context.read<AuthCubit>().login(
                          _loginTextField.text,
                          _passwordTextField.text,
                        );
                      },
                      title: S.of(context).sign_in_text,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height * 0.5),
            ],
          ),
        ),
      ),
    );
  }
}
