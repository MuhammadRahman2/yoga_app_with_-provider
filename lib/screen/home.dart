import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yoga_app/widget/costom_appbar.dart';
import 'package:yoga_app/widget/top_time.dart';

import '../widget/stack_image_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _colorAnimationController;
  late AnimationController _textAnimationController;
  late Animation _colorTween, _homeTween, _yogatween, _iconTween, _drawerTween;

  @override
  void initState() {
    _colorAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_colorAnimationController);
    _iconTween = ColorTween(begin: Colors.white, end: Colors.lightBlue)
        .animate(_colorAnimationController);
    _drawerTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_colorAnimationController);
    _homeTween = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_colorAnimationController);
    _yogatween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_colorAnimationController);
    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 0),
    );

    super.initState();
  }

  bool scrollListener(ScrollNotification scrollNotification) {
    bool scroller = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _colorAnimationController
          .animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroller = true;
    }
    return scroller;
  }

  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  String imageUrlOne =
      "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80";
  String imageUrlTwo =
      "https://images.unsplash.com/photo-1510894347713-fc3ed6fdf539?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  String imageUrlThree =
      "https://images.unsplash.com/photo-1573590330099-d6c7355ec595?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white,
      drawer: Drawer(),
      body: NotificationListener(
        onNotification: scrollListener,
        child: Stack(
          children: [
            // SizedBox(
            //   height: double.infinity,
            //   child:
            //  Stack(
            //   children: [
            SingleChildScrollView(
              // bocdy
              child:
                  // Stack(
                  //   children: [
                  Column(
                children: [ 
                  const TopTime(),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Yoga for All',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      StackImageText(
                          imageUrl: imageUrlOne,
                          title: 'Yoga for Begineers',
                          discribe: 'last Time: 2 Feb'),
                      StackImageText(
                        imageUrl: imageUrlTwo,
                        title: 'Weight Loss Yog',
                        discribe: 'Last Time : 22 Jan',
                      ),
                      StackImageText(
                        imageUrl: imageUrlThree,
                        title: 'Bangash',
                        discribe: 'Last Time : Yesterday',
                      )
                    ],
                  )
                ],
              ),
              //
              // ],
              // ),
            ),
            CustomAppBar(
              animationController: _colorAnimationController,
              colorTween: _colorTween,
              drawerTween: _drawerTween,
              iconTween: _iconTween,
              yogaTween: _yogatween,
              homeTween: _homeTween,
              onPress: () {
                _globalKey.currentState!.openDrawer();
              },
            ),
            //   ],
            // ),
            // )
          ],
        ),
      ),
    );
  }
}
