import 'dart:async';
import 'dart:math';
import 'package:arrayvisualiser/components/cardview.dart';
import 'package:flutter/material.dart';



class TestScreen extends StatefulWidget {
  TestScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TestScreen createState() => _TestScreen();
}

class _TestScreen extends State<TestScreen> {

  int s=0;
  int arraysize=250;
   var duration=3000;
   String dropdownValue="Merge Sort";
  List<int> nums=[];
  StreamController<List<int>> _streamController;
  Stream<List<int>> _stream;

  void handleClick(String value) {
    switch (value) {
      case 'Merge Sort':

        setState(() {
          s=0;
        });

          break;

      case 'Quick Sort':
        setState(() {
          s=1;
          print(s);
        });

        break;

      case 'Selection Sort':
        setState(() {
          s=2;
          print(s);
        });

        break;
      case 'Bubble Sort':
        setState(() {
          s=3;
          print(s);
        });

        break;
      case 'Insertion Sort':
        setState(() {
          s=4;
          print(s);
        });

        break;

    }
  }
 menu()
 {
   showModalBottomSheet(context: context, builder: (builder)
   {
     return StatefulBuilder(
         builder: (context, setState) {
           return Container(

             child: Expanded(

               child: ListView(
                 padding: const EdgeInsets.all(8),
                 children: <Widget> [
                   Text(
                     "Slide to Change the Array Size and the Duration of Sort as per your convenience :)",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   cardView(Colors.teal,250,
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment:MainAxisAlignment.center,
                       children: <Widget>[
                         Text(
                           "Array Size",
                           style: TextStyle(
                             fontSize: 35.0,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,

                           ),

                         ),
                         SizedBox(
                           height: 10.0,
                         ),
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.baseline,
                           textBaseline: TextBaseline.alphabetic ,
                           mainAxisAlignment: MainAxisAlignment.center,

                           children: <Widget>[


                             Text(

                               arraysize.toString(),style:
                             TextStyle(
                               fontSize: 50.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.pink,
                             ),
                             ),

                           ],
                         ),
                         SliderTheme(
                           data: SliderTheme.of(context).copyWith(
                             activeTrackColor: Colors.black,
                             thumbColor: Color(0xFFEB1555),
                             overlayColor: Color(0x29EB1555),
                             overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                             thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                           ),
                           child: Slider(
                             max: 500,
                             min: 5,
                             value: arraysize.toDouble(),


                             inactiveColor: Colors.white,

                             onChanged: (double value){

                               setState(() {

                                 arraysize=value.round();
                                 randomise();
                               });

                             },
                           ),
                         )

                       ],
                     ),),
                   cardView(Colors.teal,250,
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment:MainAxisAlignment.center,
                       children: <Widget>[
                         Text(
                           "Duration",
                           style: TextStyle(
                             fontSize: 35.0,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,

                           ),

                         ),
                         SizedBox(
                           height: 10.0,
                         ),
                         Row(
                           crossAxisAlignment: CrossAxisAlignment.baseline,
                           textBaseline: TextBaseline.alphabetic ,
                           mainAxisAlignment: MainAxisAlignment.center,

                           children: <Widget>[


                             Text(

                               duration.toString(),style:
                             TextStyle(
                               fontSize: 50.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.pink,
                             ),
                             ),
                             Text(

                               " ms",style:
                             TextStyle(
                               fontSize: 25.0,
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                             ),
                             ),
                           ],
                         ),
                         SliderTheme(
                           data: SliderTheme.of(context).copyWith(
                             activeTrackColor: Colors.black,
                             thumbColor: Color(0xFFEB1555),
                             overlayColor: Color(0x29EB1555),
                             overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                             thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                           ),
                           child: Slider(
                             max: 5000,
                             min: 1,
                             value: duration.toDouble(),


                             inactiveColor: Colors.white,

                             onChanged: (double value){

                               setState(() {

                                 duration=value.round();
                               });
                             },
                           ),
                         )

                       ],
                     ),),
                 ], ),),);});
   });

 }
 randomise()
  {
    nums.clear();
     for(int i=0;i<arraysize;i++)
       {
         nums.add(Random().nextInt(490)+10);
       }
    _streamController.add(nums);
  }

 bubblesort() async {
   for (int i = 0; i < nums.length; ++i) {
     for (int j = 0; j < nums.length - i - 1; ++j) {
       if (nums[j] > nums[j + 1]) {
         int temp = nums[j];
         nums[j] = nums[j + 1];
         nums[j + 1] = temp;
       }
       await Future.delayed(Duration(microseconds: duration));
       _streamController.add(nums);
     }
   }
 }
   selectionSort() async {
     for (int i = 0; i < nums.length; i++) {
       for (int j = i + 1; j < nums.length; j++) {
         if ( nums[i] > nums[j]) {
           int temp = nums[j];
           nums[j] = nums[i];
          nums[i] = temp;
         }

         await Future.delayed(Duration(microseconds: duration));

         _streamController.add(nums);
       }
     }
   }



  insertionSort() async {
    for (int i = 1; i < nums.length; i++) {
      int temp = nums[i];
      int j = i - 1;
      while (j >= 0 && temp < nums[j]) {
        nums[j + 1] = nums[j];
        --j;
        await Future.delayed(Duration(microseconds: duration));

        _streamController.add(nums);
      }
      nums[j + 1] = temp;
      await Future.delayed(Duration(microseconds: duration));

      _streamController.add(nums);
    }
  }

  mergeSort(int leftIndex, int rightIndex) async {
    Future<int> merge(int leftIndex, int middleIndex, int rightIndex) async {
      int leftSize = middleIndex - leftIndex + 1;
      int rightSize = rightIndex - middleIndex;

      List leftList = new List(leftSize);
      List rightList = new List(rightSize);

      for (int i = 0; i < leftSize; i++) leftList[i] = nums[leftIndex + i];
      for (int j = 0; j < rightSize; j++) rightList[j] = nums[middleIndex + j + 1];

      int i = 0, j = 0;
      int k = leftIndex;

      while (i < leftSize && j < rightSize) {
        if (leftList[i] <= rightList[j]) {
          nums[k] = leftList[i];
          i++;
        } else {
         nums[k] = rightList[j];
          j++;
        }

        await Future.delayed(Duration(microseconds: duration));


        _streamController.add(nums);

        k++;
      }

      while (i < leftSize) {
        nums[k] = leftList[i];
        i++;
        k++;

        await Future.delayed(Duration(microseconds: duration));
        _streamController.add(nums);
      }

      while (j < rightSize) {
        nums[k] = rightList[j];
        j++;
        k++;

        await Future.delayed(Duration(microseconds: duration));
        _streamController.add(nums);
      }
    }

    if (leftIndex < rightIndex) {
      int middleIndex = (rightIndex + leftIndex) ~/ 2;

      await mergeSort(leftIndex, middleIndex);
      await mergeSort(middleIndex + 1, rightIndex);

      await Future.delayed(Duration(microseconds: duration));

      _streamController.add(nums);

      await merge(leftIndex, middleIndex, rightIndex);
    }
  }

  quickSort(int leftIndex, int rightIndex) async {
    Future<int> _partition(int left, int right) async {
      int p = (left + (right - left) / 2).toInt();

      var temp = nums[p];
      nums[p] = nums[right];
      nums[right] = temp;
      await Future.delayed(Duration(microseconds: duration));


      _streamController.add(nums);

      int cursor = left;

      for (int i = left; i < right; i++) {
        if (cf(nums[i], nums[right]) <= 0) {
          var temp = nums[i];
         nums[i] = nums[cursor];
          nums[cursor] = temp;
          cursor++;

          await Future.delayed(Duration(microseconds: duration));


          _streamController.add(nums);
        }
      }

      temp = nums[right];
      nums[right] =nums[cursor];
      nums[cursor] = temp;

      await Future.delayed(Duration(microseconds: duration));


      _streamController.add(nums);

      return cursor;
    }

    if (leftIndex < rightIndex) {
      int p = await _partition(leftIndex, rightIndex);

      await quickSort(leftIndex, p - 1);

      await quickSort(p + 1, rightIndex);
    }
  }

  cf(int a, int b) {
    if (a < b) {
      return -1;
    } else if (a > b) {
      return 1;
    } else {
      return 0;
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


    String title;

    switch(s)
    {
      case 0:
        title="Merge Sort";
        break;
      case 1:
        title="Quick Sort";
        break;
      case 2:
        title="Selection Sort";
        break;
      case 3:
        title="Bubble Sort";
        break;
      case 4:
        title="Insertion Sort";
        break;

    }
    return Scaffold(
      appBar: AppBar(

        title: Text("Sort iT!"),
        actions: <Widget>[
//          PopupMenuButton<String>(
//            color: Colors.white,
//            onSelected: handleClick,
//            itemBuilder: (BuildContext context) {
//              return {'Merge Sort', 'Quick Sort',
//              'Selection Sort','Bubble Sort','Insertion Sort'
//              }.map((String choice) {
//                return PopupMenuItem<String>(
//                  value: choice,
//                  child: Text(choice),
//                );
//              }).toList();
//            },
//          ),
          DropdownButton<String>(
            hint: Text("Change Algo"),
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward,
            color: Colors.red,),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize:  18.0
            ,),
            underline: Container(
              height: 6,
              color: Colors.blue,
            ),
            onChanged: (String newValue) {
              setState(() {
                switch (newValue) {
                  case 'Merge Sort':

                    setState(() {
                      s=0;
                    });

                    break;

                  case 'Quick Sort':
                    setState(() {
                      s=1;
                      print(s);
                    });

                    break;

                  case 'Selection Sort':
                    setState(() {
                      s=2;
                      print(s);
                    });

                    break;
                  case 'Bubble Sort':
                    setState(() {
                      s=3;
                      print(s);
                    });

                    break;
                  case 'Insertion Sort':
                    setState(() {
                      s=4;
                      print(s);
                    });

                    break;

                }

                title = newValue;
              });
            },
            items: <String>['Merge Sort', 'Quick Sort',
            'Selection Sort','Bubble Sort','Insertion Sort']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
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

  color: Colors.red,
             onPressed:
             () async{

               switch (s)
               {
                 case 0:
                   await mergeSort(0,arraysize-1);
                   break;
                 case 1:
                   await quickSort(0,arraysize-1);
                   break;
                 case 2:
                    selectionSort();
                   break;
                 case 3:
                   bubblesort();
                   break;
                 case 4:
                   insertionSort();
                   break;

               }
             }


             ,
             child: Text(
                 title,
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
         ),
         Expanded(
           child: FlatButton(
color: Colors.blue,
             onPressed: randomise,
             child: Text(
                 "RANDOMISE",
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
         ),
         Expanded(
           child: FlatButton(
             color: Colors.yellow,
             onPressed: (){
               setState(() {
                menu();
               });
             },
             child: Text(
                 "SETTINGS",
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontWeight: FontWeight.bold,

               ),
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