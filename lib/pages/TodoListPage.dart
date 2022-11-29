import 'package:flutter/material.dart';
import 'package:todo_list/models/Todo.dart';
import 'package:todo_list/widgets/TodoListView.dart';

import '../SqLite/TodoHelper.dart';
import '../widgets/ShowDialog.dart';
import '../widgets/ShowSnackBar.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _todoController = TextEditingController();

  final TodoHelper _todoHelper = TodoHelper();
  final TodoListView _todoListView = TodoListView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tarefas'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _todoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Ex. Estudar poha',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                        onPressed: () {
                          onInsert(_todoController.text);
                          _todoController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.all(16),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        ))
                  ],
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: FutureBuilder<List>(
                      future: _todoHelper.list(),
                      initialData: const [],
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? _todoListView.todoListViewBuilder(context, snapshot, onDelete, showEdit)
                            : _waiting();
                      }),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Voce possui ${_todoHelper.list.toString().length} tarefas pendentes',
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: showDeleteAll,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Text('limpar Tudo'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _waiting() {
    return const Center(
      child: Text("No data..."),
    );
  }

  void onInsert(text) {
    setState(() {_todoHelper.insert(Todo(text, DateTime.now().toString()));});
  }

  void onDelete(Todo todo) {
    setState(() {_todoHelper.delete(todo.id!);});
    showSnackBarDelete(todo);
  }

  void showSnackBarDelete(todo) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ShowSnackBar.showSnackBarReplace(
        context, onInsert, "Tarefa ${todo.title} foi removida com sucesso!");
  }

  void showEdit(Todo todo) {
    ShowDialog().showDialogEdit(context, onEdit, todo, "Editar tarefa.");
  }

  void onEdit(Todo todo) {
    setState(() {_todoHelper.update(todo);});
  }

  void showDeleteAll() {
    ShowDialog.showDialogDelete(context, onDeleteAll, "Limpar Tudo?",
        "Voce tem certeza que deseja apagar todas as tarefas?");
  }

  void onDeleteAll() {
    setState(() {_todoHelper.deleteAll();});
  }
}
