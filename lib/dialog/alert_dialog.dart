import 'package:flutter/material.dart';
import 'package:flutter_dialog/res/styles.dart';
import 'package:flutter_dialog/widgets/base_dialog.dart';

class AlertDialog extends StatefulWidget {

  final String? title;
  final String? content;
  final void Function(String) onPressed;

  const AlertDialog({
    super.key,
    this.title,
    this.content = "内容",
    required this.onPressed,
  });

  @override
  _AlertDialog createState() => _AlertDialog();
  
}

class _AlertDialog extends State<AlertDialog> {

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: widget.title,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Text(widget.content!, style: TextStyles.textSize16),
      ),
      onPressed: () {

      },
    );
  }
}
