import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/common/text_style.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/header_widget.dart';
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

        return Column(
        children: [
          HeaderWidget(),
          Expanded(
              child: Center(
                child: Column(
                  children: [
                    Text(
                        'Log In',
                        style: AppTextStyle
                            .theme(context)
                            .subtitle1
                    ),
                    _ValidatedField(
                        onChanged: (value) => model.email = value,
                        hint: 'Email',
                        error: model.emailError,
                    ),
                    _ValidatedField(
                      onChanged: (value) => model.password = value,
                      hint: 'Password',
                      error: model.passwordError,
                      isPassword: true,
                    ),
                  ],
                ),
              )
          )
        ],
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
              const BorderSide() :
              const BorderSide(color: AppColours.emmanuelBlue, width: 3.0),
            ),
          ),
        ),
        if(error != null)
          Text(
              error!,
              style: AppTextStyle
                  .theme(context)
                  .bodyText1
          )

      ],
    );
  }
}