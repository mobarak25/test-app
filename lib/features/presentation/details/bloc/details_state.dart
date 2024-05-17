part of 'details_bloc.dart';

class DetailsState extends Equatable {
  const DetailsState({
    this.itemDetails = const Item(),
  });

  final Item itemDetails;

  DetailsState copyWith({Item? itemDetails}) {
    return DetailsState(
      itemDetails: itemDetails ?? this.itemDetails,
    );
  }

  @override
  List<Object> get props => [itemDetails];
}

final class DetailsInitial extends DetailsState {}
