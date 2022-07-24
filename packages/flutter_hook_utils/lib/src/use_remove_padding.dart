import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useRemovePadding(
  Widget child, {
  bool removeBottom = false,
  bool removeTop = false,
  bool removeLeft = false,
  bool removeRight = false,
}) {
  final context = useContext();

  useEffect(() {
    MediaQuery.removePadding(
      context: context,
      removeBottom: removeBottom,
      removeTop: removeTop,
      removeLeft: removeLeft,
      removeRight: removeRight,
      child: child,
    );
    return null;
  }, [removeBottom, removeTop, removeLeft, removeRight, child]);
}
