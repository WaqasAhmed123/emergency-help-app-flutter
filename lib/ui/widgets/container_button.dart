import 'package:flutter/material.dart';

containerButton({text, onTap, context, busy = false}) {
  return InkWell(
    onTap: onTap,
    child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor,
        ),
        child: busy
            ? CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black))
            : Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              )),
  );
}
