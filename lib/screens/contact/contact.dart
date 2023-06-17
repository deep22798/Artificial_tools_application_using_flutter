import 'package:flutter/material.dart';


class contact extends StatefulWidget {
  const contact({Key key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start,
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
                    child: Center(
                        child:Text("Contact us",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                        // Text("Specifier",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.teal),),
                     ),
                  )

                ],

              ),
              SizedBox(height: 10,),
              



            ],
          ),
          Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 250,width: 250,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/contactt.png"))),

                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
