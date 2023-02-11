import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../common/widgets/themed_button.dart';

class ItemDescriptionWidget extends StatefulWidget {
  final String? initialDescription;
  final Function(String?) descriptionUpdated;

  const ItemDescriptionWidget({Key? key, required this.initialDescription, required this.descriptionUpdated}) : super(key: key);

  @override
  State<ItemDescriptionWidget> createState() => _ItemDescriptionWidgetState();
}

class _ItemDescriptionWidgetState extends State<ItemDescriptionWidget> {
  final descriptionController = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: HtmlEditor(
              controller: descriptionController,
              htmlEditorOptions: HtmlEditorOptions(
                hint: 'Description',
                initialText: widget.initialDescription,
              ),
              htmlToolbarOptions:
              const HtmlToolbarOptions(
                toolbarType: ToolbarType.nativeGrid,
              ),
              callbacks: Callbacks(
                  onChangeContent: widget.descriptionUpdated),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 140),
                child: ThemedButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Done',
                  height: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
