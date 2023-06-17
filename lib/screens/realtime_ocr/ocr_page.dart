
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';


class OCRPage extends StatefulWidget {
  @override
  _OCRPageState createState() => _OCRPageState();
}

class _OCRPageState extends State<OCRPage> {

  int _ocrCamera = FlutterMobileVision.CAMERA_BACK;
  String _text = "TEXT";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 100,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Text("OCR",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                        Text("Recognition",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.teal),),
                      ],
                    ),),
                  )

                ],

              ),
            ),
            Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_text,style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  ),
                  RaisedButton(
                    onPressed: _read,
                    child: Text('Scan now',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }

  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: _ocrCamera,
        waitTap: true,
      );

      setState(() {
        _text = texts[0].value;
      });
    } on Exception {
      texts.add( OcrText('Failed to recognize text'));
    }
  }
}