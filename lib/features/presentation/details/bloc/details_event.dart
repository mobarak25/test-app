part of 'details_bloc.dart';

sealed class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class GetDetails extends DetailsEvent {
  const GetDetails({required this.itemData});
  final Item itemData;
}
