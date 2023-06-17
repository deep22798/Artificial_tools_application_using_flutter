import 'package:flutter/material.dart';


class object_detec extends StatefulWidget {
  const object_detec({Key key}) : super(key: key);

  @override
  State<object_detec> createState() => _object_detecState();
}

class _object_detecState extends State<object_detec> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                    Text("Object",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                    Text("Detection",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.teal),),
                  ],
                ),),
              )

            ],

          ),
          SizedBox(height: 10,),

        ],
      ),
    );







  }






}
