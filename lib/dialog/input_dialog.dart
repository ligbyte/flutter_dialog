import 'package:flutter/material.dart';
import 'package:flutter_dialog/util/input_formatter/number_text_input_formatter.dart';
import 'package:flutter_dialog/util/theme_utils.dart';
import 'package:flutter_dialog/util/toast_utils.dart';
import 'package:flutter_dialog/widgets/base_dialog.dart';


class InputDialog extends StatefulWidget {

  const InputDialog({
    super.key,
    this.title,
    this.inputMaxPrice = 100000,
    required this.onPressed,
  });

  final String? title;
  final double inputMaxPrice;
  final void Function(String) onPressed;
  
  @override
  _InputDialog createState() => _InputDialog();
  
}

class _InputDialog extends State<InputDialog> {

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: widget.title,
      child: Container(
        height: 34.0,
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
        decoration: BoxDecoration(
          color: ThemeUtils.getDialogTextFieldColor(context),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: TextField(
          key: const Key('price_input'),
          autofocus: true,
          controller: _controller,
          //style: TextStyles.textDark14,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          // 金额限制数字格式
          inputFormatters: [UsNumberTextInputFormatter(max: widget.inputMaxPrice)],
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            border: InputBorder.none,
            hintText: '请输入${widget.title}',
            //hintStyle: TextStyles.textGrayC14,
          ),
        ),
      ),
      onPressed: () {
        if (_controller.text.isEmpty) {
          Toast.show('请输入${widget.title}');         
          return;
        }
        widget.onPressed(_controller.text);
      },
    );
  }
}
