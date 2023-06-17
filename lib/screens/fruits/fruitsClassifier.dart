import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miniproject/screens/buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class FruitsClassifier extends StatefulWidget {
  static const String id = 'fruitsClassifier';
  @override
  _FruitsClassifierState createState() => _FruitsClassifierState();
}

class _FruitsClassifierState extends State<FruitsClassifier> {
  final picker = ImagePicker();
  File _image;
  bool _loading = false;
  List _output;

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

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
      // setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 130,
      // threshold: 0.5,
    );

    setState(() {
      _loading = false;
      _output = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/fruits/model.tflite',
      labels: 'assets/fruits/labels.txt',
    );
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
                    Text("Fruits ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                    Text("Classifier",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.teal),),
                  ],
                ),),
              )

            ],

          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  'Fruits Classification',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 28),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        width: 200,
                        // height: 250,
                        child: Center(
                          child: _loading
                              ? Container(
                            width: 150,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    height: 180,
                                    child: Image.asset(
                                      'assets/fruits.png',
                                      scale: 0.6,
                                    )),
                                SizedBox(
                                  height: 60,
                                ),
                              ],
                            ),
                          )
                              : Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      _image,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                _output != null
                                    ? Text(
                                  'Prediction is: ${_output[0]['label']}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0),
                                )
                                    : Container(),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            AppButton(
                              onClick: pickImage,
                              btnText: 'From Camera',
                            ),
                            SizedBox(height: 15),
                            AppButton(
                              onClick: pickGalleryImage,
                              btnText: 'From Gallery',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
