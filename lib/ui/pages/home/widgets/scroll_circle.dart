

import 'package:flutter/material.dart';

class ScrollCircle extends StatelessWidget {
  const ScrollCircle({
    super.key,
    required this.currentPage,
    required this.length,
  });
  final int currentPage;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        alignment: Alignment.bottomCenter,
        height: 10,
        child: Align(
          alignment: Alignment.center,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: 8,
                width: 8,
                margin: const EdgeInsets.only(left: 3, right: 3),
                decoration: BoxDecoration(
                    color: currentPage != index
                        ? const Color.fromARGB(48, 255, 255, 255)
                        : const Color.fromARGB(120, 255, 255, 255),
                    shape: BoxShape.circle),
              );
            },
            itemCount: length,
          ),
        ));
  }
}
