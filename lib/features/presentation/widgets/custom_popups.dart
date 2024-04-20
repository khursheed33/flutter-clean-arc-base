import 'package:flutter_clean_arc_base/index.dart';

class CustomPopup {
  static Future<bool?> common(
    BuildContext context, {
    required String title,
    required String? subtitle,
    String? confirmBtnTitle,
    IconData? icon,
    bool? isError,
    bool canPop = false,
    bool? needCancel,
  }) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: PopScope(
            canPop: canPop,
            onPopInvoked: (didPop) {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (needCancel != true) const SizedBox(height: 20),
                  if (needCancel == true)
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: isError == true
                              ? Theme.of(context)
                                  .colorScheme
                                  .error
                                  .withOpacity(0.4)
                              : Theme.of(context).disabledColor,
                        ),
                        onPressed: () {
                          return Navigator.of(ctx).pop(false);
                        },
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      icon ?? FontAwesomeIcons.triangleExclamation,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 15),
                  AppTitle(
                    title,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                    color: isError == true
                        ? Theme.of(context).colorScheme.error
                        : null,
                  ),
                  const SizedBox(height: 10),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: AppTitle(
                        subtitle,
                        fontSize: 12,
                        textAlign: TextAlign.center,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (isError != true && needCancel != false)
                        TextButton(
                          onPressed: () {
                            return Navigator.of(ctx).pop(false);
                          },
                          child: AppTitle(
                            AppText.maybeLater,
                            fontSize: 14,
                            color: isError == true
                                ? Theme.of(context).colorScheme.error
                                : Theme.of(context).primaryColor,
                          ),
                        ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            isError == true
                                ? Theme.of(context).colorScheme.error
                                : Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {
                          return Navigator.of(ctx).pop(true);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: confirmBtnTitle != null &&
                                    confirmBtnTitle.length > 6
                                ? 10
                                : 30,
                          ),
                          child: AppTitle(
                            confirmBtnTitle ?? AppText.okay,
                            fontSize: 14,
                            color: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> progress(BuildContext context, {String? title}) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null) ...[
                AppTitle(title),
                const Divider(),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    SizedBox(width: 15),
                    AppTitle(
                      AppText.pleaseWait,
                      fontSize: 16,
                    )
                  ],
                )
              ],
              if (title == null) ...const [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator.adaptive(),
                ),
                SizedBox(height: 15),
                AppTitle(
                  AppText.pleaseWait,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              ]
            ],
          ),
        );
      },
    );
  }

  static Future<bool> exitApp(BuildContext context) async {
    final response = await CustomPopup.common(
      context,
      icon: Icons.exit_to_app_rounded,
      title: "Do you want to exit?",
      confirmBtnTitle: "Exit",
      subtitle: null,
    );
    if (response == null) return false;
    return response;
  }
}
