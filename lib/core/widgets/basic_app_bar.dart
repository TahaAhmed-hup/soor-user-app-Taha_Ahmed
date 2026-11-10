import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const double _defaultHeight = 58;
  final String? titleText;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final bool hideBack;
  final double? height;
  final TextStyle? titleStyle;
  final bool centerTitle;
  final Widget? title;

  const BasicAppBar({
    this.titleText,
    this.hideBack = false,
    this.backgroundColor,
    this.height,
    this.leading,
    this.titleStyle,
    this.actions,
    this.centerTitle = true,
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          backgroundColor ??
          Theme.of(context).appBarTheme.backgroundColor ??
          Colors.transparent,
      elevation: 0,
      actions: actions,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? _defaultHeight,
      titleSpacing: 0,
      title: title ?? (titleText != null
          ? Text(
              titleText!,
              style:
                  titleStyle ??
                  const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            )
          : const SizedBox.shrink()),
      leading:
          leading ??
          (hideBack
              ? null
              : IconButton(
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    if (context.canPop()) context.pop();
                  },
                )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? _defaultHeight);
}
