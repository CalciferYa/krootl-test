import 'package:data/di/datasource_module.dart' as datasource_module;
import 'package:data/di/network_module.dart' as network_module;
import 'package:data/di/repository_module.dart' as repository_module;
import 'package:get_it/get_it.dart';

Future<void> init(GetIt locator) async {
  network_module.init(locator);
  datasource_module.init(locator);
  repository_module.init(locator);
}
