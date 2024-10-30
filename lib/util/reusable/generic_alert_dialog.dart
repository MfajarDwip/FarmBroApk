import 'package:flutter/material.dart';

class GenericAlertDialog extends StatefulWidget {
  final String titleDialog;
  final String messageDialog;

  const GenericAlertDialog({
    super.key,
    required this.titleDialog,
    required this.messageDialog
  });

  @override
  State<GenericAlertDialog> createState() => _GenericAlertDialogState();
}

class _GenericAlertDialogState extends State<GenericAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titleDialog),
      content: Text(
        widget.messageDialog,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 15,
          fontFamily: 'Roboto',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(
            'Tidak',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.normal,
              fontSize: 15,
              fontFamily: 'RobotoCondensed',
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(
            'Ya',
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.normal,
                fontSize: 15,
                fontFamily: 'RobotoCondensed'
            ),
          ),
        ),
      ],
    );
  }
}
