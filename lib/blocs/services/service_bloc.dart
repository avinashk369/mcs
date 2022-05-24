import 'package:bloc/bloc.dart';
import 'package:mcs/models/services/service_item.dart';

class ServiceBloc extends Cubit<List<ServiceItem>> {
  ServiceBloc() : super([]);

  Future<void> loadServices() async {
    try {
      List<ServiceItem> items = [
        ServiceItem()
          ..name = 'Mechanics'
          ..serviceImage = 'assets/images/mechanic.png',
        ServiceItem()
          ..name = 'Insurance'
          ..serviceImage = 'assets/images/mechanic.png',
        ServiceItem()
          ..name = 'Shop'
          ..serviceImage = 'assets/images/mechanic.png',
        ServiceItem()
          ..name = 'Buy/Sell'
          ..serviceImage = 'assets/images/mechanic.png',
        ServiceItem()
          ..name = 'Fast Tag'
          ..serviceImage = 'assets/images/mechanic.png',
      ];
      emit(items);
    } catch (_) {}
  }
}
