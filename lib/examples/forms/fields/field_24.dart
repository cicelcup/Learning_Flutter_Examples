import 'package:flutter/material.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

class Field24 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderFilePicker(
      attribute: "file",
      decoration: InputDecoration(labelText: "Attachments"),
      maxFiles: 5,
      multiple: true,
      previewImages: false,
      onChanged: (val) => print(val),
      fileType: FileType.any,
      selector: Icon(
        Icons.insert_drive_file,
        color: Colors.green,
      ),
    );
  }
}
