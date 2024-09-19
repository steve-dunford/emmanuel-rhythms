import 'package:easy_web_view/easy_web_view.dart';
import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/common/text_style.dart';
import 'package:emmanuel_rhythms_cms/common/widgets/themed_button.dart';
import 'package:emmanuel_rhythms_cms/models/church_v2.dart';
import 'package:emmanuel_rhythms_cms/models/download_type.dart';
import 'package:emmanuel_rhythms_cms/models/item_type.dart';
import 'package:emmanuel_rhythms_cms/models/items/item.dart';
import 'package:emmanuel_rhythms_cms/models/tag.dart';
import 'package:emmanuel_rhythms_cms/view_models/item_details_view_model.dart';
import 'package:emmanuel_rhythms_cms/view_models/tags_view_model.dart';
import 'package:emmanuel_rhythms_cms/widgets/item_description_widget.dart';
import 'package:emmanuel_rhythms_cms/widgets/scripture_reference_widget.dart';
import 'package:emmanuel_rhythms_cms/widgets/upload_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class ItemDetailsWidget extends StatefulWidget {
  final Item initialItem;

  const ItemDetailsWidget({Key? key, required this.initialItem})
      : super(key: key);

  @override
  State<ItemDetailsWidget> createState() => _ItemDetailsWidgetState();
}

class _ItemDetailsWidgetState extends State<ItemDetailsWidget> {
  final titleController = TextEditingController();
  final urlController = TextEditingController();
  final sortOrderController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.initialItem.title;
    if (widget.initialItem.url != null) {
      urlController.text = widget.initialItem.url!;
    }
    if (widget.initialItem.sortOrder != null) {
      sortOrderController.text = widget.initialItem.sortOrder!.toString();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ItemDetailsViewModel>();
    final tagsModel = context.watch<TagsViewModel>();

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
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text('Description:',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (ctx) => Dialog(
                                                child: ItemDescriptionWidget(
                                                    initialDescription:
                                                        viewModel
                                                            .item.description,
                                                    descriptionUpdated:
                                                        viewModel
                                                            .setDescription),
                                                backgroundColor: Colors.white,
                                              ));
                                    },
                                    child: Container(
                                        width: 400,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColours.emmanuelBlue),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: EasyWebView(
                                            key: ValueKey(viewModel.item.id),
                                            src: viewModel.item.description ??
                                                '',
                                            convertToWidgets: true,
                                          ),
                                        )),
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
                              child: Text('Tags',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ),
                            TableCell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: MultiSelectDialogField<Tag>(
                                  items: tagsModel.tags
                                      .map((t) => MultiSelectItem(t, t.name))
                                      .toList(),
                                  initialValue: viewModel.item.tags,
                                  listType: MultiSelectListType.CHIP,
                                  selectedColor: AppColours.emmanuelBlue,
                                  selectedItemsTextStyle: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.white),
                                  onConfirm: (values) {
                                    viewModel.setSelectedTags(values);
                                  },
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
                              child: Text('Churches',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ),
                            TableCell(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Wrap(
                                    runAlignment: WrapAlignment.center,
                                    children: ChurchV2.values
                                        .map((church) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(church.displayName,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2),
                                                  Checkbox(
                                                      value: viewModel
                                                          .isChurchSelected(
                                                              church),
                                                      onChanged: (selected) =>
                                                          viewModel
                                                              .setChurchSelected(
                                                                  church,
                                                                  selected ??
                                                                      false))
                                                ],
                                              ),
                                            ))
                                        .toList()),
                              ),
                            )
                          ],
                        ),
                        TableRow(children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text('Priority:',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Checkbox(
                                    value: viewModel.item.isPriority,
                                    onChanged: (selected) => viewModel
                                        .setIsPriority(selected ?? false)),
                              ),
                            ),
                          )
                        ]),
                        TableRow(children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text('Sort Order:',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  height: 48,
                                  width: 60,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter(
                                          RegExp('[0-9]'),
                                          allow: true)
                                    ],
                                    controller: sortOrderController,
                                    onChanged: viewModel.setSortOrder,
                                    decoration:
                                        AppTextStyle.textInputDecoration(
                                            '', false),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
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
    if (viewModel.selectedItemType.itemType == ItemType.devotional) {
      return _devotionalOptions(viewModel);
    } else if (viewModel.selectedItemType.itemType == ItemType.scripture) {
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
              ...(viewModel.item.scriptureReferences ?? [])
                  .map((ref) => Padding(
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
        ]),
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Text('Devotion Video URL:',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: 48,
                  width: 200,
                  child: TextField(
                    controller: urlController,
                    onChanged: viewModel.setUrl,
                    decoration: AppTextStyle.textInputDecoration('URL', false),
                  ),
                ),
              ),
            )
          ],
        )
      ];
    } else if (viewModel.selectedItemType.itemType == ItemType.vimeoVideo) {
      return [
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Text('Vimeo URL:',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: 48,
                  width: 200,
                  child: TextField(
                    controller: urlController,
                    onChanged: viewModel.setUrl,
                    decoration: AppTextStyle.textInputDecoration('URL', false),
                  ),
                ),
              ),
            )
          ],
        )
      ];
    } else if (viewModel.selectedItemType.itemType == ItemType.youtubeVideo) {
      return [
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Text('YouTube URL:',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: 48,
                  width: 200,
                  child: TextField(
                    controller: urlController,
                    onChanged: viewModel.setUrl,
                    decoration: AppTextStyle.textInputDecoration('URL', false),
                  ),
                ),
              ),
            )
          ],
        )
      ];
    } else if ([
      ItemType.anchorFMPodcast,
      ItemType.transistorFMPodcast,
      ItemType.soundcloudPodcast
    ].contains(viewModel.selectedItemType.itemType)) {
      return [
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child:
                  Text('Episode URL:', style: Theme.of(context).textTheme.bodyText1),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: 48,
                  width: 200,
                  child: TextField(
                    controller: urlController,
                    onChanged: viewModel.setUrl,
                    decoration: AppTextStyle.textInputDecoration('URL', false),
                  ),
                ),
              ),
            ),
          ],
        ),
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Text('Use Podcast Details:',
                style: Theme.of(context).textTheme.bodyText1),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Checkbox(
                  value: viewModel.item.usePodcastDetails ?? true,
                  onChanged: (selected) =>
                      viewModel.setUsePodcastDetails(selected ?? false)),
            ),
          )
        ])
      ];
    } else if (viewModel.selectedItemType.itemType == ItemType.download) {
      return [_uploadRow(viewModel, 'File:', DownloadType.fileDownload)];
    }
    return [];
  }

  TableRow _uploadRow(
          ItemDetailsViewModel viewModel, String caption, DownloadType type) =>
      TableRow(
        children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Text(caption, style: Theme.of(context).textTheme.bodyText1),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: UploadWidget(
                onFilePicked: (file) => viewModel.setDownload(type, file),
                isUploading: viewModel.isUploading(type),
                filename: viewModel.downloadFileName(type),
                url: viewModel.downloadUrl(type),
              ),
            ),
          )
        ],
      );

  List<TableRow> _devotionalOptions(ItemDetailsViewModel viewModel) {
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
            ...(viewModel.item.scriptureReferences ?? []).map((ref) => Padding(
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
      ]),
      _uploadRow(viewModel, 'Devotional Audio:', DownloadType.devotionalAudio),
      _uploadRow(viewModel, 'Devotional Transcript:',
          DownloadType.devotionalTranscript),
    ];
  }
}
