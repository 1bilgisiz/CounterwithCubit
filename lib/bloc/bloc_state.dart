part of 'bloc_bloc.dart';

@immutable
sealed class BlocState {
  final int sayac;
  const BlocState({required this.sayac});
}

final class BlocInitial extends BlocState {
  const BlocInitial({required baslangicdegeri}) : super(sayac: baslangicdegeri);
}

class MyCounterState extends BlocState {
  const MyCounterState({required int sayacDegeri}) : super(sayac: sayacDegeri);
}
