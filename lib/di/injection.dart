import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true, asExtension: true)
void configureDependencies() => getIt.init();