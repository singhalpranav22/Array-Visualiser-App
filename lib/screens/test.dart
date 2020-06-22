import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';



class TestScreen extends StatefulWidget {
  TestScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TestScreen createState() => _TestScreen();
}

class _TestScreen extends State<TestScreen> {


  int arraysize=500;
  List<int> nums=[];
  StreamController<List<int>> _streamController;
  Stream<List<int>> _stream;
 randomise()
  {
    nums.clear();
     for(int i=0;i<arraysize;i++)
       {
         nums.add(Random().nextInt(arraysize));
       }
    _streamController.add(nums);
  }

 sort() async{
   for (int i = 0; i < nums.length; ++i) {
     for (int j = 0; j < nums.length - i - 1; ++j) {
       if (nums[j] > nums[j + 1]) {
         int temp = nums[j];
         nums[j] = nums[j + 1];
         nums[j + 1] = temp;
       }
     await Future.delayed(Duration(microseconds: 1));
      _streamController.add(nums);
     }
   }


 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _streamController=StreamController<List<int>>();
    _stream=_streamController.stream;
    randomise();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),body: Container(

      child: StreamBuilder<Object>(
        stream: _stream,
        builder: (context,snapshot) {
          int ind=0;
          return Row(
            children: nums.map((int number) {
              ind++;
              return CustomPaint(

                painter: ArrayBar(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / arraysize,
                  height: number,
                  index: ind,
                ),
              );
            }).toList(),
          );
        }
      ),
    ),
      bottomNavigationBar: Row(
       children: <Widget>[
      Expanded(
           child: FlatButton(

             onPressed: sort,
             child: Text(
                 "SORT"
             ),
           ),
         ),
         Expanded(
           child: FlatButton(
             onPressed: randomise,
             child: Text(
                 "RANDOMISE"
             ),
           ),
         ),
         Expanded(
           child: FlatButton(
             child: Text(
                 "Change Dimensions"
             ),
           ),
         )

       ],
      ),


    );
  }
}

class ArrayBar extends CustomPainter
{
  final double width;
  final int height;
  final int index;
  ArrayBar({this.width,this.height,this.index});
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint=Paint();
    paint.strokeWidth=width;
    paint.strokeCap=StrokeCap.square;
    if (this.height < 500 * .10) {
      paint.color = Color(0xFFDEEDCF);
    } else if (this.height < 500 * .20) {
      paint.color = Color(0xFFBFE1B0);
    } else if (this.height < 500 * .30) {
      paint.color = Color(0xFF99D492);
    } else if (this.height < 500 * .40) {
      paint.color = Color(0xFF74C67A);
    } else if (this.height < 500 * .50) {
      paint.color = Color(0xFF56B870);
    } else if (this.height < 500 * .60) {
      paint.color = Color(0xFF39A96B);
    } else if (this.height < 500 * .70) {
      paint.color = Color(0xFF1D9A6C);
    } else if (this.height < 500 * .80) {
      paint.color = Color(0xFF188977);
    } else if (this.height < 500 * .90) {
      paint.color = Color(0xFF137177);
    } else {
      paint.color = Color(0xFF0E4D64);
    }
    canvas.drawLine(Offset(index*width,0), Offset(index*width,height.ceilToDouble()), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }


}