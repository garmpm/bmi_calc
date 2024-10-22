import 'package:flutter/material.dart';

class DecoratedIconButton extends StatefulWidget {
  final double size;
  final Color bgColor;
  final Color bgColorSelected;
  final IconData icon;
  final bool isSelected;
  final Function() onTap;
  const DecoratedIconButton(
      {super.key,
      this.size = 50,
      this.bgColor = Colors.white,
      this.bgColorSelected = Colors.blue,
      required this.icon,
      this.isSelected = false,
      required this.onTap});

  @override
  State<DecoratedIconButton> createState() => _DecoratedIconButtonState();
}

class _DecoratedIconButtonState extends State<DecoratedIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.isSelected ? widget.bgColorSelected : widget.bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Icon(
            widget.icon,
            size: widget.size * 0.50,
            color: !widget.isSelected ? widget.bgColorSelected : widget.bgColor,
          ),
        ),
      ),
    );
  }
}
