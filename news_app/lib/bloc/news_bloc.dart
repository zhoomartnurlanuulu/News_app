// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:news_app/bloc/news_repository.dart';
// import 'package:news_app/helpers/news_exceptions.dart';
// import 'package:news_app/model/news_model.dart';

// part 'news_event.dart';
// part 'news_state.dart';

// class NewsBloc extends Bloc<NewsEvent, NewsState> {
//   NewsRepository repository = NewsRepository();

//   NewsBloc() : super(NewsInitial());

//   @override
//   Stream<NewsState> mapEventToState(
//     NewsEvent event,
//   ) async* {
//        if (event is GetNewsEvent) {
//       try {
//         List<NewsModel> data = await repository.getNews();
//         yield NewsLoaded(data);
//         //print(data);
//       } catch (e) {
//         yield NewsError(NewsExceptions.catchError(e));
//       }
//   }
// }
