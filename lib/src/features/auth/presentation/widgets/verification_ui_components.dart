import 'package:flutter/material.dart';

class VerificationPageScaffold extends StatelessWidget {
  const VerificationPageScaffold({
    required this.child,
    required this.gradientCenter,
    required this.gradientRadius,
    required this.gradientColors,
    this.gradientStops = const [0.0, 0.62, 1.0],
    this.maxWidth = 390,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.scrollable = false,
    super.key,
  });

  final Widget child;
  final Alignment gradientCenter;
  final double gradientRadius;
  final List<Color> gradientColors;
  final List<double> gradientStops;
  final double maxWidth;
  final EdgeInsetsGeometry padding;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: gradientCenter,
            radius: gradientRadius,
            colors: gradientColors,
            stops: gradientStops,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Padding(
                padding: padding,
                child: scrollable ? SingleChildScrollView(child: child) : child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FrostedCircleIconButton extends StatelessWidget {
  const FrostedCircleIconButton({
    required this.icon,
    required this.onTap,
    this.buttonKey,
    super.key,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Key? buttonKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: buttonKey,
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xCC111820),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon, color: const Color(0xFFE7ECF3), size: 22),
      ),
    );
  }
}

class BottomGrabHandle extends StatelessWidget {
  const BottomGrabHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 4,
      decoration: BoxDecoration(
        color: const Color(0x334B6990),
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

class ScanFrameCorner extends StatelessWidget {
  const ScanFrameCorner({
    required this.alignment,
    required this.size,
    this.borderWidth = 3,
    this.color = const Color(0xFF00E5FF),
    this.cornerRadius = 0,
    this.glow = false,
    super.key,
  });

  final Alignment alignment;
  final double size;
  final double borderWidth;
  final Color color;
  final double cornerRadius;
  final bool glow;

  @override
  Widget build(BuildContext context) {
    final top =
        alignment == Alignment.topLeft || alignment == Alignment.topRight;
    final left =
        alignment == Alignment.topLeft || alignment == Alignment.bottomLeft;

    return Align(
      alignment: alignment,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border(
            top: top
                ? BorderSide(color: color, width: borderWidth)
                : BorderSide.none,
            left: left
                ? BorderSide(color: color, width: borderWidth)
                : BorderSide.none,
            right: !left
                ? BorderSide(color: color, width: borderWidth)
                : BorderSide.none,
            bottom: !top
                ? BorderSide(color: color, width: borderWidth)
                : BorderSide.none,
          ),
          boxShadow: glow
              ? const [
                  BoxShadow(
                    color: Color(0x8000E5FF),
                    blurRadius: 12,
                    spreadRadius: -4,
                  ),
                ]
              : null,
          borderRadius: BorderRadius.only(
            topLeft: top && left ? Radius.circular(cornerRadius) : Radius.zero,
            topRight: top && !left
                ? Radius.circular(cornerRadius)
                : Radius.zero,
            bottomLeft: !top && left
                ? Radius.circular(cornerRadius)
                : Radius.zero,
            bottomRight: !top && !left
                ? Radius.circular(cornerRadius)
                : Radius.zero,
          ),
        ),
      ),
    );
  }
}
