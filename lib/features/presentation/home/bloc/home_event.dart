part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends HomeEvent {}

class PageIncrement extends HomeEvent {}

class GoToDetails extends HomeEvent {
  const GoToDetails({required this.details});
  final Item details;
}
