import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/common/assets.dart';
import 'package:emmanuel_rhythms_cms/common/text_style.dart';
import 'package:emmanuel_rhythms_cms/models/header_command.dart';
import 'package:emmanuel_rhythms_cms/routes.dart';
import 'package:emmanuel_rhythms_cms/view_models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatelessWidget {
  final List<HeaderCommand> commands;

  const HeaderWidget({this.commands = const []});

  @override
  Widget build(BuildContext context) {
    final authModel = context.watch<AuthModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          SizedBox(height: 40, child: Image.asset(Assets.emmanuelLogoHome)),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...commands.map((command) => Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColours.emmanuelBlue, width: 3)
                          ),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                                onTap: command.onTap,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (command.assetName != null)
                                        Image.asset(command.assetName!, height: 30,),
                                      Text(command.caption,
                                          style: AppTextStyle.theme(context).headline6)
                                    ],
                                  ),
                                )),
                          ),
                        )),
                        if (authModel.currentUser != null)
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () async {
                                await authModel.logout();
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    Routes.login, (route) => false);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColours.emmanuelBlue, width: 3)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                    child: Text('Logout',
                                        style: AppTextStyle.theme(context).headline6),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
