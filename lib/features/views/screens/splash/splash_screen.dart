import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_arc_base/core/extensions/message_log.dart';
import 'package:flutter_clean_arc_base/core/widgets/custom_loader.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 1 == 1
            ? const CircularProgressIndicator.adaptive()
            : StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (ctx, data) {
                  if (data.connectionState == ConnectionState.waiting) {
                    return const AppCircularProgress();
                  } else if (data.hasData) {
                    "USER:: $data".log();
                    // WidgetsBinding.instance.addPostFrameCallback(
                    //   (_) => Navigator.pushReplacementNamed(
                    //     context,
                    //     AppRoutePaths.dashboardTabController,
                    //   ),
                    // );
                    return const CircularProgressIndicator.adaptive();
                  } else {
                    "USER:: $data".log();
                    return Container();
                  }
                }),
      ),
    );
  }
}
