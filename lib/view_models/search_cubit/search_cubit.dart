import 'package:ecommerce/models/last_searches_model.dart';
import 'package:ecommerce/models/populer_searches_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void getSearchData(){
    emit(SearchLoading());
    Future.delayed(const Duration(seconds: 2), (){
      emit(SearchLoaded(listLastSearched: lastSearches, listPopulerSearch: listPopulerSearch));
    });
  }
}
