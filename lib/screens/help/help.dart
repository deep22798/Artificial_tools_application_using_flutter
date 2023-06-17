import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class help extends StatefulWidget {
  const help({Key key}) : super(key: key);

  @override
  State<help> createState() => _helpState();
}

GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
class _helpState extends State<help> {
  double _width = 0;
  double _height = 0;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _width=100;
      _height=100;
      _borderRadius=BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(children: [
                  AnimatedContainer(height: _height,width:_width,decoration: BoxDecoration(
                    borderRadius: _borderRadius,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1.2),
                      colors: <Color>[
                        Color(0xff008080),
                        Color(0xff008080),
                        Color(0xff000000),


                      ],
                      tileMode: TileMode.repeated,
                    ),), duration: const Duration(seconds: 20),curve: Curves.fastOutSlowIn,),

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
                  child: Center(child:
                      Text("Help",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                      ),
                )

              ],

            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(height: 150,width: 150,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/help.png"))),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 10),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("Help to understand this project",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 10),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("Basically this is a mini project in which we include many artificial intelligence operations like :",style: TextStyle(color: Colors.teal.shade200),)),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("Mask Detector",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("In this section we'll Capture an image fro Camera and check the person is wearing Mask or Not. so, it detect the Mask of persons ",style: TextStyle(color: Colors.teal.shade200),)),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("Face Detection",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("In this section we'll Pick an image fro Gallery. so, it detect the face of persons and check he/she is smiling or not ",style: TextStyle(color: Colors.teal.shade200),)),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("Image to Text Converter",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("In this section we scanned the text into an image, in which we'll upload an image and copy all the text of image.",style: TextStyle(color: Colors.teal.shade200),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("OCR Recognition",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("In this section we scanned the Realtime text on Camera, in which we'll see all the characters in camera activity.",style: TextStyle(color: Colors.teal.shade200),)),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("Object and things detection",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("In this section we'll scan all the objects with the help of camera so it shows all the object names on screen.",style: TextStyle(color: Colors.teal.shade200),)),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("Body Part's detection",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("In this section we'll scan a person body from camera and it's show all the body part names in same camera activity.",style: TextStyle(color: Colors.teal.shade200),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("Cat and Dog Classifier",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("In this section we specify the cat or dog, in which we'll upload an image and the AI operation tells what the images is cat or dog.",style: TextStyle(color: Colors.teal.shade200),)),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("Fruits Classifier",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("In this section we classify the variety of fruits, in which we'll upload an image and the AI operation tells the fruits name.",style: TextStyle(color: Colors.teal.shade200),)),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("Gender Classifier",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("In this section we classify the Gender, in which we'll upload an image and the AI operation tells the Person Gender.",style: TextStyle(color: Colors.teal.shade200),)),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("Flowers Classifier",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 18),
                      child: Align(alignment: Alignment.centerLeft,
                          child: Text("In this section we classify the variety of flowers, in which we'll upload an image and the AI operation tells the flower's name.",style: TextStyle(color: Colors.teal.shade200),)),
                    ),






                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
