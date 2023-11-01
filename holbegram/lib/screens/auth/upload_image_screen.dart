import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPicture extends StatefulWidget {
  final String email;
  final String password;
  final String username;

  AddPicture({
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  _AddPictureState createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  Uint8List? _image;

  void selectImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path).readAsBytesSync();
      });
    }
  }

  void selectImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.getImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path).readAsBytesSync();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Your widget code here
    // You can use _image to display the selected image or perform other actions.
    return Container(
      child: Column(
        children: [
          if (_image != null) Image.memory(_image!),
          ElevatedButton(
            onPressed: selectImageFromGallery,
            child: Text('Select Image from Gallery'),
          ),
          ElevatedButton(
            onPressed: selectImageFromCamera,
            child: Text('Select Image from Camera'),
          ),
        ],
      ),
    );
  }
}
