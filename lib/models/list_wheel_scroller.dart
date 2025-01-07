
import 'package:flutter/material.dart';

class ListWheelScroller extends StatelessWidget {
  final List<String> item;
  const ListWheelScroller({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    
    return ListWheelScrollView(
                magnification: 1.3,
                controller: FixedExtentScrollController(initialItem: item.length~/2),
                useMagnifier: true,
                overAndUnderCenterOpacity: 0.3,
                physics: const FixedExtentScrollPhysics(),
                itemExtent: 50,
                diameterRatio: 1.5,
                children: item.map((e){
                  return Text(e,style: const TextStyle(color: Colors.white,fontSize: 25,),);
                }).toList()

                //  List.generate(
                //   100,
                //   (index) => Text(
                //     (index + 1).toString(),
                //     style: const TextStyle(
                //       color: Colors.white,
                //       fontSize: 30,
                //     ),
                //   ),
                // ),
              );
  }
}