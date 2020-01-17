import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationPage(title: 'Image Picker Demonstartion'),
    );
  }
}

class UploadImage extends StatefulWidget{
  @override
   _UploadImageState createState() =>  _UploadImageState();
}

class _UploadImageState extends State<UploadImage>{
  File _image;
  
  Future selectImage(bool isCamera) async{
    File _capturedImage;
    if(isCamera){
      _capturedImage = await ImagePicker.pickImage(source: ImageSource.camera);
    }
    else{
      _capturedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _image = _capturedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.00),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.00,),
            Text('Upload Image', style: TextStyle(fontSize: 30.00, fontWeight: FontWeight.w500)),
            SizedBox(height: 20.00),
            //Center(child: Image.asset('assets/images/profile.jpg')),
            Container(
              decoration: BoxDecoration(),
              child: Stack(  
                children: <Widget>[
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.folder_open),
                      onPressed: (){
                        selectImage(true);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: (){
                        selectImage(false);
                      },
                    ),
                  ],),
                  _image == null ? Container() : Image.file(_image, height: 400.00, width: 300.00)
                ],
              ),
            ),
     
            SizedBox(height: 40.00),
            ListTile( 
              title: MaterialButton(
                      color: Colors.grey,
                      minWidth: double.infinity,
                      height: 50.00,
                      onPressed: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NextPage()));
                      },
                      child: Text('Upload', style: TextStyle(color: Colors.white)),
                    )
            )
          ],
          ),
      ),
    );
  }
  
}

