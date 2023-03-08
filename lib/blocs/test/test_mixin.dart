import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/test/test_bloc.dart';

mixin TestMixin<E extends TestEvent, S extends TestState> on Bloc<E, S> {
  // common logic...
  void toggle() {
    print('into toggle');
  }
}
