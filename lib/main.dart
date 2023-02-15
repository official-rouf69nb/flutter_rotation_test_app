import 'dart:math';

import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  double _pws = 1;
  double _pHs = 1;
  double _angs = 1;

  @override
  Widget build(BuildContext context) {
    // double bw = 300;
    // double bh = 200;
    // var cW = 10.0;//currentRotatedRectangleWidth;
    // var cH = 20.0;//currentRotatedRectangleHeight;
    // var rad = 0.3;//angleOfRotation;
    //
    // var s = max(max(cW, bw),max(cH, bh));
    //
    // var cBW = (s * sin(rad)).abs() + (s * cos(rad)).abs();
    // var cBH = (s * sin(rad)).abs() + (s * cos(rad)).abs();
    // var dx = (cBW - cW) / 2;
    // var dy = (cBH - cH) / 2;
    //
    // var CoeffH = cH / cBW;
    // var CoeffV = cH / cBH;
    // var Coeff = min(CoeffH, CoeffV);

    // double wo = 300;
    // double ho = 300;
    // double w = 300;
    // double h = 300;
    // double angle = 1;
    //
    //
    // var W = (w * cos(angle)) + (h * sin(angle));
    // var H = (w * sin(angle)) + (h * cos(angle));
    //
    // print("Width: $W, Height: $H");
    //
    // var a = min(wo / W, ho / H);
    // print("min: $a");
    //
    // // var scale = 1.0;
    // // if(a < 1){
    // //   scale +=  0.01;
    // // }
    // //
    // //
    // // final Rect rectangle = Rect();
    // // final cx = rectangle.left + rectangle.width / 2;
    // // final cy = rectangle.top + rectangle.height / 2;

    double h = 300 * _pHs;
    double w = 300 * _pws;
    double ih = 300;
    double cw = 200;

    double ang = 6.28319 * _angs;



    var scale = 1.0;
      if (h > w) {
        scale = cos(ang).abs() + (h / w * sin(ang)).abs();
      } else {
        scale = cos(ang).abs() + (w / h * sin(ang)).abs();
      }

   print(ang * 180/pi);
   print(scale);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Container(
                    width: w,
                    height: h,
                    color: Colors.grey,
                  ),
                ),

                Center(
                  child: Transform.scale(
                    scale: 1,
                    child: Transform.rotate(
                      angle: ang,
                      child: Container(
                        width: w * scale ,
                        height: h * scale,
                        color: Colors.redAccent.withOpacity(0.4),
                       child: FittedBox(
                         child: Text(
                             (ang * 180/pi).toStringAsFixed(1),
                         ),
                       ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //ANgle
          Slider(
            value: _angs,
            onChanged: (x){
              setState(() {
                _angs = x;
              });
            },
          ),

          //Width
          Slider(
            value: _pws,
            onChanged: (x){
              setState(() {
                _pws = x;
              });
            },
          ),

          //Height
          Slider(
            value: _pHs,
            onChanged: (x){
              setState(() {
                _pHs = x;
              });
            },
          ),
          SizedBox(height: 8,),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
