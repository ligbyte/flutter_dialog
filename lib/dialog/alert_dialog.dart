import 'package:flutter/material.dart';
import 'package:flutter_dialog/res/styles.dart';
import 'package:flutter_dialog/widgets/base_dialog.dart';

class AlertDialog extends StatefulWidget {

  const AlertDialog({
    super.key,
  });

  @override
  _AlertDialog createState() => _AlertDialog();
  
}

class _AlertDialog extends State<AlertDialog> {

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '提示',
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Text('您确定要退出登录吗？', style: TextStyles.textSize16),
      ),
      onPressed: () {

      },
    );
  }
}
