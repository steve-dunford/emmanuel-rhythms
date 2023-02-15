import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../common/widgets/themed_button.dart';

class ItemDescriptionWidget extends StatefulWidget {
  final String? initialDescription;
  final Function(String?) descriptionUpdated;

  const ItemDescriptionWidget({Key? key, required this.initialDescription, required this.descriptionUpdated}) : super(key: key);

  @override
  State<ItemDescriptionWidget> createState() => _ItemDescriptionWidgetState();
}

class _ItemDescriptionWidgetState extends State<ItemDescriptionWidget> {
  final descriptionController = HtmlEditorController(
  );
  String? _selectedFont = 'Avenir Next';
  bool _hasSetDefaultFont = false;

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
                filePath: "assets/editor_template.html"
              ),
              htmlToolbarOptions:
              HtmlToolbarOptions(
                toolbarType: ToolbarType.nativeGrid,
                defaultToolbarButtons: const [
                  StyleButtons(),
                  ColorButtons(),
                  FontSettingButtons(fontName: false),
                  FontButtons(),
                  ListButtons(),
                  ParagraphButtons(),
                  InsertButtons(),
                  OtherButtons(),
                ],
                customToolbarButtons: [
                  Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    height: kMinInteractiveDimension,
                    decoration:
                    BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.12))),
                    child: CustomDropdownButtonHideUnderline(
                      child: CustomDropdownButton<String>(
                        menuMaxHeight: MediaQuery.of(context).size.height / 3,
                        menuDirection: DropdownMenuDirection.down,
                        items: [
                          CustomDropdownMenuItem(
                            value: 'Avenir Next',
                            child: PointerInterceptor(
                                child: const Text('Avenir Next',
                                    style: TextStyle(
                                      fontFamily: 'Avenir Next',
                                    ))),
                          ),
                          CustomDropdownMenuItem(
                            value: 'MontSerrat',
                            child: PointerInterceptor(
                                child: const Text('MontSerrat',
                                    style: TextStyle(
                                      fontFamily: 'MontSerrat',
                                    ))),
                          ),
                          CustomDropdownMenuItem(
                            value: 'Courier New',
                            child: PointerInterceptor(
                                child: const Text('Courier New',
                                    style: TextStyle(fontFamily: 'Courier'))),
                          ),
                          CustomDropdownMenuItem(
                            value: 'sans-serif',
                            child: PointerInterceptor(
                                child: const Text('Sans Serif',
                                    style: TextStyle(fontFamily: 'sans-serif'))),
                          ),
                          CustomDropdownMenuItem(
                            value: 'Times New Roman',
                            child: PointerInterceptor(
                                child: const Text('Times New Roman',
                                    style: TextStyle(fontFamily: 'Times'))),
                          ),
                        ],
                        value: _selectedFont,
                        onChanged: (String? changed) async {
                          if (changed != null) {
                            descriptionController.execCommand('fontName', argument: changed);
                            setState(() {
                              _selectedFont = changed;
                            });
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
              callbacks: Callbacks(
                  onKeyDown: (_) {
                    //Default font
                    if(!_hasSetDefaultFont && widget.initialDescription == null) {
                      descriptionController.execCommand('fontName', argument: _selectedFont);
                      _hasSetDefaultFont = true;
                    }
                  },
                  onChangeContent: (newContent) {

                    widget.descriptionUpdated(newContent);
                  }),
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
