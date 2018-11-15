library simple_slider;

import 'dart:async';

import 'package:flutter/material.dart';

class SimpleSlider extends StatefulWidget {

  final Duration duration;
  final List<Image> images;
  final Color activeColor;
  final Color inactiveColor;

  SimpleSlider(this.images, {this.duration = const Duration(seconds: 1), this.activeColor = Colors.black, this.inactiveColor = Colors.grey});

  @override
  _SimpleSliderState createState() => _SimpleSliderState();
}

class _SimpleSliderState extends State<SimpleSlider> {
  PageController _controller;
  Timer timer;
  List<bool> isActive = List();

  @override
  void initState() {
    super.initState();
    for (int i = 0 ; i < widget.images.length ; i++) {
      if (i == 0) isActive.add(true);
      else isActive.add(false);
    }

    _controller = PageController();

    timer = Timer.periodic(Duration(seconds: 3), (_) {
      _controller.nextPage(
          duration: widget.duration, curve: Curves.easeInOut);
      setState(() {
        int active = _controller.page.toInt() % widget.images.length;
        if (active + 1 < widget.images.length) {
          isActive[active + 1] = true;
          isActive[active] = false;
        } else {
          isActive[0] = true;
          isActive[widget.images.length - 1] = false;
        }
      });
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> indicator = List();
    for (int i = 0 ; i < widget.images.length ; i++) {
      indicator.add(Container(
        width: 4.0,
        height: 4.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive[i] ? widget.activeColor : widget.inactiveColor,
        ),
      ));
      if (i < widget.images.length - 1) {
        indicator.add(SizedBox(width: 16.0,),);
      }
    }

    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                itemBuilder: (context, index) {
                  return widget.images[index % widget.images.length];
                },
              ),
            ),
            SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicator,
            ),
          ],
        ),
        Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}

