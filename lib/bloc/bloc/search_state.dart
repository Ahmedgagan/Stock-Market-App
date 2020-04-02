part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class Search extends SearchState {}

class SearchLoading extends SearchState {}

class SearchEmpty extends SearchState {}

class SearchLoaded extends SearchState {

  final List<SearchHistory> symbols;

  SearchLoaded({
    @required this.symbols
  });

}
