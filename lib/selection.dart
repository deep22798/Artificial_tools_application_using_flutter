import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/app/provider/app.provider.dart';
import 'package:miniproject/meta/homeView/home.view.dart';
import 'package:miniproject/screens/cat_and_dog/cat_home.dart';
import 'package:miniproject/screens/contact/contact.dart';
import 'package:miniproject/screens/email_detector/camera_screen.dart';
import 'package:miniproject/screens/face_detection/face_detc.dart';
import 'package:miniproject/screens/flower/flowerClassifier.dart';
import 'package:miniproject/screens/fruits/fruitsClassifier.dart';
import 'package:miniproject/screens/gender/genderClassification.dart';
import 'package:miniproject/screens/help/help.dart';
import 'package:miniproject/screens/object_detection/posenet.dart';
import 'package:miniproject/screens/realtime_ocr/ocr_page.dart';
import 'package:miniproject/screens/realtime_ocr/splash_screen.dart';
import 'package:miniproject/screens/scan_text_to_image/txt_to_img.dart';
import 'package:miniproject/screens/object_detection/home.dart';
import 'package:provider/provider.dart';
import 'main.dart';


class Selection extends StatefulWidget {

   Selection({Key key}) : super(key: key);

  @override
  State<Selection> createState() => _SelectionState();
}

GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
class _SelectionState extends State<Selection> {




  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?',style: TextStyle(color: Colors.teal),),
        content: new Text('Do you want to exit App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No',style: TextStyle(color: Colors.black54),),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes',style: TextStyle(color: Colors.teal),),
          ),
        ],
      ),
    )) ?? false;
  }

  // GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      drawer: Drawer(
        child: Stack(
          children: [
            Align(alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Container(
                      // decoration: BoxDecoration(border: Border.all(color: Colors.teal.shade100)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text("AI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 70),),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Text("Based"),
                        )
                      ],),
                    ),
                    Text("Mini Project",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),)
                  ],
                ),
              ),
            ),
            Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: InkWell(onTap: (){
                    Navigator.of(context).pop();
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Selection()));
                    },splashColor: Colors.teal,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Home",style: TextStyle(color: Colors.teal,fontSize: 25,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: InkWell(onTap: (){

                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>contact()));},splashColor: Colors.teal,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Contact us",style: TextStyle(color: Colors.teal,fontSize: 25,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: InkWell(onTap: (){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>help()));},splashColor: Colors.teal,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Help",style: TextStyle(color: Colors.teal,fontSize: 25,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(alignment: Alignment.topRight,
                child: Container(height: 60,width: 60,decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                    gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1.2),tileMode: TileMode.repeated,
                    colors: [
                  Colors.teal,
                  Colors.black
                ])),
                  child: Center(child: InkWell(splashColor: Colors.teal,
                    onTap: (){Navigator.pop(context);},

                      child: Icon(Icons.close,size: 30,color: Colors.white,))),
                ),
              ),
            )

          ],
        )

      ),
        key: _scaffoldKey,
      body: WillPopScope(onWillPop:_onWillPop ,
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(children: [
                  Container(height: 105,width:100,decoration: BoxDecoration(
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
                    padding: const EdgeInsets.only(top: 55,left:40),
                    child: InkWell(
                      onTap: (){
                        _scaffoldKey.currentState.openDrawer();
                      },
                        child: Image.asset("assets/drawer.png",height: 25,width: 25,)),
                  )
                              ],),
                Padding(
                  padding: const EdgeInsets.only(right: 70,top: 20),
                  child: Center(child: Text("Home",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),),
                )

            ],

            ),
            SizedBox(height: 10,),
            CarouselDemo()
          ],
          ),
        ),
      ),
    );
  }

}


class CarouselDemo extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) => Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CarouselSlider(
            items: [
              ClipRRect(
                child: Image.network("https://img.freepik.com/free-photo/facial-recognition-collage-concept_23-2150038886.jpg?w=1380&t=st=1684850234~exp=1684850834~hmac=b3484ded7f00a900dda594c640eb28c743670e57befef6eefa4b47e677e134e4",
                  loadingBuilder: (context,child,load){
                    if(load==null)
                      return child;
                    else
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.teal,),
                      );
                  },
                ),
                borderRadius: BorderRadius.circular(20),clipBehavior: Clip.hardEdge,

              ),ClipRRect(
                borderRadius: BorderRadius.circular(20),clipBehavior: Clip.hardEdge,
                child: Image.network("https://img.freepik.com/free-vector/optical-character-recognition-ocr-isometric-landing-page_107791-4717.jpg?size=626&ext=jpg&ga=GA1.1.438439258.1684850161&semt=ais",
                  loadingBuilder: (context,child,load){
                    if(load==null)
                      return child;
                    else
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.teal,),
                      );
                  },
                  fit: BoxFit.cover,
                ),
              ),ClipRRect(
                borderRadius: BorderRadius.circular(20),clipBehavior: Clip.hardEdge,
                child: Image.network("https://img.freepik.com/free-vector/face-recognition-mobile-identification-young-woman-unlocking-her-smartphone-app_80328-224.jpg?w=1800&t=st=1684850311~exp=1684850911~hmac=5972b95a382545d142d078a851e49e32ad1ce322114fbdf98f6f430d781ed69f",
                  loadingBuilder: (context,child,load){
                    if(load==null)
                      return child;
                    else
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.teal,),
                      );
                  },
                  fit: BoxFit.cover,
                ),
              ),ClipRRect(
                borderRadius: BorderRadius.circular(20),clipBehavior: Clip.hardEdge,
                child: Image.network("https://img.freepik.com/free-vector/digital-technology-face-artificial-intelligence_1017-21770.jpg?w=1380&t=st=1684850784~exp=1684851384~hmac=0cf78dc7fcf8251d51c79333c3bd7006153af91a8d78c4ffd0ce9127f09a6b9a",
                  loadingBuilder: (context,child,load){
                    if(load==null)
                      return child;
                    else
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.teal,),
                      );
                  },
                  fit: BoxFit.cover,
                ),
              ),ClipRRect(
                borderRadius: BorderRadius.circular(20),clipBehavior: Clip.hardEdge,
                child: Image.network("https://img.freepik.com/free-photo/ai-technology-microchip-background-digital-transformation-concept_53876-124669.jpg?w=1380&t=st=1684850820~exp=1684851420~hmac=96b2dc9bdd4e8044b94575bae1562fd20425a10fcc20257397f076c157842056",
                  loadingBuilder: (context,child,load){
                    if(load==null)
                      return child;
                    else
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.teal,),
                      );
                  },
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
            // carouselController: buttonCarouselController,
            options: CarouselOptions(

              autoPlay: true,autoPlayAnimationDuration: Duration(seconds: 1),
              enlargeCenterPage: true,
              aspectRatio: 2.2,
                viewportFraction:0.8,
                scrollDirection: Axis.horizontal
            ),
          ),
        ),
        // RaisedButton(
        //   onPressed: () => buttonCarouselController.nextPage(
        //       duration: Duration(milliseconds: 300), curve: Curves.linear),
        //   child: Text('→'),
        // )
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.count(physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2, shrinkWrap: true,scrollDirection: Axis.vertical,crossAxisSpacing: 10,childAspectRatio: 1.0,mainAxisSpacing: 10,
          children: [

            InkWell(
              splashColor: Colors.teal,borderRadius: BorderRadius.circular(10),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MultiProvider(
                  providers: AppProvider.providers,
                  child:  HomeView(),
                )));
              },
              child: Container(height: 80,width: 80,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 90,width: double.infinity,child: Image.asset("assets/mask.png"),),
                    ),
                    Divider(height: 2,color: Colors.teal,),
                    Text("Mask Detector",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(" ",style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade100)),),
            ),
            InkWell(
              splashColor: Colors.teal,borderRadius: BorderRadius.circular(10),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>face_detection()));
              },
              child: Container(height: 80,width: 80,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 90,width: double.infinity,child: Image.asset("assets/facedet.png"),),
                    ),
                    Divider(height: 2,color: Colors.teal,),
                    Text("Face",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("Detection ",style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade100)),),
            ),
            InkWell(
              splashColor: Colors.teal,borderRadius: BorderRadius.circular(10),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Image_to_text()));
              },
              child: Container(height: 80,width: 80,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 90,width: double.infinity,child: Image.asset("assets/texttoimg.png"),),
                    ),
                    Divider(height: 2,color: Colors.teal,),
                    Text("Scan Text from ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("Image ",style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade100)),),
            ),
            InkWell(
              splashColor: Colors.teal,borderRadius: BorderRadius.circular(10),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OCRPage()));
              },
              child: Container(height: 80,width: 80,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 90,width: double.infinity,child: Image.asset("assets/ocr.png"),),
                    ),
                    Divider(height: 2,color: Colors.teal,),
                    Text("OCR Recognition",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(" ",style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade100)),),
            ),
            InkWell(
              splashColor: Colors.teal,borderRadius: BorderRadius.circular(10),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(cameras)));
              },
              child: Container(height: 80,width: 80,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 90,width: double.infinity,child: Image.asset("assets/objectdet.png"),),
                    ),
                    Divider(height: 2,color: Colors.teal,),
                    Text("Object and Things ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("Detection ",style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade100)),),
            ),
            InkWell(
              splashColor: Colors.teal,borderRadius: BorderRadius.circular(10),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>posenet_h(cameras)));
              },
              child: Container(height: 80,width: 80,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 90,width: double.infinity,child: Image.asset("assets/pose.png"),),
                    ),
                    Divider(height: 2,color: Colors.teal,),
                    Text("Bosy Parts",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("Detection ",style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade100)),),
            ),
            InkWell(
              child: Container(height: 80,width: 80,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 90,width: double.infinity,child: Image.asset("assets/catndog.png"),),
                    ),
                    Divider(height: 2,color: Colors.teal,),
                    Text("Cat & Dog ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("Classifier ",style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade100)),),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>catHome()));},
              splashColor: Colors.teal,borderRadius: BorderRadius.circular(10),
            ),InkWell(
              child: Container(height: 80,width: 80,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 90,width: double.infinity,child: Image.asset("assets/fruits.png"),),
                    ),
                    Divider(height: 2,color: Colors.teal,),
                    Text("Fruits",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("Classifier ",style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade100)),),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitsClassifier()));},
              splashColor: Colors.teal,borderRadius: BorderRadius.circular(10),
            ),InkWell(
              child: Container(height: 80,width: 80,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 90,width: double.infinity,child: Image.asset("assets/gender.png"),),
                    ),
                    Divider(height: 2,color: Colors.teal,),
                    Text("Gender",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("Classifier ",style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade100)),),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>GenderClassification()));},
              splashColor: Colors.teal,borderRadius: BorderRadius.circular(10),
            ),InkWell(
              child: Container(height: 80,width: 80,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 90,width: double.infinity,child: Image.asset("assets/flowers.png"),),
                    ),
                    Divider(height: 2,color: Colors.teal,),
                    Text("Flowers",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("Classifier ",style: TextStyle(fontSize: 12),),
                    ),
                  ],
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.teal.shade100)),),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FlowerClassifier()));},
              splashColor: Colors.teal,borderRadius: BorderRadius.circular(10),
            ),






          ],),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(bottom: 20,left: 30,right: 30),
          child: Container(
              height: 100,width: double.infinity,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network("https://static.javatpoint.com/tutorial/ai/images/application-of-ai.png",
                    frameBuilder: (context,child,frame,wasyn){
                      return child;
                    },loadingBuilder: (context,child,load){
                      if(load==null)
                        return child;
                      else
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.teal,),
                        );
                    },
                  ),
                ],
              )),
        ),

            SizedBox(height: 20,),

            Container(
              child: Stack(
                children: [

                  ClipRRect(
                  borderRadius: BorderRadius.circular(20),clipBehavior: Clip.hardEdge,
                  child: Image.network("https://img.freepik.com/free-photo/ai-nuclear-energy-future-innovation-disruptive-technology_53876-129784.jpg?w=740&t=st=1684850965~exp=1684851565~hmac=0a86fd35bf8eb8add32dc74d5683e735699f561012bf9320be4af692504afb96",
                  loadingBuilder: (context,child,load){
                  if(load==null)
                  return child;
                  else
                  return const Center(
                  child: CircularProgressIndicator(color: Colors.teal,),
                  );
                  },
                  fit: BoxFit.cover,
                  ),),
                  Align(alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text("AI Tools",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),



      ]
  );

}
//