import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

import 'camera.dart';
import 'bndbox.dart';
import 'models.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  HomePage(this.cameras);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  @override
  void initState() {
    super.initState();
  }

  loadModel() async {
    String res;
    switch (_model) {
      case yolo:
        res = await Tflite.loadModel(
          model: "assets/yolov2_tiny.tflite",
          labels: "assets/yolov2_tiny.txt",
        );
        break;

      case mobilenet:
        res = await Tflite.loadModel(
            model: "assets/mobilenet_v1_1.0_224.tflite",
            labels: "assets/mobilenet_v1_1.0_224.txt");
        break;

      case posenet:
        res = await Tflite.loadModel(
            model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
        break;

      default:
        res = await Tflite.loadModel(
            model: "assets/ssd_mobilenet.tflite",
            labels: "assets/ssd_mobilenet.txt");
    }
    print(res);
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: _model == ""
          ? Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
                        Text("Object",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                        Text("Detection",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.teal),),
                      ],
                    ),),
                  )

                ],

              ),

            ],
          ),

          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/objectdet.png',height: 150,width: 150,),
              Center(child: Text("Object Detection using \n      Different Models",style: TextStyle(fontSize: 20,color: Colors.teal),)),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50,right: 50),
                  child: GridView.count(crossAxisCount: 1,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 5.0,
                    shrinkWrap: true,
                    children: [
                      InkWell(splashColor: Colors.teal,
                        child: Container(decoration:BoxDecoration(border: Border.all(color: Colors.teal)) ,
                            child: Center(child: Text(ssd)),
                            height: 10,width:50 ),
                        onTap: ()=> onSelect(ssd),
                      ),
                      InkWell(splashColor: Colors.teal,
                        child: Container(decoration:BoxDecoration(border: Border.all(color: Colors.teal)) ,
                            child: Center(child: Text(mobilenet)),
                            height: 10,width:50 ),
                        onTap: ()=> onSelect(mobilenet),
                      ),
                      InkWell(splashColor: Colors.teal,
                        child: Container(decoration:BoxDecoration(border: Border.all(color: Colors.teal)) ,
                            child: Center(child: Text(yolo)),
                            height: 10,width:50 ),
                        onTap: ()=> onSelect(yolo),
                      ),



                    ],),
                ),
              ),
            ],
          ),


        ],
      )
          : Stack(
        children: [
          Camera(
            widget.cameras,
            _model,
            setRecognitions,
          ),
          BndBox(
              _recognitions == null ? [] : _recognitions,
              math.max(_imageHeight, _imageWidth),
              math.min(_imageHeight, _imageWidth),
              screen.height,
              screen.width,
              _model),
        ],
      ),
    );
  }
}
