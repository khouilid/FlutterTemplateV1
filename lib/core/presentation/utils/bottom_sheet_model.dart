import 'package:flutter/material.dart';

openCustoumButtomSheet(BuildContext context,
    {required Widget child, double? maxHeight, double? minHeight}) {
  showModalBottomSheet(
    constraints: BoxConstraints(
      maxHeight: maxHeight ?? MediaQuery.of(context).size.height / 2,
      minHeight: minHeight ?? MediaQuery.of(context).size.height / 2,
    ),
    enableDrag: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Color(0xff5AAD84),
    isScrollControlled: true,
    isDismissible: true,
    context: context,
    builder: (context) {
      return CustomButtomSheet(child: child);
    },
  );
}

class CustomButtomSheet extends StatelessWidget {
  final Widget child;
  CustomButtomSheet({required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            width: double.infinity,
            child: Center(child: child),
          ),
        ),
      ],
    );
  }
}
