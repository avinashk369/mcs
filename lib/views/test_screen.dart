import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/test/testbloc.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TestBloc bloc1 = TestBloc();
    TestBloc bloc2 = TestBloc();
    TestBloc bloc3 = TestBloc();
    return BlocProvider(
        create: (context) => bloc1..add(const TestEvent1()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Test'),
          ),
          body: Stack(
            children: [
              Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () => bloc1.add(const TestEvent1()),
                          child: const Text("Event1")),
                      const SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () => bloc2
                              .add(const TestEvent2(message: " I am event 2")),
                          child: const Text("Event2")),
                      const SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () =>
                              bloc3.add(const TestEvent3(check: false)),
                          child: const Text("Event3")),
                    ],
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<TestBloc, TestState>(
                  builder: (context, state) {
                    return state.maybeMap(
                      testState1: (value) =>
                          const Center(child: Text('I am state 1')),
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  BlocBuilder<TestBloc, TestState>(
                    bloc: bloc2,
                    builder: (context, state) {
                      return state.maybeMap(
                        testState2: (value) => Center(
                            child: Text('I am state 2 ${value.message}')),
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                  BlocBuilder<TestBloc, TestState>(
                    bloc: bloc3,
                    builder: (context, state) {
                      return state.maybeMap(
                        testState3: (value) =>
                            Center(child: Text('I am state 3 ${value.check}')),
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
