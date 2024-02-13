part of 'header_bloc.dart';

sealed class HeaderEvent extends Equatable {
  const HeaderEvent();

  @override
  List<Object> get props => [];
}

class GenerateHeadings extends HeaderEvent {
  int userCurrentindex;
  GenerateHeadings({required this.userCurrentindex});
}
