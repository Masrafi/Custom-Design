import 'dart:developer';

import 'package:flutter/material.dart';

class CustomExpansion extends StatefulWidget {
  const CustomExpansion({Key? key}) : super(key: key);

  @override
  State<CustomExpansion> createState() => _CustomExpansionState();
}

class _CustomExpansionState extends State<CustomExpansion>
    with SingleTickerProviderStateMixin {
  bool isExpand = false;
  late AnimationController animationController;
  late Animation<double> expandAnimation;
  late Animation<double> rotationAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    expandAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    rotationAnimation =
        Tween(begin: 0.0, end: -0.5).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _runExpandCheck() {
    if (isExpand) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isExpand = !isExpand;
                });
                _runExpandCheck();
              },
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Q.',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Text(
                                'widget.questionAndAnswer.title',
                                maxLines: null,
                                overflow: null,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            RotationTransition(
                              turns: rotationAnimation,
                              child: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizeTransition(
                    axisAlignment: 1.0,
                    sizeFactor: expandAnimation,
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        // Expanded(
                        //   flex: 12,
                        //   child: Html(
                        //     onLinkTap: (url, context, _, __) async {
                        //       try {
                        //         if (url != null) {
                        //           await launchUrl(Uri.parse(url));
                        //         }
                        //       } catch (e) {
                        //         log(e.toString());
                        //       }
                        //     },
                        //     data: widget.questionAndAnswer.content,
                        //     style: HtmlUtils.nonePaddingStyle,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  //AppDivider(),
                  const SizedBox(
                    width: double.infinity,
                    child: Divider(
                      height: 4,
                      color: Colors.purple,
                      thickness: 4,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
