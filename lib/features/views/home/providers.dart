import 'package:flutter_clean_arc_base/features/di/di_container.dart';
import 'package:flutter_clean_arc_base/features/views/providers/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider(
      create: (_) => locator<AuthViewModel>(),
    ),
  ];
}
