part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.response = const DefaultResponse(),
    this.postList = const [],
  });

  final DefaultResponse response;

  final List<Posts> postList;

  HomeState copyWith({
    DefaultResponse? response,
    List<Posts>? postList,
  }) {
    return HomeState(
      response: response ?? this.response,
      postList: postList ?? this.postList,
    );
  }

  @override
  List<Object> get props => [response, postList];
}

final class HomeInitial extends HomeState {}
