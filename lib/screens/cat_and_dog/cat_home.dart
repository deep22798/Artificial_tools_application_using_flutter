import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';


class catHome extends StatefulWidget {
  const catHome({Key key}) : super(key: key);

  @override
  State<catHome> createState() => _catHomeState();
}

class _catHomeState extends State<catHome> {

  bool _loading = true;
   List output;
   File image;
   String n;

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadMode().then((value) {
      setState(() {});
    });
  }



  detectImage(File image) async {
    var res = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 3,
      threshold: 0.6,
      asynch: true,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      print( res);
      output = res;
      _loading = false;
    });
  }

  loadMode() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }




  pickImage() async {
    var img = await picker.pickImage(source: ImageSource.camera);
    if (img == null) return null;

    setState(() {
      image = File(img.path);
    });

    detectImage(image);
  }


  pickGalleryImage() async {
    var img = await picker.pickImage(source: ImageSource.gallery);
    if (img == null) return null;

    setState(() {
      image = File(img.path);
    });

    detectImage(image);
  }

  @override
  void dispose() {
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
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
                    Text("Cat & Dog",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                    Text("Specifier",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.teal),),
                  ],
                ),),
              )

            ],

          ),
          SizedBox(height: 10,),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: 50.0,
                  ),
                  Center(
                    child: _loading
                        ? Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Column(
                        children: [
                          Image.asset('assets/catndog.png'),
                          SizedBox(
                            height: 50.0,
                          )
                        ],
                      ),
                    )
                        : Container(
                      child: Column(
                        children: [
                          Container(
                            height: 250.0,
                            child: Image.file(image),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          output != null
                              ? Text(
                            '${output[0]['label']}',
                            style: TextStyle(
                                color: Colors.black, fontSize: 15.0),
                          )
                              : Container(),
                          SizedBox(
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                            child: Text(
                              'Capture a Photo',
                              style: TextStyle(color: Colors.white, fontSize: 16.0),
                            ),
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 18.0),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(1, 0.1),
                                  colors: <Color>[
                                    Color(0xff008080),
                                    Color(0xff000000),


                                  ],
                                  tileMode: TileMode.mirror,
                                ),
                                borderRadius: BorderRadius.circular(6.0)),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            pickGalleryImage();
                          },
                          child: Container(
                            child: Text(
                              'Select a Photo',
                              style: TextStyle(color: Colors.white, fontSize: 16.0),
                            ),
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 18.0),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(1, 0.1),
                                  colors: <Color>[
                                    Color(0xff008080),
                                    Color(0xff000000),


                                  ],
                                  tileMode: TileMode.repeated,
                                ),
                                borderRadius: BorderRadius.circular(6.0)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );







  }






}
