import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomChip extends StatefulWidget {
  final bool isSelected;
  final String text;
  final Widget destination;

  const CustomChip({
    Key key,
     this.isSelected,
     this.text,
     this.destination,
  }) : super(key: key);

  @override
  _CustomChipState createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => widget.destination,
          ),
        );
        print("${widget.text} Tapped");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: widget.isSelected ? primaryBg : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(3),
          ),
          border: Border.all(
            color: widget.isSelected ? primaryColor : gray,
          ),
        ),
        child: Text(
          widget.text,
          style: widget.isSelected ? purple12w400 : gray13w400,
        ),
      ),
    );
  }
}
