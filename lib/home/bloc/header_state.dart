// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'header_bloc.dart';

class HeaderState extends Equatable {
  List<String> headingList = [
    'Recomended',
    'Super Deals',
    'Vegans',
    'Buy 1 Get 1'
  ];
  int currentIndex = 0;

  HeaderState(this.currentIndex);

  @override
  List<Object> get props => [headingList, currentIndex];

  HeaderState copyWith({
    int? currentIndex,
  }) {
    return HeaderState(
      currentIndex ?? this.currentIndex,
    );
  }
}
