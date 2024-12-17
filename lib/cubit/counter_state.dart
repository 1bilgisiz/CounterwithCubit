part of 'counter_cubit.dart';

@immutable
sealed class CounterState {
  final int sayac;
  const CounterState({required this.sayac});
}

final class CounterInitial extends CounterState {
  const CounterInitial({required baslangicdegeri})
      : super(sayac: baslangicdegeri);
}

class MyCounterState extends CounterState {
  const MyCounterState({required int sayacDegeri}) : super(sayac: sayacDegeri);
}
