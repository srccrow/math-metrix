import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mathgame/src/data/models/picture_puzzle.dart';
import 'package:mathgame/src/ui/picturePuzzle/circle_shape.dart';
import 'package:mathgame/src/ui/picturePuzzle/picture_puzzle_answer_button.dart';
import 'package:mathgame/src/ui/picturePuzzle/square_shape.dart';
import 'triangle_shape.dart';

class PicturePuzzleButton extends StatelessWidget {
  final PicturePuzzleShape picturePuzzleShape;
  final Color shapeColor;

  PicturePuzzleButton({
    required this.picturePuzzleShape,
    required this.shapeColor,
  });

  @override
  Widget build(BuildContext context) {
    switch (picturePuzzleShape.type) {
      case PicturePuzzleQuestionItemType.shape:
        return CustomPaint(
          painter: picturePuzzleShape.picturePuzzleShapeType ==
                  PicturePuzzleShapeType.CIRCLE
              ? CircleShape(shapeColor, 1)
              : (picturePuzzleShape.picturePuzzleShapeType ==
                      PicturePuzzleShapeType.TRIANGLE
                  ? TriangleShape(shapeColor, 1)
                  : SquareShape(shapeColor, 1)),
          size: Size(38, 38),
        );
      case PicturePuzzleQuestionItemType.sign:
        return Container(
          alignment: Alignment.center,
          width: 38,
          child: Text(
            picturePuzzleShape.text,
            style:
                Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 30),
          ),
        );
      case PicturePuzzleQuestionItemType.hint:
        return Container(
          alignment: Alignment.center,
          width: 56,
          child: Text(
            picturePuzzleShape.text,
            style:
                Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 24),
          ),
        );
      case PicturePuzzleQuestionItemType.answer:
        return PicturePuzzleAnswerButton(picturePuzzleShape);
    }
  }
}
