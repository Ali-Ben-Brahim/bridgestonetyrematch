import 'package:flutter/material.dart';
import 'package:flutter_blue_app/pages/table_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Calucl_page.dart';

// ignore: must_be_immutable
class Slidepage extends StatefulWidget {
  String title;
  Slidepage({Key key, this.title}) : super(key: key);
  @override
  State<Slidepage> createState() => _SlidepageState();
}

class _SlidepageState extends State<Slidepage> {
  int activateIndex = 0;
  Widget buildindicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activateIndex,
      count: 2,
      effect: SlideEffect(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Data"),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height *0.75,
              child: PageView(
                onPageChanged: ((value) {
                  setState(() {
                    activateIndex = value;
                  });
                }),
                children: [
                  Detailschart(
                    data: widget.title,
                  ),
                  Calculpage(data: widget.title)
                ],
              ),
            ),
            SizedBox(height: 20,),
            buildindicator()
          ],
        ));
  }
}
