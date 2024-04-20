import 'package:flutter_clean_arc_base/index.dart';


/// `GenricDropDown<T>`
/// is a custom Dropdown button that supports `T` type of object in it's dropdown items.
/// Returns a Dropdown items from list of `objects/entities/models`.
class GenricDropDown<T> extends StatefulWidget {
  /// List of [items] i.e Entities/Objects/dynamics/Models
  final List<T> items;

  /// Item that will be shown on the drop-down.
  final T? initialItem;

  /// A function that gives you the currently selected object as [val].
  final void Function(T val) onChanged;

  /// Returns the title extracted from the object, to show on drop-down list.
  final String Function(T title) titleHandler;

  /// Returns the current index of drop-down item.
  final void Function(int index)? indexHandler;

  final Color? backgroundColor;

  final Widget? title;

  const GenricDropDown({
    super.key,
    this.indexHandler,
    required this.items,
    required this.onChanged,
    required this.initialItem,
    required this.titleHandler,
    this.backgroundColor,
    this.title,
  });

  @override
  State<StatefulWidget> createState() {
    return GenricDropDownState<T>();
  }
}

class GenricDropDownState<T> extends State<GenricDropDown<T>> {
  bool _isExpanded = false;

  Future<bool> selectOneOption() async {
    setState(() {
      _isExpanded = false;
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.title != null) widget.title!,
            Container(
              width: constraints.maxWidth,
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 7),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).disabledColor.withOpacity(0.1),
                    offset: const Offset(2, 2),
                    blurRadius: 2,
                  ),
                  BoxShadow(
                    color: Theme.of(context).disabledColor.withOpacity(0.1),
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 2,
                  ),
                ],
                color: widget.backgroundColor ??
                    Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTitle(
                      widget.titleHandler(
                        widget.initialItem == null
                            ? widget.items[0]
                            : widget.initialItem!,
                      ),
                      maxLines: 1,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 30,
                      color: Theme.of(context).disabledColor,
                    ),
                  ],
                ),
                onTap: () async {
                  if (widget.items.isEmpty) {
                    return;
                  }
                  setState(() {
                    _isExpanded = true;
                  });

                  await showModalBottomSheet(
                    backgroundColor: widget.backgroundColor ??
                        Theme.of(context).colorScheme.background,
                    isDismissible: false,
                    context: context,
                    builder: (ctx) {
                      return WillPopScope(
                        onWillPop: () => selectOneOption(),
                        child: Container(
                          constraints: BoxConstraints(
                            maxHeight: widget.items.length * 60.0,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.items.length,
                            itemBuilder: (buildContext, index) {
                              return widget.items[index] == ""
                                  ? Container()
                                  : MaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          _isExpanded = false;

                                          Navigator.of(ctx).pop();
                                        });
                                        widget.onChanged(widget.items[index]);
                                        if (widget.indexHandler != null) {
                                          widget.indexHandler!(index);
                                        }
                                      },
                                      child: Container(
                                        height: 60,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: index == 15
                                                ? BorderSide.none
                                                : BorderSide(
                                                    color: Theme.of(context)
                                                        .disabledColor
                                                        .withOpacity(0.1),
                                                    width: 1,
                                                  ),
                                          ),
                                        ),
                                        child: Text(
                                          widget.titleHandler(
                                            widget.items[index],
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .disabledColor
                                                .withOpacity(0.8),
                                            fontSize: 16,
                                            letterSpacing: 1.3,
                                          ),
                                        ),
                                      ),
                                    );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
