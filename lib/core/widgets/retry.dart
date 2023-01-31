import 'package:flutter/material.dart';
import '../errors/error_message.dart';
import 'app_title.dart';

class AppRetryOnNoInternet extends StatelessWidget {
  final Function()? onRetry;
  const AppRetryOnNoInternet({
    Key? key,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppTitle(
          ErrorMessage.noInternetConnection,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
        if (onRetry != null)
          TextButton.icon(
            onPressed: onRetry,
            icon: Icon(
              Icons.refresh,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(
              ErrorMessage.tryAgain,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
      ],
    );
  }
}
