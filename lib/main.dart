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
  double _cellWidthSliderValue = 1;
  double _cellHeightSliderValue = 1;
  double _imgWidthSliderValue = 1;
  double _imgHeightSliderValue = 1;
  double _angleSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    ISize cellSize = ISize(300 * _cellWidthSliderValue, 300 * _cellHeightSliderValue);
    ISize imgSize = ISize(300 * _imgWidthSliderValue, 300 * _imgHeightSliderValue);
    double ang = 6.28319 * _angleSliderValue;


    // final iRatioH = (h/ih).abs();
    // final iRatioW = (w/iw).abs();
    // final iRatio = (ih / iw).abs();
    // if(iw >= w){
    //   final iScale=max(iRatioH, iRatioW);
    //   iw = iScale * iw;
    //   ih = iw * iRatio;
    // }
    // else if(iw <= w){
    //   final iScale=min(iRatioH, iRatioW);
    //   iw = iScale * iw;
    //   ih = iw * iRatio;
    // }
    // else if(ih <= h){
    //   final iScale=max(iRatioH, iRatioW);
    //   ih = iScale * ih;
    //   iw = ih * iRatio;
    // }
    // else{
    //   final iScale=min(iRatioH, iRatioW);
    //   ih = iScale * ih;
    //   iw = ih * iRatio;
    // }
    // // else{
    // //
    // // }
    // //


    // final iScale=max(h/ih, w/iw);
    // final iRatio = (ih / iw).abs();
    // ih = iScale * ih;
    // iw = iScale * iw;


    // if(h > ih){
    //   var iScale=max(h/ih, w/iw);
    //   ih = iScale * ih;
    //   iw = iScale * iw;
    // }
    // else {

    // }

    // var iScale=min(h/ih, w/iw);
    //
    // ih = iScale * ih;
    // iw = iScale * iw;

    //
    // var scale = 1.0;
    // if (h > w) {
    //   scale = cos(ang).abs() + (h / w * sin(ang)).abs();
    // } else {
    //   scale = cos(ang).abs() + (w / h * sin(ang)).abs();
    // }
    // if (ih > iw) {
    //   scale = cos(ang).abs() + (ih / iw * sin(ang)).abs();
    //   ih = ih * scale;
    //   iw = iw * iRatio;
    // } else {
    //   scale = cos(ang).abs() + (iw / ih * sin(ang)).abs();
    //   iw = iw * scale;
    //   ih = ih * iRatio;
    // }
    //
    // ih = ih * scale;
    // iw = iw * scale;

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
                    width: cellSize.width,
                    height: cellSize.height,
                    color: Colors.grey,
                  ),
                ),

                Center(
                  child: Transform.scale(
                    scale: 1,
                    child: Transform.rotate(
                      angle: ang,
                      child: Container(
                        width: imgSize.width ,
                        height: imgSize.height,
                        color: Colors.redAccent.withOpacity(0.4),
                       child: FittedBox(
                         fit: BoxFit.scaleDown,
                         child: Text(
                             (ang * 180/pi).toStringAsFixed(1),
                           style: const TextStyle(
                             fontSize: 32,
                           ),
                         ),
                       ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Angle
          Slider(
            value: _angleSliderValue,
            onChanged: (x){
              setState(() {
                _angleSliderValue = x;
              });
            },
          ),
          //Width
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _cellWidthSliderValue,
                  onChanged: (x){
                    setState(() {
                      _cellWidthSliderValue = x;
                    });
                  },
                  min: 0.1,
                ),
              ),
              Expanded(
                child: Slider(
                  value: _imgWidthSliderValue,
                  onChanged: (x){
                    setState(() {
                      _imgWidthSliderValue = x;
                    });
                  },
                  min: 0.1,
                ),
              ),
            ],
          ),
          //Height
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _cellHeightSliderValue,
                  onChanged: (x){
                    setState(() {
                      _cellHeightSliderValue = x;
                    });
                  },
                  min: 0.1,
                ),
              ),
              Expanded(
                child: Slider(
                  value: _imgHeightSliderValue,
                  onChanged: (x){
                    setState(() {
                      _imgHeightSliderValue = x;
                    });
                  },
                  min: 0.1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8,),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ISize{
  double width;
  double height;

  ISize(this.width, this.height);
}