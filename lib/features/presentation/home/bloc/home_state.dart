part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.flutterRepository = const FlutterRepository(),
    this.page = 1,
    this.isLoading = false,
    this.isEndList = false,
  });

  final FlutterRepository flutterRepository;
  final int page;
  final bool isLoading;
  final bool isEndList;

  HomeState copyWith({
    FlutterRepository? flutterRepository,
    int? page,
    bool? isLoading,
    bool? isEndList,
  }) {
    return HomeState(
      flutterRepository: flutterRepository ?? this.flutterRepository,
      page: page ?? this.page,
      isEndList: isEndList ?? this.isEndList,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [flutterRepository, page, isEndList, isLoading];
}

final class HomeInitial extends HomeState {}
