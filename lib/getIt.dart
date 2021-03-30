import 'package:get_it/get_it.dart';
import 'package:solute_labs/src/constants/styles.dart';
import 'package:solute_labs/src/provider/homeProvider.dart';
import 'package:solute_labs/src/utils/sharedPrefUtils.dart';


GetIt getIt = GetIt.instance;

void setup() {
  // getIt.registerSingleton<Mystyles>(Mystyles()); //common styles
  getIt.registerFactory(() => Mystyles()); //shared preference
  getIt.registerFactory(() => SharedPrefUtils()); //shared preference
  getIt.registerFactory(() => HomeProvider()); //shared preference
  // getIt.registerSingleton<Img>(Img());
}
