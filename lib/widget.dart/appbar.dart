
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appbar extends StatelessWidget {
  const appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding:  EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                child: Container(
                padding:  EdgeInsets.all(8),
                decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: .4, color: Colors.grey),
            ),
            child: Icon(CupertinoIcons.bars, color: Color(0xff8e593a),),
          ),
         ),

             Text('أهـــــل الشاورمــــا', style: TextStyle( color: Color.fromARGB(255, 90, 56, 37), fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'NotoNastaliqUrdu'),),

                    InkWell(
                  onTap: () {        
                  },
          child: Container(
            padding:  EdgeInsets.all(8),
            decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: .4, color: Colors.grey),
            ),
            child: Icon(Icons.notifications, color: Color(0xff8e593a),),
          ),
                )
              ],
            ),
        );
  }

  }

