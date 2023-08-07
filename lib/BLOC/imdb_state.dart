part of 'imdb_bloc.dart';

@immutable
abstract class ImdbState {}

class ImdbInitial extends ImdbState {}
class ImdbLoading extends ImdbState {}
class ImdbLoaded extends ImdbState {}
class ImdbError extends ImdbState{}

