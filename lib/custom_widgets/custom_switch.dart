import 'package:famerskart_rider_app/constants.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  bool isActive;

  Color activeColor;

  Color inActiveColor;

  CustomSwitch({
    Key key,
     this.isActive,
     this.activeColor,
     this.inActiveColor,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  static  bool _isActive;

  @override
  void initState() {
    _isActive = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: _isActive ? Alignment.centerRight : Alignment.centerLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          height: 20,
          width: 50,
        ),
        InkWell(
          onTap: () {
            setState(() {
              _isActive = !_isActive;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: _isActive ? widget.activeColor : widget.inActiveColor,
              border: Border.all(
                color: _isActive ? widget.activeColor : widget.inActiveColor,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(2),
              ),
            ),
            height: 30,
            width: 30,
            child: Center(
              child: Text(
                _isActive ? "Yes" : "No",
                style: white10w700,
              ),
            ),
          ),
        )
      ],
    );
  }
}
