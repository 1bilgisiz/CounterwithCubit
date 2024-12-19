import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(const BlocInitial(baslangicdegeri: 30)) {
    on<ArtirCounterEvents>((event, emit) {
      emit(MyCounterState(sayacDegeri: state.sayac + 1));
    });

    on<AzaltCounterEvents>((event, emit) {
      emit(MyCounterState(sayacDegeri: state.sayac - 1));
    });
  }
}
