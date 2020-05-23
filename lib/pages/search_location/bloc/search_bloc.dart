import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta_weather/model/location.dart';
import 'package:meta_weather/service/http.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  SearchState get initialState => SearchNoTerm();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
  }
}

class SearchLocationBloc {
  final Sink<String> onTextChanged;
  final Stream<SearchState> state;
  factory SearchLocationBloc() {
    final onTextChanged = PublishSubject<String>();
    final state = onTextChanged
        .distinct()
        .debounceTime(Duration(milliseconds: 250))
        .where((term) => term?.isNotEmpty ?? false)
        .switchMap<SearchState>((String term) => _search(term))
        .startWith(SearchNoTerm());
    return SearchLocationBloc._(onTextChanged, state);
  }

  SearchLocationBloc._(this.onTextChanged, this.state);

  dispose() {
    onTextChanged.close();
  }

  static Stream<SearchState> _search(String term) async* {
    if (term.isEmpty) {
      yield SearchNoTerm();
    } else {
      yield SearchLoading();

      try {
        final result = await Http.getInstance().searchLocationByName(term);

        if (result.isEmpty) {
          yield SearchEmpty();
        } else {
          yield SearchPopulated(result);
        }
      } catch (e) {
        yield SearchError();
      }
    }
  }
}
