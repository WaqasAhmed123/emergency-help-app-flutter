import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:squip/ui/widgets/dropdown_input.dart';
import 'package:squip/ui/widgets/input_field.dart';

userRequestInput({context, hintText, value, items}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Expanded(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
                scrollable: true,
                backgroundColor: Theme.of(context).primaryColor,
                title: Container(
                  // height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Create a New Task",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          // dropdownInput(hintText: hintText,value:value,items:items ),
                          // dropdownInput(hintText: hintText,value:value,items:items ),
                          SizedBox(
                            height: 10,
                          ),
                          // AddTask(
                          //     controller: title,
                          //     labelText: "Topic",
                          //     hintText: "Write Topic",
                          //     context:
                          //         context), //textfield for title of the list
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // AddTask(
                          //     controller: subtitle,
                          //     labelText: "Description",
                          //     hintText: "Write Description",
                          //     context:
                          //         context), //textfield for subtitle of the list

                          //textfield for date picking
                          // TextFormField(
                          //   style: Theme.of(context).textTheme.labelMedium,
                          //   controller: datepicker,
                          //   //editing controller of this TextField
                          //   decoration: InputDecoration(
                          //       enabledBorder: UnderlineInputBorder(
                          //           borderSide:
                          //               BorderSide(color: Colors.white)),
                          //       focusedBorder: UnderlineInputBorder(
                          //           borderSide:
                          //               BorderSide(color: Colors.white)),
                          //       focusColor: Colors.white,
                          //       floatingLabelBehavior:
                          //           FloatingLabelBehavior.always,
                          //       labelStyle:
                          //           Theme.of(context).textTheme.displaySmall,
                          //       icon: Icon(
                          //         Icons.calendar_today,
                          //         color: Colors.white,
                          //       ), //icon of text field
                          //       labelText: "Enter Date" //label text of field

                          //       ),
                          //   readOnly: true,
                          //   //..................................
                          //   //function for date picking
                          //   onTap: () async {
                          //     DateTime? datepicked = await showDatePicker(
                          //         confirmText: "Ok",
                          //         cancelText: "CANCEL",
                          //         context: context,
                          //         initialDate: DateTime.now(),
                          //         firstDate: DateTime(2020),
                          //         lastDate: DateTime(2099));
                          //     if (datepicked != null) {
                          //       print(
                          //           "Date picked is ${datepicked.day}-${datepicked.month}-${datepicked.year}");
                          //       String formattedDate =
                          //           DateFormat('dd-MM-yyyy').format(datepicked);
                          //       setState(() {
                          //         datepicker.text = formattedDate;
                          //       });
                          //       globaldisplaymonth =
                          //           DateFormat.MMM().format(datepicked);
                          //       globaldisplayday =
                          //           DateFormat.d().format(datepicked);
                          //     }
                          //   },
                          // ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "CANCEL",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  )),
                              // DialogueButton(
                              //   button_text,
                              //   Theme.of(context).textTheme.displaySmall,
                              // ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        );
      });
}
