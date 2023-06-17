import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miniproject/screens/buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class GenderClassification extends StatefulWidget {
  static const String id = 'genderClassification';
  @override
  _GenderClassificationState createState() => _GenderClassificationState();
}

class _GenderClassificationState extends State<GenderClassification> {
  bool _loading = false;
  File _image;
  List _output;
  final picker = ImagePicker();

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);

    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _loading = false;
      _output = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/gender/model_unquant.tflite',
      labels: 'assets/gender/labels.txt',
    );
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(children: [
                Container(height: 100,width:100,decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1.2),
                    colors: <Color>[
                      Color(0xff008080),
                      Color(0xff008080),
                      Color(0xff000000),
                    ],
                    tileMode: TileMode.repeated,
                  ),),),
                Padding(
                  padding: const EdgeInsets.only(top: 50,left:40),
                  child: InkWell(
                      onTap: (){ Navigator.pop(context);
                      },
                      child: Image.asset("assets/back.png",height: 25,width: 25,)),
                )
              ],),
              Padding(
                padding: const EdgeInsets.only(right: 70,top: 40),
                child: Center(child: Column(
                  children: [
                    Text("Gender ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                    Text("Classifier",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.teal),),
                  ],
                ),),
              )

            ],

          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Detect Gender',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 28),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: _loading
                    ? Container(
                  width: 250,
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/gender.png'),
                      SizedBox(height: 50),
                    ],
                  ),
                )
                    : Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 250,
                          child: Image.file(_image),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        _output != null
                            ? Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text('It\'s ${_output[0]['label']}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0)),
                        )
                            : Container(),
                      ],
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AppButton(
                      onClick: pickImage,
                      btnText: 'From Camera',
                    ),
                    AppButton(
                      onClick: pickGalleryImage,
                      btnText: 'From Gallery',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
