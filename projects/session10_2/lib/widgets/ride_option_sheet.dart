import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gojek_clone/providers/ride_provider.dart';

class RideOptionSheet extends StatelessWidget {
  final ScrollController controller;
  RideOptionSheet({required this.controller});

  @override
  Widget build(BuildContext c) {
    final prov = c.watch<RideProvider>();
    if (prov.options.isEmpty) prov.loadOptions();
    return ListView.builder(
      controller: controller,
      itemCount: prov.options.length,
      itemBuilder: (_, i) {
        final opt = prov.options[i];
        final sel = prov.selected == opt;
        return ListTile(
          leading: Image.asset(opt.iconPath, width: 32),
          title: Text(opt.title),
          subtitle: Text('\$${opt.price.toStringAsFixed(1)}'),
          tileColor: sel ? Colors.green.shade100 : null,
          onTap: () => prov.selectOption(opt),
        );
      },
    );
  }
}
