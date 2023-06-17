import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


class Image_to_text extends StatefulWidget {
  const Image_to_text({Key key}) : super(key: key);

  @override
  State<Image_to_text> createState() => _Image_to_textState();
}

class _Image_to_textState extends State<Image_to_text> {


  bool textScanning = false;

  XFile imageFile;

  String scannedText = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
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
                      Text("Text From",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                      Text("Image",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.teal),),
                    ],
                  ),),
                )

              ],

            ),
            SizedBox(height: 10,),
            Center(
                child: SingleChildScrollView(
                  child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (textScanning) const CircularProgressIndicator(),
                          if (!textScanning && imageFile == null)
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/texttoimg.png"))),
                            ),
                          if (imageFile != null) Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey)), height:400,width: 300,child: Image.file(File(imageFile.path),fit: BoxFit.contain,)),

                          const SizedBox(
                            height: 20,
                          ),


                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // pickImage();
                                    getImage(ImageSource.camera);
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
                                    getImage(ImageSource.gallery);
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: Align(alignment: Alignment.center,
                                child: Text(
                                  scannedText,
                                  style: TextStyle(fontSize: 20,),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                )),
            if(scannedText.isNotEmpty)

            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: FlatButton(color: Colors.teal,

                  onPressed: (){
                Clipboard.setData(ClipboardData(text: scannedText));
              }, child: Text("Copy")),
            )
          ],
        ),
      ),);

  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textDetector();
    RecognisedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }
    textScanning = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }


}








