import 'package:flutter/services.dart';
import 'package:flutter_hook_utils/flutter_hook_utils.dart';

dynamic useThemeModeValue<L, D>(L light, D dark) {
  final brightness = useTheme().brightness;

  if (brightness == Brightness.dark) return dark;
  return light;
}
