import 'package:flutter/material.dart';

class AppDropdown extends StatefulWidget {
  final List<dynamic> items;
  final Function(dynamic selectedItem)? dropValHandler;
  final Function(int index)? indexHandler;
  final Color? fontColor;
  final double fontSize;
  final double iconSize;
  final Color? backgroundColor;
  final dynamic initialItem;
  final Function? addItemHandler;
  final bool? wantAddOption;

  // final dynamic currentItem;
  const AppDropdown({
    Key? key,
    this.fontColor,
    this.indexHandler,
    this.addItemHandler,
    this.wantAddOption,
    this.backgroundColor,
    this.fontSize = 0.0,
    this.iconSize = 0.0,
    required this.items,
    required this.dropValHandler,
    required this.initialItem,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  bool _isExpanded = false;
  dynamic selectedItem;

  Future<bool> selectOneOption(BuildContext ctx) async {
    setState(() {
      _isExpanded = false;
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          margin: const EdgeInsets.symmetric(vertical: 5),
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
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.initialItem.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: widget.fontSize == 0.0 ? 16 : widget.fontSize,
                  ),
                ),
                const Spacer(),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  size: widget.iconSize == 0.0 ? 30 : widget.iconSize,
                  color: widget.fontColor == Theme.of(context).primaryColor
                      ? Theme.of(context).primaryColorDark
                      : widget.fontColor ?? Theme.of(context).disabledColor,
                ),
              ],
            ),
            onPressed: () async {
              if (widget.items.isEmpty) {
                return;
              }
              setState(() {
                _isExpanded = true;
              });

              await showModalBottomSheet(
                backgroundColor: Theme.of(context).canvasColor,
                isDismissible: false,
                context: context,
                builder: (ctx) {
                  return WillPopScope(
                    onWillPop: () => selectOneOption(ctx),
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: widget.items.length * 60.0 +
                            (widget.wantAddOption == true ? 60.0 : 0.0),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.wantAddOption == true
                            ? widget.items.length + 1
                            : widget.items.length,
                        itemBuilder: (buildContext, index) {
                          if (widget.wantAddOption == true &&
                              index == widget.items.length) {
                            return addItemWidget(
                              context: ctx,
                              index: index,
                              addHandler: widget.addItemHandler!,
                            );
                          }
                          return widget.items[index] == ""
                              ? Container()
                              : MaterialButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        selectedItem =
                                            widget.items[index].toString();
                                        _isExpanded = false;

                                        Navigator.of(ctx).pop();
                                      },
                                    );
                                    widget.dropValHandler!(
                                      selectedItem,
                                    );
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
                                    child: FittedBox(
                                      child: Text(
                                        widget.items[index].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .disabledColor
                                              .withOpacity(0.8),
                                          fontSize: widget.fontSize == 0.0
                                              ? 16
                                              : widget.fontSize,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 1.3,
                                        ),
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
        );
      },
    );
  }

  Widget addItemWidget({
    required BuildContext context,
    required int index,
    required Function addHandler,
  }) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          _isExpanded = false;
        });
        Navigator.pop(context);
        widget.addItemHandler!();
      },
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: index == 15
                ? BorderSide.none
                : BorderSide(
                    color: Theme.of(context).disabledColor.withOpacity(0.1),
                    width: 1,
                  ),
          ),
        ),
        child: FittedBox(
          child: Text(
            "+ Add More",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              fontSize: widget.fontSize == 0.0 ? 16 : widget.fontSize,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
