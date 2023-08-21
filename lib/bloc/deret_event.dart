part of 'deret_bloc.dart';

abstract class DeretEvent extends Equatable {
  const DeretEvent();

  @override
  List<Object> get props => [];
}

class DeretProcess extends DeretEvent {
  final int n;
  final int options;

  const DeretProcess({
    required this.n,
    required this.options,
  });
}
