import 'package:flutter/material.dart';
import 'package:marvel/src/core/styles/app_text_styles.dart';
import 'package:marvel/src/modules/mcu/models/movies.dart';

class CardMovie extends StatelessWidget {
  final Movies movie;
  final VoidCallback onPressed;
  const CardMovie({Key? key, required this.movie, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: LayoutBuilder(
        builder: (_, boxConstraints) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: boxConstraints.maxHeight * .8,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    'assets/movies${movie.posterPath}',
                  ),
                ),
              ),
              Text(
                movie.title!,
                textAlign: TextAlign.center,
                style:
                    AppTextStyles.instance.text.copyWith(color: Colors.white),
              ),
            ],
          );
        },
      ),
    );
  }
}
