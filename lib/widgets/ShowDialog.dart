import 'package:flutter/material.dart';


class ShowDialog {

  final TextEditingController todoController = TextEditingController();

  static Future<void> showDialogDelete(context, deleteAll, title, content) {
    return showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text(title),
          content:
          Text(content),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  deleteAll();
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text("Deletar")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(foregroundColor: Colors.blue),
                child: const Text("Cancelar")),
          ],
        );
      },
    );
  }

  Future<void> showDialogEdit(context, onEdit, todo, title) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(title),
        content:
        TextField(
          controller: todoController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: todo.title,
            hintText: 'Ex: Estudar...',
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                todo.title = todoController.text;
                onEdit(todo);
              },
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              child: const Text("Editar")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text("Cancelar")),
        ],
      );
    },
    );
  }
}