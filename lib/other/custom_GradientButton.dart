import 'package:flutter/material.dart';

//组合现有组件
class CustomGradientButtonWidget extends StatelessWidget {
  const CustomGradientButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("test")),
        body: const Center(
          child: GradientButtonRoute(),
        ),
      ),
    );
  }
}

class GradientButtonRoute extends StatefulWidget {
  const GradientButtonRoute({Key? key}) : super(key: key);

  @override
  State<GradientButtonRoute> createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    var study = [
      //学习版
      GradientButtonStudy(
        colors: const [Colors.orange, Colors.red],
        height: 50.0,
        onPressed: onTap,
        child: const Text("Submit"),
      ),
      GradientButtonStudy(
        height: 50.0,
        colors: [Colors.lightGreen, Colors.green.shade700],
        onPressed: onTap,
        child: const Text("Submit"),
      ),
      GradientButtonStudy(
        height: 50.0,
        //borderRadius: const BorderRadius.all(Radius.circular(5)),
        colors: [Colors.lightBlue.shade300, Colors.blueAccent],
        onPressed: onTap,
        child: const Text("Submit"),
      ),
    ];
    var all = [
      GradientButton(
        colors: const [Colors.orange, Colors.red],
        onPressed: onTap,
        child: const Text("Submit"),
      ),
      ElevatedGradientButton(
        colors: const [Colors.orange, Colors.red],
        onPressed: onTap,
        child: const Text("Submit"),
      ),
      GradientButton(
        onPressed: onTap,
        borderRadius: BorderRadius.circular(30),
        child: const Text("Submit"),
      ),
      ElevatedGradientButton(
        onPressed: onTap,
        borderRadius: BorderRadius.circular(30),
        child: const Text("Submit"),
      ),
      SizedBox(
        width: double.infinity,
        height: 48,
        child:  GradientButton(
          colors: [Colors.lightGreen, Colors.green.shade700],
          onPressed: onTap,
          child: const Text("Submit"),
        ),
      ),
      SizedBox(
        width: double.infinity,
        height: 48,
        child:  ElevatedGradientButton(
          colors: [Colors.lightGreen, Colors.green.shade700],
          onPressed: onTap,
          child: const Text("Submit"),
        ),
      ),
      const ElevatedGradientButton(
        child: Text("Submit"),
        //onPressed: onTap,
      ),
    ].map((e) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: e,
      );
    }).toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: all,
    );
  }
  onTap() {
    debugPrint("button click");
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    this.colors,
    required this.onPressed,
    required this.child,
    this.padding,
    this.borderRadius = const BorderRadius.all(Radius.circular(2)),
    this.textColor,
    this.splashColor,
    this.disabledColor,
    this.disabledTextColor,
    this.onHighlightChanged,
  }) : super(key: key);

  // 渐变色数组
  final List<Color>? colors;
  final Color? textColor;
  final Color? splashColor;
  final Color? disabledTextColor;
  final Color? disabledColor;
  final EdgeInsetsGeometry? padding;

  final Widget child;
  final BorderRadius? borderRadius;

  final GestureTapCallback? onPressed;
  final ValueChanged<bool>? onHighlightChanged;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    //确保colors数组不空
    List<Color> _colors =
        colors ?? [theme.primaryColor, theme.primaryColorDark];
    final radius = borderRadius;
    bool disabled = onPressed == null;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: disabled ? null : LinearGradient(colors: _colors),
        color: disabled ? disabledColor ?? theme.disabledColor : null,
        borderRadius: radius,
      ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: radius,
        clipBehavior: Clip.hardEdge,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
          child: InkWell(
            splashColor: splashColor ?? _colors.last,
            highlightColor: Colors.transparent,
            onHighlightChanged: onHighlightChanged,
            onTap: onPressed,
            child: Padding(
              padding: padding ?? theme.buttonTheme.padding,
              child: DefaultTextStyle(
                style: const TextStyle(fontWeight: FontWeight.bold),
                child: Center(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: DefaultTextStyle(
                    style: theme.textTheme.button!.copyWith(
                      color: disabled
                          ? disabledTextColor ?? Colors.black38
                          : textColor ?? Colors.white,
                    ),
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ElevatedGradientButton extends StatefulWidget {
  const ElevatedGradientButton({
    Key? key,
    this.colors,
    this.onPressed,
    this.padding,
    this.borderRadius = const BorderRadius.all(Radius.circular(2)),
    this.textColor,
    this.splashColor,
    this.disabledColor,
    this.disabledTextColor,
    this.onHighlightChanged,
    this.shadowColor,
    required this.child,
  }) : super(key: key);

  // 渐变色数组
  final List<Color>? colors;
  final Color? textColor;
  final Color? splashColor;
  final Color? disabledTextColor;
  final Color? disabledColor;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;

  final Widget child;
  final BorderRadius? borderRadius;

  final GestureTapCallback? onPressed;
  final ValueChanged<bool>? onHighlightChanged;

  @override
  State<ElevatedGradientButton> createState() => _ElevatedGradientButtonState();
}

class _ElevatedGradientButtonState extends State<ElevatedGradientButton> {
  bool _tapDown = false;

  @override
  Widget build(BuildContext context) {
    bool disabled = widget.onPressed == null;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        boxShadow: disabled
            ? null
            : [
          _tapDown
              ? BoxShadow(
            offset: const Offset(2, 6),
            spreadRadius: -2,
            blurRadius: 9,
            color: widget.shadowColor ?? Colors.black54,
          )
              : BoxShadow(
            offset: const Offset(0, 2),
            spreadRadius: -2,
            blurRadius: 3,
            color: widget.shadowColor ?? Colors.black87,
          )
        ],
      ),
      child: GradientButton(
        colors: widget.colors,
        onPressed: widget.onPressed,
        padding: widget.padding,
        borderRadius: widget.borderRadius,
        textColor: widget.textColor,
        splashColor: widget.splashColor,
        disabledColor: widget.disabledColor,
        disabledTextColor: widget.disabledTextColor,
        child: widget.child,
        onHighlightChanged: (v) {
          setState(() {
            _tapDown = v;
          });
          if (widget.onHighlightChanged != null) {
            widget.onHighlightChanged!(v);
          }
        },
      ),
    );
  }
}

class GradientButtonStudy extends StatelessWidget {
  const GradientButtonStudy({Key? key,
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    required this.child,
  }) : super(key: key);

  // 渐变色数组
  final List<Color>? colors;

  // 按钮宽高
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  //点击回调
  final GestureTapCallback? onPressed;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors =
        colors ?? [theme.primaryColor, theme.primaryColorDark];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
        //border: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
