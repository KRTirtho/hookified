import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useLayoutEffect(
    FutureOr<FutureOr<void> Function()?> Function() callback, List? deps) {
  useEffect(() {
    FutureOr<void> Function()? cleanup;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      cleanup = await callback();
    });
    return () {
      cleanup?.call();
    };
  }, deps);
}
