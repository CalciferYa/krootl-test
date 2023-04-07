import 'package:get_it/get_it.dart';
import 'package:presentation/di/bloc_module.dart' as bloc_module;
import 'package:presentation/di/router_module.dart' as router_module;

void init(GetIt locator) {
  router_module.init(locator);
  bloc_module.init(locator);
}
