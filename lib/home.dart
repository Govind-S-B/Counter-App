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
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Counter App",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: Container(
            child: widgetList.isEmpty
                ? Center(
                    child: Text(
                    "Add a new task to count",
                    style: Theme.of(context).textTheme.bodyText1,
                  ))
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
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white);
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
