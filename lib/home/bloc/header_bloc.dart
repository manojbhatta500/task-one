import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'header_event.dart';
part 'header_state.dart';

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  HeaderBloc() : super(HeaderState(0)) {
    on<GenerateHeadings>(_generateHeadings);
  }

  FutureOr<void> _generateHeadings(
      GenerateHeadings event, Emitter<HeaderState> emit) {
    var inputCurrentIndex = event.userCurrentindex;

    log('user current index :$inputCurrentIndex');

    emit(state.copyWith(currentIndex: inputCurrentIndex));
  }
}
