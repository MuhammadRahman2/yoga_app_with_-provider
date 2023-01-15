import 'package:flutter/material.dart';

class StackImageText extends StatelessWidget {
  final String? title;
  final String? discribe;
  final String? imageUrl;
  const StackImageText({Key? key, this.title, this.discribe, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl!))),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Column(
            children: [
              Container(
                color: Colors.black.withOpacity(0.4),
                child: Text(
                  title!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Container(
                color: Colors.black.withOpacity(0.4),
                child: Text(
                  discribe!,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
