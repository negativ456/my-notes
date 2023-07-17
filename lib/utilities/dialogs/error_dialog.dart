import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(BuildContext context, String text) {
  return showGenericDialog(
      context: context,
      title: 'Error occured',
      content: text,
      optionBuilder: () => {'Ok': null});
}
