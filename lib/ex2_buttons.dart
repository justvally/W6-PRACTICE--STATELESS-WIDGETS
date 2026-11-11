import 'package:flutter/material.dart';

// EX 2 – The buttons (handout page: EX 2)
// A StatelessWidget called CustomButton. Use one enum for the button type
// and one enum for the icon position.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom buttons')),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(label: 'Submit', icon: Icons.check),
              SizedBox(height: 20),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                iconPosition: IconPosition.right,
                type: ButtonType.secondary,
              ),
              SizedBox(height: 20),
              CustomButton(
                label: 'Account',
                icon: Icons.account_tree,
                iconPosition: IconPosition.right,
                type: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  const ButtonType(this.color);
  final Color color;
}

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left, 
    this.type = ButtonType.primary, 
  });

  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(icon, color: Colors.white, size: 20);
    final textWidget = Text(
      label,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    );

    final List<Widget> children = iconPosition == IconPosition.left
        ? [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: iconWidget,
            ),
            textWidget,
          ]
        : [
            textWidget,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: iconWidget,
            ),
          ];
          
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}