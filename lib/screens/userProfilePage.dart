// import 'package:flutter/material.dart';
// import 'package:nagp_quizup/screens/loginPage.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// class UserProfilePage extends StatefulWidget {
//   final String email;
//   final String title;

//   UserProfilePage({required Key key, required this.title, required this.email})
//       : super(key: key);

//   @override
//   _UserProfilePageState createState() => _UserProfilePageState();
// }

// class _UserProfilePageState extends State<UserProfilePage> {
//   late String _name;
//   late int _age;
//   late String _password;
//   late String _phoneNumber;
//   late File _profilePicture;

//   final _formKey = GlobalKey<FormState>();

//   Future<void> _pickImage() async {
//     File image = await ImagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image = image;
//     });
//   }

//   Future<void> _saveImage() async {
//     final String path = (await getApplicationDocumentsDirectory()).path;
//     final String imagePath = '$path/${DateTime.now()}.png';
//     _image.copy(imagePath);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(16.0),
//               child: Text(
//                 'Email: ${widget.email}',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(16.0),
//               child: TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null) return null;
//                   if (value.isEmpty) {
//                     return 'Please enter a name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   setState(() {
//                     if (value == null) {
//                       _name = '';
//                     } else {
//                       _name = value;
//                     }
//                   });
//                 },
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(16.0),
//               child: TextFormField(
//                 decoration: InputDecoration(labelText: 'Age'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null) return null;
//                   if (value.isEmpty) {
//                     return 'Please enter an age';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   setState(() {
//                     if (value == null) {
//                       _age = 0;
//                     } else {
//                       _age = int.parse(value);
//                     }
//                   });
//                 },
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(16.0),
//               child: TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null) return null;
//                   if (value.isEmpty) {
//                     return 'Please enter a password';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   setState(() {
//                     if (value != null) _password = value;
//                   });
//                 },
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(16.0),
//               child: TextFormField(
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//                 keyboardType: TextInputType.phone,
//                 validator: (value) {
//                   if (value == null) return null;
//                   if (value.isEmpty) {
//                     return 'Please enter a phone number';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   setState(() {
//                     if (value != null) _phoneNumber = value;
//                   });
//                 },
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(16.0),
//               child: _profilePicture == null
//                   ? Text('No image selected.')
//                   : Image.file(_profilePicture),
//             ),
//             Container(
//               padding: EdgeInsets.all(16.0),
//               child: RaisedButton(
//                 onPressed: () {
//                   showModalBottomSheet(
//                     context: context,
//                     builder: (context) => Container(
//                       height: 200.0,
//                       child: Column(
//                         children: [
//                           ListTile(
//                             leading: Icon(Icons.camera),
//                             title: Text('Take a picture'),
//                             onTap: () {
//                               // Add code to take a picture
//                             },
//                           ),
//                           ListTile(
//                             leading: Icon(Icons.image),
//                             title: Text('Choose from gallery'),
//                             onTap: () {
//                               // Add code to choose a picture from the gallery
//                               _pickImage();
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text('Choose Profile Picture'),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(16.0),
//               child: RaisedButton(
//                 onPressed: () {
//                   if (_formKey.currentContext != null) {
//                     if (_formKey.currentState.validate()) {
//                       _saveImage();

//                       if (_formKey.currentState != null) {
//                         _formKey.currentState.save();
//                       }
//                     }

//                     // Add code to update the user profile
//                   }
//                 },
//                 child: Text('Update Profile'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
