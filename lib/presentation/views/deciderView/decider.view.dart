import 'package:flutter/material.dart';
import 'package:urlshortner/app/const/app.colors.dart';
import 'package:urlshortner/app/routes/app.routes.dart';
import 'package:urlshortner/presentation/widgets/dimensions.widget.dart';

class DeciderView extends StatelessWidget {
  const DeciderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
              child: RichText(
                text: TextSpan(
                  text: 'Hey There',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    // fontFamily: AppFonts.contax,
                    color: AppColors.white,
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
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

                            // fontFamily: AppFonts.contax,
                          ),
                        ),
                        TextSpan(
                          text: 'You ',
                          style: TextStyle(
                            fontSize: 28.0,
                            // fontFamily: AppFonts.contax,
                            color: AppColors.white,

                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: 'Short It ? 🤯',
                          style: TextStyle(
                            fontSize: 28.0,
                            // fontFamily: AppFonts.contax,
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
            vSizedBox3,
            MaterialButton(
              color: AppColors.greenColor,
              height: MediaQuery.of(context).size.height * 0.05,
              minWidth: MediaQuery.of(context).size.width * 0.4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () async {
                Navigator.of(context).pushNamed(AppRouter.customRoute);
              },
              child: const Text(
                'Generate Custom Short Url',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            vSizedBox3,
            MaterialButton(
              color: AppColors.yellowColor,
              height: MediaQuery.of(context).size.height * 0.05,
              minWidth: MediaQuery.of(context).size.width * 0.4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () async {
                Navigator.of(context).pushNamed(AppRouter.randomRoute);
              },
              child: const Text(
                'Generate Random Short Url',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
