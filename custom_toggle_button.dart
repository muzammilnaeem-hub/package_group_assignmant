library custom_toggle_button;

import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final IconData icon1;
  final IconData icon2;
  final Color selectedColor;
  final Color unselectedColor;
  final ValueChanged<bool> onToggle;
  final bool initialValue;

  const CustomToggleButton({
    Key? key,
    required this.icon1,
    required this.icon2,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onToggle,
    this.initialValue = false,
  }) : super(key: key);

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initialValue;
  }

  void _toggle() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.onToggle(isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isSelected ? widget.selectedColor : widget.unselectedColor,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? widget.icon2 : widget.icon1,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
