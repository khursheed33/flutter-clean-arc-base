import 'package:flutter/material.dart';

import '../../../../core/widgets/app_title.dart';
import '../../../../core/widgets/custom_loader.dart';
import '../../providers/auth_view_model.dart';
import '../../base/base_view_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseView<AuthViewModel>(
        onModelReady: (model) {
          model.startGeneratingData();
        },
        builder: (context, model, _) {
          return Center(
            child: StreamBuilder<String>(
              stream: model.dynamicStreamController.stream,
              builder: (ctx, data) {
                if (data.connectionState == ConnectionState.waiting) {
                  return const AppCircularProgress();
                } else if (data.hasData) {
                  // WidgetsBinding.instance.addPostFrameCallback(
                  //   (_) => Navigator.pushReplacementNamed(
                  //     context,
                  //     AppRoutePaths.dashboardTabController,
                  //   ),
                  // );
                  return AppTitle("${data.data}");
                } else {
                  return Container();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
