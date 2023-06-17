import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miniproject/core/notifier/homeNotifier/home.notifer.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<HomeNotifer>(context, listen: false).loadModel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
                      Text("Mask",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                      Text("Detector",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.teal),),
                    ],
                  ),),
                )

              ],

            ),
            SizedBox(height: 10,),
            const SizedBox(
              height: 70,
            ),
            RichText(
              text: const TextSpan(
                text: 'Did ',
                style: TextStyle(
                  fontSize: 20.0,color: Colors.black
                ),
                children: [
                  TextSpan(
                    text: 'You Wear ',
                    style: TextStyle(
                      fontSize: 20.0,color: Colors.black
                    ),
                  ),
                  TextSpan(
                    text: 'It ?',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 200,
              child: Image.asset('assets/mask.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: const TextSpan(
                text: "Let's ",
                style: TextStyle(
                    fontSize: 20.0,color: Colors.black
                ),
                children: [
                  TextSpan(
                    text: 'Check ',
                    style: TextStyle(
                        fontSize: 20.0,color: Colors.black
                    ),
                  ),
                  TextSpan(
                    text: 'It.',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal),
                  ),
                  child: const Text(
                    'Gallery',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Provider.of<HomeNotifer>(context, listen: false)
                        .pickUserImage(
                            context: context, source: ImageSource.gallery);
                  },
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal),
                  ),
                  child: const Text(
                    'Camera',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Provider.of<HomeNotifer>(context, listen: false)
                        .pickUserImage(
                            context: context, source: ImageSource.camera);
                  },
                )
              ],
            ),
            Provider.of<HomeNotifer>(context, listen: true).getLoading == true
                ? Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.file(
                            Provider.of<HomeNotifer>(context, listen: false)
                                .getUserImage),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        Provider.of<HomeNotifer>(context, listen: true)
                            .neww,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Text(
                      //   'Confidence Level : ${Provider.of<HomeNotifer>(context, listen: false).prediction.toString()}',
                      //   style: const TextStyle(
                      //     color: Colors.white60,
                      //   ),
                      // ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
