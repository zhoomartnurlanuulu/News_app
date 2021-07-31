import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc() : super(ContentInitial());

  @override
  Stream<ContentState> mapEventToState(
    ContentEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
