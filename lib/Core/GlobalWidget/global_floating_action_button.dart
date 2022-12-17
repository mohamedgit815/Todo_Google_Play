import 'package:flutter/material.dart';

class GlobalFloatingActionButton extends StatelessWidget {
  final VoidCallback onPress;
  final Widget child;
  final ValueKey? valueKey;

  const GlobalFloatingActionButton({
    Key? key ,
    this.valueKey ,
    required this.child ,
    required this.onPress
  }) : super(key: key);

  @override
  FloatingActionButton build(BuildContext context) {
    return FloatingActionButton(
      key: valueKey ,
        onPressed: onPress ,
        child: child ,
    );
  }
}
