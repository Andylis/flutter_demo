import 'package:flutter/material.dart';

List<String> _defaultMaterials = <String>[
  'poker',
  'tortilla',
  'fish and',
  'micro',
  'wood',
];

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemo createState() => new _ChipDemo();
}

class _ChipDemo extends State<ChipDemo> {
  _ChipDemo() {
    _reset();
  }

  final Set<String> _materials = Set<String>();

  String _capitalize(String name) {
    assert(name != null && name.isNotEmpty);
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: _materials.map<Widget>((String name) {
      return Chip(
        key: ValueKey<String>(name),
        backgroundColor: Colors.red,
        label: Text(_capitalize(name)),
        onDeleted: () {
          setState(() {
            _removeMaterial(name);
          });
        },
      );
    }).toList());
  }

  void _reset() {
    _materials.clear();
    _materials.addAll(_defaultMaterials);
    print(_materials);
  }

  void _removeMaterial(String name) {
    print(_materials);
    _materials.remove(name);
    print(_materials);
  }
}
