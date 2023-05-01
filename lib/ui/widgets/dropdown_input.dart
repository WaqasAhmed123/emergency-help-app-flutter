import 'package:flutter/material.dart';

dropdownInput(
    {items, onChanged, selectedOptions, value, visible = true, hintText}) {
  return Visibility(
    visible: visible,
    child: Container(
      height: 54,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            blurRadius: 4,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: DropdownButtonFormField(
          style: TextStyle(
            fontSize: 13.0,
            // fontFamily: "Poppins",
            color: const Color(0xff0e0e0e),
            fontWeight: FontWeight.w500,
          ),
          value: selectedOptions,
          validator: (value) {
            if (value == null) {
              return ("Field can't be null");
            }
          },
          decoration: InputDecoration(
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 13.0,
                // fontFamily: "Poppins",
                color: const Color(0xff0e0e0e).withOpacity(0.3),
                fontWeight: FontWeight.w500,
              ),
              fillColor: Color(0xffffffff),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 16)),
          items: items,
          onChanged: onChanged),
    ),
  );
}
