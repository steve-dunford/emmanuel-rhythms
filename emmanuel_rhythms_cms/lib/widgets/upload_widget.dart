import 'package:emmanuel_rhythms_cms/common/app_colours.dart';
import 'package:emmanuel_rhythms_cms/common/assets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class UploadWidget extends StatelessWidget {

  final void Function(PlatformFile) onFilePicked;
  final bool isUploading;
  final String? filename;
  final String? url;

  const UploadWidget({Key? key, required this.onFilePicked, required this.isUploading, this.filename, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await FilePicker.platform
            .pickFiles(allowMultiple: false);

        if (result?.count == 1) {
          onFilePicked(result!.files.first);
        }
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColours.emmanuelBlue),
                borderRadius: BorderRadius.circular(8.0)),
            width: 200,
            height: 48,
            child: isUploading
                ? const Center(
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator()),
            )
                : Center(
              child: Text(
                filename ?? '',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          const SizedBox(width: 10),
          if (url != null)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  if (url != null) {
                    html.AnchorElement anchorElement =
                    html.AnchorElement(
                        href: url);
                    anchorElement.download = url;
                    anchorElement.click();
                  }
                },
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset(Assets.downloadIcon),
                ),
              ),
            ),
        ],
      ),
    );
  }

}