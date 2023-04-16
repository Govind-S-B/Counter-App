import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final String task;

  const CounterWidget({Key? key, required this.task}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Expanded(child: Text(widget.task)),
          ElevatedButton(
            onPressed: () {
              count++;
              setState(() {});
            },
            child: Text("$count"),
          )
        ],
      ),
    );
  }
}
