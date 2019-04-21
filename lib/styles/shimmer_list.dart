import 'package:flutter/material.dart';

Widget shimmerList = Column(
    children: [0, 1, 2, 3, 4, 5, 6].map((_) => Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                ),
                Container(
                  width: 100,
                  height: 10.0,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                ),
                Container(
                  width: 70,
                  height: 10.0,
                  color: Colors.white,
                ),
//                Padding(
//                  padding:
//                  const EdgeInsets.symmetric(vertical: 2.0),
//                ),
//                Container(
//                  width: 40.0,
//                  height: 8.0,
//                  color: Colors.white,
//                ),
              ],
            ),
          )
        ],
      ),
    )).toList()
);