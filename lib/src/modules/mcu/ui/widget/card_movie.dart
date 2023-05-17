import 'package:flutter/material.dart';
import 'package:marvel/src/core/styles/app_text_styles.dart';
import 'package:marvel/src/modules/mcu/models/movies.dart';

class CardMovie extends StatelessWidget {
  final Movies movie;
  final VoidCallback onPressed;
  const CardMovie({ Key? key, required this.movie, required this.onPressed }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return InkWell(
          onTap: onPressed,
          child: Card(
            elevation: 10,
            child: LayoutBuilder(
              builder: (_, boxConstraints) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: boxConstraints.maxWidth,
                      child: Image.asset(
                        movie.posterPath!,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/movies/capitao2.jpg');
                        },
                      ),
                    ),
                    Text(
                      movie.title!,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.instance.textMedium,
                    ),
                  ],
                );
              },
            ),
          ),
        );
  }
}