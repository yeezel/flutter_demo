如果你想在 showDialog 中改变状态并刷新组件，可以使用 StatefulBuilder 或者自定义 StatefulWidget
```flutter
showDialog(
  context: context,
  builder: (BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          title: Text('Update State in Dialog'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('This is a dialog with state.'),
              // Add your stateful widgets here
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Update state using setState
                setState(() {
                  // Your state update logic here
                });
              },
              child: Text('Update State'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  },
);
```