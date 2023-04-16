import 'package:flutter/material.dart';
import 'counter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List widgetList = []; // holds the list of widgets
  late TextEditingController fieldCtrl;

  @override
  void initState() {
    super.initState();
    fieldCtrl = TextEditingController();
  }

  @override
  void dispose() {
    fieldCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CounterApp"),
      ),
      body: Container(
          child: widgetList.isEmpty
              ? const Text("Add a new task to count")
              : ListView.builder(
                  itemCount: widgetList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return widgetList[index];
                  },
                )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var name = await openDialog();
          if (name == null || name.isEmpty) return;
          widgetList.add(CounterWidget(task: name));
          setState(() {});
        },
      ),
    );
  }

  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Enter Task"),
            content: TextField(
              controller: fieldCtrl,
            ),
            actions: [
              TextButton(
                child: const Text("Add"),
                onPressed: () {
                  Navigator.of(context).pop(fieldCtrl.text);
                  fieldCtrl.clear();
                },
              ),
            ],
          ));
}
