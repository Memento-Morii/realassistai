import 'package:flutter/material.dart';

enum CustomListTileType {
  defaultListTile,
  listTileWithDivider,
  listTileWithChildDivider,
  listTileWithChildWithOutDivider,
}

///CustomListTile Class
class CustomListTile extends StatelessWidget {
  ///CustomListTile
  const CustomListTile({
    Key? key,
    this.leadingWidget,
    this.titleWidget,
    this.subtitle,
    this.trailingWidget,
    this.padding = const EdgeInsets.all(4),
    this.childPadding = const EdgeInsets.all(0),
    this.horizontalGap,
    this.minLeadingWidth,
    this.onPressed,
    this.useDense = true,
    this.customListTileType = CustomListTileType.defaultListTile,
    this.child = const SizedBox(),
    this.childBackgroundColor = Colors.transparent,
    this.isThreeLine = false,
  }) : super(key: key);

  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry childPadding;
  final Widget? titleWidget;
  final Widget? subtitle;
  final double? horizontalGap;
  final double? minLeadingWidth;
  final Function()? onPressed;
  final bool useDense;
  final CustomListTileType customListTileType;
  final Widget child;
  final Color? childBackgroundColor;
  final bool isThreeLine;
  @override
  Widget build(BuildContext context) {
    Widget child = _buildWithOutDivider();
    switch (customListTileType) {
      case CustomListTileType.defaultListTile:
        child = _buildWithOutDivider();
        break;
      case CustomListTileType.listTileWithDivider:
        child = _buildWithDivider();
        break;
      case CustomListTileType.listTileWithChildDivider:
        child = _buildWithChildDivider();
        break;
      case CustomListTileType.listTileWithChildWithOutDivider:
        child = _buildWithChildWithOutDivider();
        break;
      default:
        child = _buildWithOutDivider();
    }
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: childBackgroundColor,
      ),
      child: Padding(
        padding: childPadding,
        child: child,
      ),
    );
  }

  _buildWithDivider() {
    return Column(
      children: [
        _buildListTile(),
        const Divider(color: Colors.grey),
      ],
    );
  }

  ListTile _buildListTile() {
    return ListTile(
      isThreeLine: isThreeLine,
      dense: useDense,
      onTap: onPressed,
      contentPadding: padding,
      leading: leadingWidget,
      title: titleWidget,
      subtitle: subtitle,
      trailing: trailingWidget,
      horizontalTitleGap: horizontalGap,
      minLeadingWidth: minLeadingWidth,
      minVerticalPadding: 0.0,
    );
  }

  _buildWithChildDivider() {
    return Column(
      children: [
        _buildListTile(),
        SizedBox(
          height: 5,
        ),
        child,
        const Divider(),
      ],
    );
  }

  _buildWithChildWithOutDivider() {
    return Column(
      children: [
        _buildListTile(),
        SizedBox(
          height: 10,
        ),
        child,
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  _buildWithOutDivider() {
    return _buildListTile();
  }
}
