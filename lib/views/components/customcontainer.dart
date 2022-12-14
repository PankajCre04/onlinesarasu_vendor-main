import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final double? padding;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? paddingEdge;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? shadowColor;
  final double? elevation;

  const CustomContainer({@required this.child,
    this.onTap,
    this.height,
    this.width,
    this.margin,
    this.borderColor,
    this.shadowColor,
    this.padding = 10,
    this.borderRadius = 5,
    this.backgroundColor = Colors.white,
    this.elevation = 2.5,
    this.paddingEdge});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      width: this.width,
      child: Card(
        shape: RoundedRectangleBorder(
          side: this.borderColor != null
              ? BorderSide(color: this.borderColor!)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(this.borderRadius!),
        ),
        color: this.backgroundColor,
        elevation: this.elevation,
        margin: this.margin,
        shadowColor: this.shadowColor ?? Theme
            .of(context)
            .accentColor,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: this.onTap,
          child: Padding(
            padding: this.paddingEdge != null
                ? this.paddingEdge!
                : EdgeInsets.all(this.padding!),
            child: this.child,
          ),
        ),
      ),
    );
  }
}
