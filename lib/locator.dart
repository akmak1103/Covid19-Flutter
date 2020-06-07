import 'ui/widgets/table.dart';

import './viewModels/state_model.dart';

import './services/api.dart';
import 'package:get_it/get_it.dart';
GetIt locator = GetIt.instance;

void setupLocator() {

  //register singletons and other required classes here
  locator.registerLazySingleton(() => API());
  locator.registerLazySingleton(() => TableData());
  locator.registerLazySingleton(() => StateModel());

}