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
    // TODO: implement initState
    super.initState();
    fieldCtrl = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fieldCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CounterApp"),
      ),
      body: Container(
          child: widgetList.isEmpty
              ? Text("Add a new task to count")
              : ListView.builder(
                  itemCount: widgetList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return widgetList[index];
                  },
                )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
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
            title: Text("Enter Task"),
            content: TextField(
              controller: fieldCtrl,
            ),
            actions: [
              TextButton(
                child: Text("Add"),
                onPressed: () {
                  Navigator.of(context).pop(fieldCtrl.text);
                },
              ),
            ],
          ));
}
