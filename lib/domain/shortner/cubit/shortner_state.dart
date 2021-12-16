part of 'shortner_cubit.dart';

@immutable
abstract class ShortnerState {}

class ShortnerInitial extends ShortnerState {}

class ShortnerLoading extends ShortnerState {}

class ShortnerCompleted extends ShortnerState {
  final dynamic message;
  final dynamic mainUrl;
  final bool isSigned;

  ShortnerCompleted({
    required this.message,
    required this.mainUrl,
    required this.isSigned,
  });
}

class ShortnerError extends ShortnerState {
  final String error;
  ShortnerError({required this.error});
}
