import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:ui';
import 'dart:ui' as ui show Image;

import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';


class face_detection extends StatefulWidget {
  const face_detection({Key key}) : super(key: key);

  @override
  State<face_detection> createState() => _face_detectionState();
}

class _face_detectionState extends State<face_detection> {




  ui.Image imageSelected = null;
  List<Face> faces = [];

  void getImage() async {
    final PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      var imageFile = await pickedFile.readAsBytes();
      ui.Image imageFile2 = await decodeImageFromList(imageFile);

      final InputImage inputImage = InputImage.fromFilePath(pickedFile.path);
      final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
        enableClassification: true,
        enableTracking: true,
      ));

      final List<Face> outputFaces = await faceDetector.processImage(inputImage);

      setState(() {
        imageSelected = imageFile2;
        faces = outputFaces;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(physics:NeverScrollableScrollPhysics() ,
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
                      Text("Face",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                      Text("Detection",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.teal),),
                    ],
                  ),),
                )

              ],

            ),
            SizedBox(height: 10,),
             SingleChildScrollView(scrollDirection: Axis.vertical,
               child: Column(mainAxisAlignment: MainAxisAlignment.start,
                 children: [

                   imageSelected != null ?
                   Column(
                     children: [
                       Container(height: 600,width: double.infinity,
                       child: Padding(
                         padding: const EdgeInsets.all(25.0),
                         child:
                           InteractiveViewer(
                           panEnabled: false,

                           constrained: false,
                           boundaryMargin: EdgeInsets.all(500),
                           minScale: 0.1,
                           maxScale: 30.0
                           ,
                           child: SingleChildScrollView(
                             child: Column(mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                   Container(
                                     height: imageSelected.height.toDouble(),
                                     width: imageSelected.width.toDouble(),
                                     child: CustomPaint(
                                       painter: FaceDraw(

                                         faces: faces, image: imageSelected,
                                       ),
                                     ),
                                   ),


                               ],
                             ),
                           ),
                         )
                       ),),
                       Text("Image Adjust with Two Fingers")
                     ],
                   ):Container(height: 600,width: double.infinity,
                       child: Center(child: Text("Please Pick a Image")))
                 ],
               ),
             )




          ],
        ),
      ),floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Select',
        backgroundColor: Colors.teal,
        child: Icon(Icons.image),
    ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}















class FaceDraw extends CustomPainter {
  List<Face> faces;
  ui.Image image;

  FaceDraw({@required this.faces, @required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset.zero, Paint());

    for (Face face in faces) {
      canvas.drawRect(
        face.boundingBox,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.blueAccent
          ..strokeWidth = 4,
      );

      // canvas.drawLine(
      //     Offset(face.boundingBox.left + 5, face.boundingBox.top - 12),
      //     Offset(face.boundingBox.right - 5, face.boundingBox.top - 12),
      //     Paint()
      //       ..color = Colors.white.withOpacity(0.8)
      //       ..strokeWidth = 18
      //       ..style = PaintingStyle.fill);

      TextPainter paintSpanId = new TextPainter(
        text: TextSpan(
          style: new TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
          ),
          text: "ID::${face.trackingId}",
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      paintSpanId.layout();
      paintSpanId.paint(canvas, new Offset(face.boundingBox.left + 10, face.boundingBox.top - 20));

      canvas.drawLine(
          Offset(face.boundingBox.left, face.boundingBox.bottom + 14),
          Offset(face.boundingBox.right, face.boundingBox.bottom + 14),
          Paint()
            ..color = Colors.black.withOpacity(0.7)
            ..strokeWidth = 20
            ..style = PaintingStyle.fill);

      TextPainter paintSmilingStatus = new TextPainter(
        text: TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
          ),
          text: "Smiling::${face.smilingProbability >= 0.5 ? "Yes" : "No"}",
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      paintSmilingStatus.layout();
      paintSmilingStatus.paint(canvas, new Offset(face.boundingBox.left + 3, face.boundingBox.bottom + 5));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}