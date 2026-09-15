import 'package:flutter/material.dart';
import 'package:flutter_dialog/widgets/base_dialog.dart';

import '../res/dimens.dart';
import '../res/gaps.dart';
import '../widgets/load_image.dart';

/// design/3订单/index.html#artboard5
class SingleChoiceeDialog extends StatefulWidget {

  const SingleChoiceeDialog({
    super.key,
    this.onPressed,
  });

  final void Function(int, String)? onPressed;
  
  @override
  _SingleChoiceeDialog createState() => _SingleChoiceeDialog();
  
}

class _SingleChoiceeDialog extends State<SingleChoiceeDialog> {

  int _value = 0;
  final _list = ['模板1', '模板2', '模板3', '模板4'];

  Widget _buildItem(int index) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        child: SizedBox(
          height: 42.0,
          child: Row(
            children: <Widget>[
              Gaps.hGap16,
              Expanded(
                child: Text(
                  _list[index],
                  style: _value == index ? TextStyle(
                    fontSize: Dimens.font_sp14,
                    color: Theme.of(context).primaryColor,
                  ) : null,
                ),
              ),
              Visibility(
                visible: _value == index,
                child: const LoadAssetImage('order/ic_check', width: 16.0, height: 16.0)),
              Gaps.hGap16,
            ],
          ),
        ),
        onTap: () {
          if (mounted) {
            setState(() {
              _value = index;
            });
          }
        },
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '模板选择',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_list.length, (i) => _buildItem(i))
      ),
      onPressed: () {
        widget.onPressed?.call(_value, _list[_value]);
      },
    );
  }
}
