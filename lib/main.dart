import 'package:cubitcounter/bloc/bloc_bloc.dart';
import 'package:cubitcounter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterCubit(),
          ),
          BlocProvider(
            create: (context) => BlocBloc(),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Counter App",
            theme: ThemeData(primaryColor: Colors.blue),
            home: const MyHomePage()));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text('Cubit Kullanımı'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<BlocBloc, BlocState>(
                builder: (context, BlocState state) {
                  return Text(
                    state.sayac.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<BlocBloc>().add(ArtirCounterEvents());
              },
              tooltip: "Tıkla",
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(44)),
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<BlocBloc>().add(AzaltCounterEvents());
              },
              tooltip: "Tıkla",
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(44)),
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
