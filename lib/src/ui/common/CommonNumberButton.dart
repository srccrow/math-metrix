import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tuple/tuple.dart';

class CommonNumberButton extends StatelessWidget {
  final Function onTab;
  final String text;
  final double height;
  final Tuple2<Color, Color> colorTuple;

  const CommonNumberButton({
    Key? key,
    required this.text,
    required this.onTab,
    this.height = 112,
    required this.colorTuple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 8,
      child: InkWell(
        onTap: () {
          onTab();
        },
        borderRadius: BorderRadius.circular(24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
              alignment: Alignment.center,
              // height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colorTuple.item1, colorTuple.item2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Transform.translate(
                        offset: Offset(-constraints.maxHeight / 3.5, 0),
                        child: Transform.scale(
                          scale: constraints.maxHeight / 16,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            text,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontSize: 18,
                                      color: Colors.white.withOpacity(0.05),
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      );
                    }),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(text,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 24, color: Colors.white)),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
