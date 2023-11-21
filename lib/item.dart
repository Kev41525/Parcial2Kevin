import 'package:flutter/material.dart';
import 'package:parcial_2/data.dart';

class Item extends StatelessWidget {
  final Data data;
  const Item({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: colors.primary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.name),
                Text(data.email),
              ],
            ),
          ),
          const IconButton(onPressed: null, icon: Icon(Icons.edit)),
          const IconButton(onPressed: null, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
