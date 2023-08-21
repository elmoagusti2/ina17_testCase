import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/deret_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeretBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter 17',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DeretBloc deretBloc;
  TextEditingController inputN = TextEditingController();
  List number = [1, 2, 3, 4];

  @override
  void initState() {
    deretBloc = BlocProvider.of<DeretBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeretBloc, DeretState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 14),
                  controller: inputN,
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: .5,
                        ),
                      ),
                      label: const Text("Input N")),
                  validator: (value) {
                    return value;
                  },
                ),
                Wrap(
                  children: [
                    for (var item in number)
                      Container(
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: state.option == item
                                    ? Colors.purple
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                deretBloc.add(DeretProcess(
                                    n: int.parse(inputN.text), options: item));
                              },
                              child: Text(item.toString())))
                  ],
                ),
                Column(
                  children: [
                    const Text('Result:'),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(state.output)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
