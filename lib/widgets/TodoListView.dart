import 'package:flutter/cupertino.dart';
import 'package:todo_list/widgets/TodoListItem.dart';

class TodoListView {

  final TodoListItem _todoListItem = TodoListItem();

  Widget todoListViewBuilder(context, snapshot, onDelete, onEdit) {
    return ListView.builder(
      padding: const EdgeInsets.all(2.0),
      itemCount: snapshot.data.length,
      itemBuilder: (context, i) {
        return _todoListItem.todoListItem(snapshot.data[i], onDelete, onEdit);
      },
    );
  }

}