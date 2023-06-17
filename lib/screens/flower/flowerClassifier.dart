import 'dart:io';
import 'package:flutter/material.dart';
import 'package:miniproject/screens/buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class FlowerClassifier extends StatefulWidget {
  static const String id = 'flowerClassifier';

  @override
  _FlowerClassifierState createState() => _FlowerClassifierState();
}

class _FlowerClassifierState extends State<FlowerClassifier> {
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
        numResults: 5,
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
      model: 'assets/flowers/model.tflite',
      labels: 'assets/flowers/labels.txt',
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
                    Text("Flowers ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                    Text("Classifier",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.teal),),
                  ],
                ),),
              )

            ],

          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  'Detect Flowers',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        child: Center(
                          child: _loading
                              ? Container(
                                  width: 150,
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset('assets/flowers.png'),
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
                                              'It\'s ${_output[0]['label']}',
                                              style: TextStyle(
                                                  color: Colors.white,
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
                          ))
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
