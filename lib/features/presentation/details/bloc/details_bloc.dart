import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/domain/entities/flutter_repository_response.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<GetDetails>(_getDetails);
  }

  FutureOr<void> _getDetails(GetDetails event, Emitter<DetailsState> emit) {
    emit(state.copyWith(itemDetails: event.itemData));
  }
}
