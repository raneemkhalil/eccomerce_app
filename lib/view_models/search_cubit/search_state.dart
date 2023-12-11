part of 'search_cubit.dart';

class SearchState {
  const SearchState();
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<String> listLastSearched;
  final List<PopulerSearchedItem> listPopulerSearch;
  
  const SearchLoaded({required this.listLastSearched, required this.listPopulerSearch});
}

final class SearchError extends SearchState {
  final String message;

  const SearchError({required this.message});
}
