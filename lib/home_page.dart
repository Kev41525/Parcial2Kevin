import 'package:parcial_2/data.dart';
import 'package:parcial_2/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:parcial_2/item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = context.watch<DataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evaluacion'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: dataProvider.dataList.length,
                  itemBuilder: (context, index) {
                    final Data data = dataProvider.dataList[index];
                    return Item(data: data);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTask(context, dataProvider);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTask(BuildContext context, DataProvider dataProvider) {
    showDialog(
        context: context,
        builder: (context) {
          String title = "";
          String description = "";
          return AlertDialog(
            title: const Text('Nuevo Contacto'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    title = value;
                  },
                  decoration: const InputDecoration(labelText: "Titulo"),
                ),
                TextField(
                  onChanged: (value) {
                    description = value;
                  },
                  decoration: const InputDecoration(labelText: "Recordatorio"),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancelar')),
              TextButton(
                  onPressed: () {
                    dataProvider.add(Data(name: title, email: description));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Agregar')),
            ],
          );
        });
  }
}
