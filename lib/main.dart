import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App",
      theme:  ThemeData(primarySwatch: Colors.indigo),
      home: const ImageApp(title: "App"),
    );
  }
}

class ImageApp extends StatefulWidget {
   const ImageApp({super.key,required this.title});

  final String title;
  @override
  State<ImageApp> createState() => _ImageApp();
}

class _ImageApp extends State<ImageApp> {

   int leftmage=1;
   int rightimage=4;
   late ConfettiController _centerController;
  
  @override
  void initState() {
    super.initState();
    _centerController =
        ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(title: const Center(child: Text("App Random Image"))),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: ConfettiWidget(
                  confettiController: _centerController,
                  blastDirection: pi / 2,
                  maxBlastForce: 5,
                  minBlastForce: 1,
                  emissionFrequency: 0.03,
                  numberOfParticles: 10,
                  gravity: 0,
                ),
              ),
           Text(leftmage==rightimage ? 'Congrats' : 'tryAgain',style: const TextStyle(fontSize: 30,color: Colors.white),textAlign: TextAlign.center),
          Padding(padding: const EdgeInsets.all(35),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child:TextButton(onPressed: (){setState(() {
                  rightimage=Random().nextInt(8)+1;
                });if(rightimage==leftmage){_centerController.play();}else{
                  _centerController.stop();
                }},child:  Image.asset("images/image-$rightimage.png"))
                ),
                 Expanded(
                flex: 2,
                 child:TextButton(onPressed: (){
                  setState(() {
                    leftmage= Random().nextInt(8)+1;
                  });
                   if(rightimage==leftmage){_centerController.play();
                  }else{
                    _centerController.stop();
                  }
                 },child:  Image.asset("images/image-$leftmage.png"))
                )
            ],
          ),
          )
      ],
      ),
    );
  }
}

