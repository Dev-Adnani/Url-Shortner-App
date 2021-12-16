import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshortner/app/const/app.colors.dart';
import 'package:urlshortner/app/routes/api.routes.dart';
import 'package:urlshortner/domain/shortner/cubit/shortner_cubit.dart';
import 'package:urlshortner/presentation/widgets/custom.text.field.dart';
import 'package:urlshortner/presentation/widgets/dimensions.widget.dart';
import 'package:urlshortner/presentation/widgets/heading.widget.dart';

class RandomShortView extends StatelessWidget {
  RandomShortView({Key? key}) : super(key: key);
  final TextEditingController destinationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ShortnerCubit shortnerCubit =
        BlocProvider.of<ShortnerCubit>(context, listen: false);

    _doit() {
      if (_formKey.currentState!.validate()) {
        shortnerCubit.randomUrl(
          destination: destinationController.text,
          context: context,
        );
      }
    }

    Widget _body({required ShortnerState shortnerState}) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 2.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                ),
              ),
            ),
            headingWidget(),
            vSizedBox2,
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                            textEditingController: destinationController,
                            hintText: 'Enter Your Long Url Here',
                            validator: (val) => val!.isEmpty
                                ? 'Enter Your Long Url Here'
                                : null,
                          ),
                        ),
                        vSizedBox1,
                      ],
                    ),
                  ),
                  vSizedBox2,
                ],
              ),
            ),
            vSizedBox2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: AppColors.greenColor,
                  height: MediaQuery.of(context).size.height * 0.05,
                  minWidth: MediaQuery.of(context).size.width * 0.4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () async {
                    _doit();
                  },
                  child: const Text(
                    'Short It',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                MaterialButton(
                  color: AppColors.yellowColor,
                  height: MediaQuery.of(context).size.height * 0.05,
                  minWidth: MediaQuery.of(context).size.width * 0.4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () async {
                    if (shortnerState is ShortnerCompleted) {
                      if (shortnerState.isSigned) {
                        Clipboard.setData(
                          ClipboardData(
                            text: ApiRoutes.baseurl +
                                "/" +
                                shortnerState.mainUrl.toString(),
                          ),
                        ).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Url copied to clipboard"),
                            ),
                          );
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Oops  ${shortnerState.message},"),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Copy It',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: BlocListener<ShortnerCubit, ShortnerState>(
          listener: (context, state) {
            if (state is ShortnerError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
            if (state is ShortnerCompleted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message.toString()),
                ),
              );
            }
          },
          child: BlocBuilder<ShortnerCubit, ShortnerState>(
            builder: (context, state) {
              return _body(shortnerState: state);
            },
          ),
        ),
      ),
    );
  }
}
