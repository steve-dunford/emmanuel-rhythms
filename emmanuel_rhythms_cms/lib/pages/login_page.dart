import 'dart:js';

import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/common/text_style.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/header_widget.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/themed_button.dart';
import 'package:emmanuel_rhythms_cms/routes.dart';
import 'package:emmanuel_rhythms_cms/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(GetIt.I.get()),
      builder: (context, _) {

        final model = context.watch<LoginViewModel>();

        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
          children: [
            HeaderWidget(),
            Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Column(
                        children: [
                          Text(
                              'Log In',
                              style: AppTextStyle
                                  .theme(context)
                                  .subtitle1
                          ),
                          const SizedBox(height: 30),
                          _ValidatedField(
                              onChanged: (value) => model.email = value,
                              hint: 'Email',
                              error: model.emailError,
                          ),
                          const SizedBox(height: 30),
                          _ValidatedField(
                            onChanged: (value) => model.password = value,
                            hint: 'Password',
                            error: model.passwordError,
                            isPassword: true,
                          ),
                          const SizedBox(height: 30),
                          ThemedButton(onTap: () async {
                            if(await model.login()) {
                              Navigator.of(context).pushReplacementNamed(Routes.home);
                            }
                          },
                              isRunningOperation: model.isLoggingIn,
                              text: 'Log in')
                        ],
                      ),
                    ),
                  ),
                )
            )
          ],
      ),
        );
    });
  }
}

class _ValidatedField extends StatelessWidget {

  final Function(String) onChanged;
  final String hint;
  final String? error;
  final bool isPassword;

  const _ValidatedField({
    required this.onChanged,
    required this.hint,
    this.error,
    this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: onChanged,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: error == null ?
              const BorderSide(color: Colors.black, width: 1.0) :
              const BorderSide(color: AppColours.emmanuelBlue, width: 3.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
              const BorderSide(color: Colors.black, width: 1.0)
            ),
          ),
        ),
        if(error != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
                error!,
                style: AppTextStyle
                    .theme(context)
                    .bodyText1
            ),
          )

      ],
    );
  }
}