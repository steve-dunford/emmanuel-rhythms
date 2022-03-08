import 'package:emmanuel_rhythms_cms/common/text_style.dart';
import 'package:emmanuel_rhythms_cms/routes.dart';
import 'package:emmanuel_rhythms_cms/view_models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authModel = context.watch<AuthModel>();

    return Row(
      children: [
        Image.asset('assets/emmanuel_logo_home.jpg'),
        if (authModel.currentUser != null)
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () async {
                        await authModel.logout();
                        Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false);
                      },
                      child: Text('Logout',
                          style: AppTextStyle.theme(context).headline6),
                    ),
                  )))
      ],
    );
  }
}
