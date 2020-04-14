part of 'indexes_bloc.dart';

@immutable
abstract class IndexesState {}

class IndexesInitial extends IndexesState {}

class IndexesLoading extends IndexesState {}

class IndexesLoadingError extends IndexesState {
  final dynamic error;

  IndexesLoadingError({
    @required this.error
  });
}

class IndexesLoaded extends IndexesState {
  final List<MarketIndexModel> indexes;

  IndexesLoaded({
    @required this.indexes,
  });
}
