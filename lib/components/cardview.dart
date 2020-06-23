import 'package:flutter/material.dart';

class cardView extends StatelessWidget {

//   cardView({Icon icon.this});
  cardView(this.colors,this.hght,this.cardChild);
  final Color colors;
  final Widget cardChild;
  double hght;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      height: hght,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colors,


      ),



      margin: EdgeInsets.all(10.0),


    );
  }
}

//    showModalBottomSheet(context: context, builder: (builder)
//        {
//          return Container(
//
//            child: Expanded(
//              child: cardView(Colors.teal,250,
//              Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment:MainAxisAlignment.center,
//              children: <Widget>[
//              Text(
//              "HEIGHT",
//              style: TextStyle(
//              fontSize: 25.0,
//              color: Colors.white,
//
//          ),
//
//          ),
//          SizedBox(
//          height: 10.0,
//          ),
//          Row(
//          crossAxisAlignment: CrossAxisAlignment.baseline,
//          textBaseline: TextBaseline.alphabetic ,
//          mainAxisAlignment: MainAxisAlignment.center,
//
//          children: <Widget>[
//
//
//          Text(
//
//          arraysize.toString(),style:
//          TextStyle(
//          fontSize: 50.0,
//          fontWeight: FontWeight.bold,
//          color: Colors.white,
//          ),
//          ),
//          Text(
//
//          " cm",style:
//          TextStyle(
//          fontSize: 50.0,
//          color: Colors.white,
//          fontWeight: FontWeight.bold,
//          ),
//          ),
//
//          ],
//          ),
//          SliderTheme(
//          data: SliderTheme.of(context).copyWith(
//          activeTrackColor: Colors.white,
//          thumbColor: Color(0xFFEB1555),
//          overlayColor: Color(0x29EB1555),
//          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
//          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
//          ),
//          child: Slider(
//          max: 220,
//          min: 80,
//          value: arraysize.toDouble(),
//
//
//          inactiveColor: Colors.black,
//
//          onChanged: (double value){
//
//          setState(() {
//
//          arraysize=value.round();
//          });
//          },
//        ),
//        )
//
//        ],
//        ),),
//          ),);
//        });