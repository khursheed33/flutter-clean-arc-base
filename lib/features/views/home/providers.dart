import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../di/di_container.dart';
import '../providers/auth_view_model.dart';

class AppProviders {
  static List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider(
      create: (_) => locator<AuthViewModel>(),
    ),
  ];
}
