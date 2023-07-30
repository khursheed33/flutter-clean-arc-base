import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../di/di_container.dart';
import 'base_model.dart';

/// A generic StatefulWidget that serves as the base for building views with state management support.
///
/// The `BaseView` widget takes a generic type parameter `VM` which must extend `BaseModel`. This `BaseModel` class
/// represents the ViewModel for the view. It holds the app's state and business logic.
///
/// The `BaseView` widget is used to create a reactive view that listens to changes in the ViewModel and rebuilds
/// its UI accordingly. It follows the Clean Architecture and Dependency Injection principles, allowing easy
/// integration of your ViewModel with the view.
///
/// Example:
/// ```dart
/// BaseView<CounterModel>(
///   onModelReady: (model) => model.init(), // Optional, called when the ViewModel is created and ready.
///   onModelDispose: (model) => model.dispose(), // Optional, called when the ViewModel is about to be disposed.
///   builder: (context, model, child) => Text(model.counter.toString()),
/// )
/// ```
class BaseView<VM extends BaseModel> extends StatefulWidget {
  /// Creates a [BaseView] widget.
  ///
  /// The [builder] parameter is a required callback that returns the UI widget to be built using the ViewModel [VM].
  ///
  /// The [onModelReady] parameter is an optional callback that is called when the ViewModel [VM] is created and ready.
  ///
  /// The [onModelDispose] parameter is an optional callback that is called when the ViewModel [VM] is about to be disposed.
  const BaseView({
    Key? key,
    this.onModelReady,
    this.onModelDispose,
    required this.builder,
  }) : super(key: key);

  /// A callback function that is called when the ViewModel [VM] is created and ready.
  final Function(VM)? onModelReady;

  /// A callback function that is called when the ViewModel [VM] is about to be disposed.
  final Function(VM)? onModelDispose;

  /// A callback function that returns the UI widget to be built using the ViewModel [VM].
  ///
  /// The `builder` function should take the following parameters:
  /// - [context]: The build context for the widget.
  /// - [model]: The ViewModel [VM] instance associated with this view.
  /// - [child]: An optional child widget, which can be passed to the `builder` function if needed.
  final Widget Function(
    BuildContext context,
    VM model,
    Widget? child,
  ) builder;

  @override
  State<StatefulWidget> createState() => _BaseViewState<VM>();
}

/// The private state class for [BaseView].
class _BaseViewState<VM extends BaseModel> extends State<BaseView<VM>>
    with TickerProviderStateMixin {
  /// The ViewModel instance associated with this view.
  final VM _model = locator<VM>();

  @override
  void initState() {
    super.initState();

    // If the `onModelReady` callback is provided, call it passing the ViewModel instance.
    if (widget.onModelReady != null) {
      widget.onModelReady!(_model);
    }
  }

  @override
  void dispose() {
    super.dispose();

    // If the `onModelDispose` callback is provided, call it passing the ViewModel instance.
    if (widget.onModelDispose != null) {
      widget.onModelDispose!(_model);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use the ChangeNotifierProvider to expose the ViewModel to the view and its descendants.
    return ChangeNotifierProvider(
      create: (_) => _model,
      child: Consumer<VM>(builder: widget.builder),
    );
  }
}
