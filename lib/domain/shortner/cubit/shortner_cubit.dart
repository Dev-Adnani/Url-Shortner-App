import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:urlshortner/data/shortner/repository/shortner.repository.dart';
part 'shortner_state.dart';

class ShortnerCubit extends Cubit<ShortnerState> {
  final ShortnerRepository shortnerRepository;

  ShortnerCubit({required this.shortnerRepository}) : super(ShortnerInitial());

  Future customUrl(
      {required String destination,
      required String customText,
      required BuildContext context}) async {
    try {
      emit(ShortnerLoading());
      var _response = await shortnerRepository.customUrl(
        destination: destination,
        customText: customText,
      );
      if (_response != null) {
        bool isSigned = _response['received'];
        String message = _response['message'];
        String mainUrl = _response['url'];
        emit(
          ShortnerCompleted(
              message: message, mainUrl: mainUrl, isSigned: isSigned),
        );
        if (isSigned) {
          return _response;
        }
      }
    } catch (e) {
      emit(ShortnerError(error: e.toString()));
    }
  }

  Future randomUrl({
    required String destination,
    required BuildContext context,
  }) async {
    try {
      emit(ShortnerLoading());
      var _response =
          await shortnerRepository.randomUrl(destination: destination);

      if (_response != null) {
        bool isSigned = _response['received'];
        String message = _response['message'];
        String mainUrl = _response['url'];
        emit(
          ShortnerCompleted(
              message: message, mainUrl: mainUrl, isSigned: isSigned),
        );
        if (isSigned) {
          return _response;
        }
      }
    } catch (e) {
      emit(ShortnerError(error: e.toString()));
    }
  }
}
