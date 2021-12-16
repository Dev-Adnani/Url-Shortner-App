import 'package:flutter/material.dart';
import 'package:urlshortner/app/const/app.colors.dart';
import 'package:urlshortner/presentation/widgets/dimensions.widget.dart';

Widget headingWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      vSizedBox3,
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
        child: RichText(
          text: TextSpan(
            text: 'Hey There',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: AppColors.white,
              fontSize: 40.0,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Did ',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 28.0,
                      color: AppColors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'You ',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: AppColors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: 'Short It ? 🤯',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: AppColors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      vSizedBox2,
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Get Your ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  TextSpan(
                    text: 'Custom ',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'Url Right Now ! ',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
