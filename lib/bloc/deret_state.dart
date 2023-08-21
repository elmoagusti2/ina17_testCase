part of 'deret_bloc.dart';

 class DeretState extends Equatable {
    final String output;
    final int option;
  const DeretState({required this.output, required this.option});
  
  @override
  List<Object> get props => [
    output
  ];

  DeretState copyWith({String? output, int? option}) {
    return DeretState(
        output: output ?? this.output,
        option:  option ?? this.option);
  }
}

class DeretInitial extends DeretState {
  const DeretInitial({required super.output, required super.option});
}
