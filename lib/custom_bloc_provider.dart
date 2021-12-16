import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urlshortner/data/shortner/network/shortner.network.dart';
import 'package:urlshortner/data/shortner/repository/shortner.repository.dart';
import 'package:urlshortner/domain/shortner/cubit/shortner_cubit.dart';
import 'main.dart';

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShortnerCubit>(
          create: (context) => ShortnerCubit(
              shortnerRepository: ShortnerRepository(
            shortnerNetwork: ShortnerNetwork(),
          )),
        ),
      ],
      child: const Lava(),
    );
  }
}
