import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListItem {


  Widget todoListItem(todo, onDelete, onEdit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              onPressed: (context) {
                onDelete(todo);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.grey[200],
              icon: Icons.delete,
              label: 'Deletar',
            ),
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              onPressed: (context) {
                onEdit(todo);
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.grey[200],
              icon: Icons.edit,
              label: 'Editar',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                todo.dateTime!,
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                todo.title!,
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }



}
