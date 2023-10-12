import 'package:emmanuel_rhythms_cms/common/text_style.dart';
import 'package:emmanuel_rhythms_cms/common/utils.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/themed_button.dart';
import 'package:emmanuel_rhythms_cms/view_models/send_notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class SendNotificationWidget extends StatefulWidget {

  final VoidCallback dismiss;

  const SendNotificationWidget({Key? key, required this.dismiss}) : super(key: key);

  @override
  State<SendNotificationWidget> createState() => _SendNotificationWidgetState();
}

class _SendNotificationWidgetState extends State<SendNotificationWidget> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GetIt.I.get<SendNotificationViewModel>(),
      builder: (context, child) {

        final viewModel = context.watch<SendNotificationViewModel>();

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Send Notification', style: Theme.of(context).textTheme.headline5),
              const SizedBox(height: 20),
              TextField(
                controller: titleController,
                onChanged: viewModel.setTitle,
                decoration:
                AppTextStyle.textInputDecoration(
                    'Title', false),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: bodyController,
                onChanged: viewModel.setBody,
                maxLines: 3,
                minLines: 3,
                decoration:
                AppTextStyle.textInputDecoration(
                    'Body', false),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 140),
                    child: ThemedButton(
                      onTap: () async {
                        widget.dismiss();
                      },
                      text: 'Cancel',
                      height: 30,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 140),
                    child: ThemedButton(
                      onTap: () async {
                        bool confirm = await showConfirmationDialog(
                            context,
                            'Send Notification',
                            'This will send a notification to all users. Continue?');

                        if (confirm) {
                          if(await viewModel.sendNotification()) {
                            widget.dismiss();
                          }
                        }
                      },
                      text: 'Send',
                      height: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );

  }
}