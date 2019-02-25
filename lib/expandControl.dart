// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// import '../../gallery/demo.dart';

@visibleForTesting
enum Location {
  Barbados,
  Bahamas,
  Bermuda
}

typedef DemoItemBodyBuilder<T> = Widget Function(DemoItem<T> item);
typedef ValueToString<T> = String Function(T value);

class DualHeaderWithHint extends StatelessWidget {
  const DualHeaderWithHint({
    this.name,
    this.value,
    this.hint,
    this.showHint
  });

  final String name;
  final String value;
  final String hint;
  final bool showHint;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.only(left: 15.0),
            child: Text(bool.fromEnvironment(hint) ? hint : value, style: textTheme.caption.copyWith(fontSize: 15.0))
          )
        )
      ]
    );
  }
}

class DemoItem<T> {
  DemoItem({
    this.name,
    this.value,
    this.hint,
    this.builder,
    this.valueToString
  }) : textController = TextEditingController(text: valueToString(value));

  final String name;
  final String hint;
  final TextEditingController textController;
  final DemoItemBodyBuilder<T> builder;
  final ValueToString<T> valueToString;
  T value;
  bool isExpanded = false;

  ExpansionPanelHeaderBuilder get headerBuilder {
    return (BuildContext context, bool isExpanded) {
      return DualHeaderWithHint(
        name: name,
        value: valueToString(value),
        hint: hint,
        showHint: isExpanded
      );
    };
  }

  Widget build() => builder(this);
}

class ExpansionPanelsDemo extends StatefulWidget {
  @override
  _ExpansionPanelsDemoState createState() => _ExpansionPanelsDemoState();
}

class _ExpansionPanelsDemoState extends State<ExpansionPanelsDemo> {
  List<DemoItem<dynamic>> _demoItems;

  @override
  void initState() {
    super.initState();

    _demoItems = <DemoItem<dynamic>>[
      DemoItem<Location>(
        name: 'Location',
        value: Location.Bahamas,
        hint: 'Select location',
        valueToString: (Location location) => location.toString().split('.')[1],
        builder: (DemoItem<Location> item) {
          void close() {
            setState(() {
              item.isExpanded = false;
            });
          }
          return Form(
            child: Builder(
              builder: (BuildContext context) {
                return 
                  FormField<Location>(
                    initialValue: item.value,
                    onSaved: (Location result) { item.value = result; },
                    builder: (FormFieldState<Location> field) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            subtitle: Text('data'),
                            title: const Text('Bahamas'),
                            onTap: () {
                              setState(() {
                                field.didChange(Location.Bahamas);
                                Form.of(context).save(); close();
                              });
                            },
                          ),
                          RadioListTile<Location>(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: Location.Bahamas,
                            title: const Text('Bahamas'),
                            // isThreeLine: true,
                            groupValue: field.value,
                            onChanged: (Location newVal) {
                              setState(() {
                                field.didChange(newVal);
                                Form.of(context).save(); close();
                              });
                            },
                          ),
                          RadioListTile<Location>(
                            value: Location.Barbados,
                            title: const Text('Barbados'),
                            groupValue: field.value,
                            onChanged: (Location newVal) {
                              setState(() {
                                field.didChange(newVal);
                                Form.of(context).save(); close();
                              });
                            },
                          ),
                          RadioListTile<Location>(
                            value: Location.Bermuda,
                            title: const Text('Bermuda'),
                            groupValue: field.value,
                            onChanged: (Location newVal) {
                              setState(() {
                                field.didChange(newVal);
                                Form.of(context).save(); close();
                              });
                            },
                          ),
                        ]
                      );
                    }
                  );
              }
            )
          );
        }
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            width: 200,
            margin: const EdgeInsets.all(5.0),
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _demoItems[index].isExpanded = !isExpanded;
                });
              },
              children: _demoItems.map<ExpansionPanel>((DemoItem<dynamic> item) {
                return ExpansionPanel(
                  isExpanded: item.isExpanded,
                  headerBuilder: item.headerBuilder,
                  body: item.build()
                );
              }).toList()
            ),
          ),
        ),
      ),
    );
  }
}
