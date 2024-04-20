import 'package:flutter_clean_arc_base/core/constants/app_colors.dart';
import 'package:flutter_clean_arc_base/index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.accentColor,
        child: const AppCircularProgress(),
      ),
    );
  }
}
