import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/common/text_style.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/themed_button.dart';
import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/view_models/item_details_view_model.dart';
import 'package:emmanuel_rhythms_cms/widgets/scripture_reference_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:provider/provider.dart';

class ItemDetailsWidget extends StatefulWidget {
  final Item initialItem;

  const ItemDetailsWidget({Key? key, required this.initialItem})
      : super(key: key);

  @override
  State<ItemDetailsWidget> createState() => _ItemDetailsWidgetState();
}

class _ItemDetailsWidgetState extends State<ItemDetailsWidget> {
  final titleController = TextEditingController();
  final descriptionController = HtmlEditorController();

  @override
  void initState() {
    titleController.text = widget.initialItem.title;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ItemDetailsViewModel>();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text('Details', style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColours.emmanuelBlue),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Table(
                      columnWidths: const {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      children: <TableRow>[
                        TableRow(
                          children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text('Title:',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ),
                            TableCell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                  height: 48,
                                  width: 200,
                                  child: TextField(
                                    controller: titleController,
                                    onChanged: viewModel.setTitle,
                                    decoration:
                                        AppTextStyle.textInputDecoration(
                                            'Title', false),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.top,
                              child: Text('Description:',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ),
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColours.emmanuelBlue),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: HtmlEditor(
                                      otherOptions: const OtherOptions(
                                        height: 300,
                                      ),
                                      controller: descriptionController,
                                      htmlEditorOptions: HtmlEditorOptions(
                                        hint: 'Description',
                                        initialText: viewModel.item.description,
                                      ),
                                      htmlToolbarOptions:
                                          const HtmlToolbarOptions(
                                        toolbarType: ToolbarType.nativeGrid,
                                      ),
                                      callbacks: Callbacks(
                                          onChangeContent: (content) =>
                                              viewModel
                                                  .setDescription(content)),
                                    ),
                                  )),
                            )
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text('Image:',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ),
                            TableCell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    final result = await FilePicker.platform
                                        .pickFiles(allowMultiple: false);

                                    if (result?.count == 1) {
                                      viewModel.setImage(result!.files.first);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColours.emmanuelBlue),
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    width: 300,
                                    height: 120,
                                    child: viewModel.isSettingImage
                                        ? const Center(
                                            child: SizedBox(
                                                width: 40,
                                                height: 40,
                                                child:
                                                    CircularProgressIndicator()),
                                          )
                                        : viewModel.item.backgroundImage != null
                                            ? Image.network(
                                                viewModel.item.backgroundImage!)
                                            : null,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text('Item Type:',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: DropdownButton<ItemTypeOption>(
                                    value: viewModel.selectedItemType,
                                    items: viewModel.itemTypeOptions.map((e) {
                                      return DropdownMenuItem<ItemTypeOption>(
                                          value: e, child: Text(e.displayName));
                                    }).toList(),
                                    onChanged: viewModel.setItemType),
                              ),
                            )
                          ],
                        ),
                        ..._itemTypeOptions(context, viewModel)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TableRow> _itemTypeOptions(
      BuildContext context, ItemDetailsViewModel viewModel) {
    if (viewModel.selectedItemType.itemType == ItemType.scripture) {
      return [
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text('Scripture References:',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
          TableCell(
              child: Column(
            children: [
              ...(viewModel.item.scriptureReferences ?? []).map((ref) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ScriptureReferenceWidget(
                        initialReference: ref,
                        onChanged: (updatedRef) =>
                            viewModel.updateScriptureReference(updatedRef),
                        onDelete: (deletedRef) =>
                            viewModel.deleteScriptureReference(deletedRef)),
                  )),
              SizedBox(
                width: 140,
                child: ThemedButton(
                  onTap: () {
                    viewModel.addScriptureReference();
                  },
                  text: 'Add Reference',
                  height: 30,
                ),
              ),
            ],
          ))
        ])
      ];
    }
    return [];
  }
}
