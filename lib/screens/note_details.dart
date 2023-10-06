import 'package:diary/widgets/spacer.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/textfield.dart';

class NoteDetailsView extends StatefulWidget {
  const NoteDetailsView({super.key, required this.appBartitle});

  final String appBartitle;

  @override
  State<NoteDetailsView> createState() => _NoteDetailsViewState(appBartitle);
}

class _NoteDetailsViewState extends State<NoteDetailsView> {
  String appBartitle;
  TextEditingController notefield = TextEditingController();

  _NoteDetailsViewState(this.appBartitle);
  @override
  void initState() {
    notefield = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    notefield.dispose();
    super.dispose();
  }

  //  final _priority = ["high", "low"];
  final _priority = ["high", "low"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Add Note"),
        title: Text(appBartitle),
      ),
      body: Column(
        children: [
          DropdownButton(

              // underline: false,
              elevation: 0,
              items: _priority.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                    value: dropDownStringItem, child: Text(dropDownStringItem));
              }).toList(),
              value: "low",
              onChanged: (String? value) {
                print("object");
              }),
          Container(
            padding: const EdgeInsets.all(19),
            child: const TextFieldWidget("title", "", TextInputType.text),
          ),
          spacer,
          Container(
            padding: const EdgeInsets.all(19),
            child: const TextFieldWidget("", "description", TextInputType.text),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                text: "Save",
                onpressed: () {},
              ),
              Button(
                text: "Delete",
                onpressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
