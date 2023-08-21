import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'deret_event.dart';
part 'deret_state.dart';

class DeretBloc extends Bloc<DeretEvent, DeretState> {
  DeretBloc() : super(const DeretInitial(output: '',option: 0 )) {
    // on<DeretEvent>((event, emit) {
    // });

    on<DeretProcess>((event, emit) {
      if (event.options == 1) {
        String output = generateSeries1(event.n);
        emit(DeretState(output: output, option: 1));
      }
      if (event.options == 2) {
        String output = generateSeries2(event.n);
        emit(DeretState(output: output, option: 2));
      }
      if (event.options == 3) {
        String output = generateSeries3(event.n);
        emit(DeretState(output: output, option: 3));
      }
      if (event.options == 4) {
        String output = generateSeries4(event.n);
        emit(DeretState(output: output, option: 4));
      }
    });
  }
}

  //logic for 1
   String generateSeries1(int n) {
    String series = '';
    for (int i = 1; i <= n; i++) {
      series += '$i';
    }
    return series;
  }
  //logic for 2
  String generateSeries2(int n) {
    String series = '';
    
    for (int i = 1; i <= n; i++) {
      series += '$i';
    }
    
    for (int i = n - 1; i >= 1; i--) {
      series += '$i';
    }
    
    return series;
  }

//logic for 3
String generateSeries3(int n) {
    String series = '';
    int currentNumber = 10;
    
    for (int i = 1; i <= n; i++) {
      series += '$currentNumber ';
      currentNumber += 11;
    }
    
    return series.trim();
  }



//logic for 4
String generateSeries4(int n) {
  String result = '';
  for (int i = 1; i <= n; i++) {
    if (i % 5 == 0) {
      result += 'FIVE ';
    } else if (i % 7 == 0) {
      result += 'SEVEN ';
    } else {
      result += '$i ';
    }
  }
  return result.trim();
}
