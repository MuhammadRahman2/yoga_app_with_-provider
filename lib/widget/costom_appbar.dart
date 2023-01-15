import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final AnimationController? animationController;
  final Animation? colorTween;
  final Animation? homeTween;
  final Animation? yogaTween;
  final Animation? iconTween;
  final Animation? drawerTween;
  final Function()? onPress;
  const CustomAppBar(
      {super.key,
      this.animationController,
      this.colorTween,
      this.homeTween,
      this.yogaTween,
      this.iconTween,
      this.drawerTween,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) {
          return AppBar(
            backgroundColor: colorTween!.value,
            elevation: 0,
            titleSpacing: 0.0,
            leading: IconButton(
              onPressed: onPress,
              icon: Icon(
                Icons.dehaze,
                color: drawerTween!.value,
              ),
            ),
            title: Row(
              children: [
                Text(
                  'hello',
                  style: TextStyle(
                      fontSize: 20,
                      color: homeTween!.value,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ' Yoga',
                  style: TextStyle(
                      fontSize: 20,
                      color: yogaTween!.value,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            actions: [
              Icon(
                Icons.notifications,
                color: iconTween!.value,
              ),
              const Padding(
                padding: EdgeInsets.all(7),
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  // backgroundImage: NetworkImage(),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
