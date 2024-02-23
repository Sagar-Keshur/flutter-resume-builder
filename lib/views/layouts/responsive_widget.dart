import 'package:flutter/material.dart';
import 'package:flutter_resume_builder/core/data/constants.dart';
import 'package:flutter_resume_builder/core/extensions/extensions.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ApplyScrollBehaviorOptions(
      child: ResponsiveBreakpoints.builder(
        child: ApplyTextOptions(child: child),
        breakpoints: [
          Breakpoint(start: 0, end: context.width, name: MOBILE),
          Breakpoint(start: 451, end: context.width, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}

class ApplyTextOptions extends StatelessWidget {
  const ApplyTextOptions({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: context.mediaQuery.copyWith(textScaler: defaultTextScaler),
      child: child,
    );
  }
}

class ApplyScrollBehaviorOptions extends StatelessWidget {
  const ApplyScrollBehaviorOptions({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const _ScrollBehaviorModified(),
      child: child,
    );
  }
}

class _ScrollBehaviorModified extends ScrollBehavior {
  const _ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
