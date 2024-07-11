import 'package:injectable/injectable.dart';
import 'package:route_task/DI/DI.config.dart';
import 'package:get_it/get_it.dart';
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();