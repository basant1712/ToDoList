part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitialState extends TodoState {}
final class TodoSuccess extends TodoState {}
