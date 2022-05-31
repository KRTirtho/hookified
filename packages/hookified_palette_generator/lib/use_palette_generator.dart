import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:palette_generator/palette_generator.dart';

PaletteGenerator? usePaletteGenerator(ImageProvider imageProvider) {
  final paletteGenerator = useState<PaletteGenerator?>(null);
  final context = useContext();
  final brightness = Theme.of(context).brightness;

  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final palette = await PaletteGenerator.fromImageProvider(imageProvider);
      paletteGenerator.value = palette;
    });
    return null;
  }, [imageProvider, brightness]);

  return paletteGenerator.value;
}
