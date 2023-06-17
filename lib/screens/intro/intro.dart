
import 'package:flutter/material.dart';
import 'package:miniproject/selection.dart';
class Intro extends StatefulWidget {
  const Intro({Key key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1.2),
              colors: <Color>[
                Color(0xff008080),
                Color(0xff008080),
                Color(0xff000000),


              ],
              tileMode: TileMode.repeated,
            ),
        ),
        child: Stack(
          children: [
            Center(child:Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("A Mini Project",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Based on",style: TextStyle(fontSize: 15,),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Artificial Intelligence",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],
                  ),
                  SizedBox(height: 50,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Under the Guidance of",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 100,),
                      Column(
                        children: [
                          Text("Dr. Devesh Katiyar",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                          Text("Mr. Gaurav Goel",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                        ],
                      ),
                    ],
                  ),


                ],
              ),
            ),),

            Align(alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: InkWell(splashColor: Colors.teal,
                      onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Selection()));},
                      child: Container(height: 60,width: 60,decoration: BoxDecoration(borderRadius: BorderRadius.circular(1000),color: Colors.white30),child: Center(child: Text(">",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),)),)),
                ))
          ],
        ),
      ),

    );
  }
}
