import 'package:core/di/locator.dart';

//import 'package:data/di/injector.dart' as data_module;
import 'package:domain/di/injector.dart' as domain_module;
import 'package:presentation/di/injector.dart' as presentation_module;

Future<void> init() async {
  //await data_module.init(locator);
  domain_module.init(locator);
  presentation_module.init(locator);
}
