import 'package:flutter_clean_arc_base/index.dart';


/// An abstract class that serves as the base for ViewModel classes.
///
/// A ViewModel is responsible for holding the state and business logic for a specific view in your app.
/// It extends [ChangeNotifier] to notify listeners (usually the UI) when the state changes.
/// To create a custom ViewModel, extend this [BaseModel] class and implement its abstract methods.
///
/// Example:
/// ```dart
/// class CounterModel extends BaseModel {
///   int _counter = 0;
///
///   int get counter => _counter;
///
///   void incrementCounter() {
///     _counter++;
///     notifyListeners(); // Notifies listeners (UI) that the state has changed.
///   }
///
///   @override
///   void disposeModel() {
///     // Perform any cleanup or resource release tasks here.
///   }
/// }
/// ```
abstract class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Done;

  /// The current state of the ViewModel.
  ViewState get state => _state;

  /// Sets the ViewModel's state to the provided [viewState] and notifies listeners.
  ///
  /// When the state changes, call this method with the new [viewState] to inform the listeners (usually the UI)
  /// about the state change so that they can update accordingly.
  void setViewState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  /// Abstract method to dispose of the ViewModel.
  ///
  /// Override this method in your custom ViewModel classes to perform any cleanup or resource release tasks
  /// before the ViewModel is disposed of.
  void disposeModel();
}
