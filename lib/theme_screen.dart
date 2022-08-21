import 'package:custom_multi_theme/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeScreen extends ConsumerStatefulWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends ConsumerState<ThemeScreen> {
  late ThemeNotifier _themeNotifier;

  @override
  void initState() {
    super.initState();
    _themeNotifier = ref.read(themeProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Theme")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Background"),
            trailing: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => SimpleDialog(
                    title: const Text("Pick a color!"),
                    children: [
                      ColorPicker(
                        pickerColor: Theme.of(context).backgroundColor,
                        onColorChanged: (color) =>
                            _themeNotifier.updateBackgroundColor(color),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                  height: 20,
                  width: 20,
                  color: Theme.of(context).backgroundColor),
            ),
          ),
          ListTile(
            title: const Text("Primary Color"),
            trailing: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => SimpleDialog(
                    title: const Text("Pick a color!"),
                    children: [
                      ColorPicker(
                        pickerColor: Theme.of(context).primaryColor,
                        onColorChanged: (color) =>
                            _themeNotifier.updatePrimaryColor(color),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                  height: 20, width: 20, color: Theme.of(context).primaryColor),
            ),
          ),
          ListTile(
            title: const Text("Secondary Header Color"),
            trailing: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => SimpleDialog(
                    title: const Text("Pick a color!"),
                    children: [
                      ColorPicker(
                        pickerColor: Theme.of(context).secondaryHeaderColor,
                        onColorChanged: (color) =>
                            _themeNotifier.updateSecondaryHeaderColor(color),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                  height: 20,
                  width: 20,
                  color: Theme.of(context).secondaryHeaderColor),
            ),
          ),
        ],
      ),
    );
  }

  void showColorPicker(Color pickerColor, Function(Color) onColorChanged) {
    showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        title: const Text("Pick a color!"),
        children: [
          ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: onColorChanged,
          ),
        ],
      ),
    );
  }
}
