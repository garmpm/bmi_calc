import 'package:flutter/material.dart';

class ContainerButton extends StatefulWidget {
  final double width;
  final double height;
  final Color bgColor;
  final Color bgColorSelected;
  final IconData icon;
  final String text;
  final bool isSelected;
  final Function() onTap;
  const ContainerButton(
      {super.key,
      this.width = 100,
      this.height = 25,
      this.bgColor = Colors.white,
      this.bgColorSelected = Colors.blue,
      required this.icon,
      required this.text,
      this.isSelected = false,
      required this.onTap});

  @override
  State<ContainerButton> createState() => _ContainerButtonState();
}

class _ContainerButtonState extends State<ContainerButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.isSelected ? widget.bgColorSelected : widget.bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: widget.height * 0.60,
              color:
                  !widget.isSelected ? widget.bgColorSelected : widget.bgColor,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: !widget.isSelected
                      ? widget.bgColorSelected
                      : widget.bgColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
