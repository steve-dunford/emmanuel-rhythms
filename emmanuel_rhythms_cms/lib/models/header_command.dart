import 'package:flutter/cupertino.dart';

class HeaderCommand {
  final String caption;
  final String? assetName;
  final VoidCallback onTap;

  HeaderCommand({
    required this.caption,
    required this.onTap,
    this.assetName});
}