import 'package:flutter/material.dart';
import 'package:yoga_app/widget/costom_appbar.dart';

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
    _iconTween =
        ColorTween(begin: Colors.white, end: Colors.lightBlue)
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
          .animateTo(scrollNotification.metrics.pixels/80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroller = true;
    }
    return scroller;
  }

  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
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
                          Container(
                            height: 500,
                            color: Colors.green,
                          ),
                          Container(
                            height: 1000,
                            color: Colors.blue,
                          ),
                          Container(
                            height: 1000,
                            color: Colors.yellow,
                          )
                        ],
                      )
                  //   ],
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
