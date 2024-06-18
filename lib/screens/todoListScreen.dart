import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubit/todo_cubit.dart';
import 'package:todo_list_app/widgets/formFied.dart';
import 'package:todo_list_app/widgets/text.dart';

class TODOLIST extends StatelessWidget {
  const TODOLIST({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 235, 234, 234),
                    Color.fromARGB(255, 117, 16, 9)
                  ],
                ),
              ),
            ),
            centerTitle: true,
            title: const Text(
              'TODO LIST',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 235, 234, 234),
                  Color.fromARGB(255, 117, 16, 9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: 'Add new task'),
                    TextFormFeiLd(),
                    const SizedBox(
                      height: 50,
                    ),
                    TextWidget(text: 'Tasks:'),
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            BlocProvider.of<TodoCubit>(context).tasks.length,
                        itemBuilder: ((context, index) => ListTile(
                              title: Text(
                                '${BlocProvider.of<TodoCubit>(context)
                                    .tasks[index]}',
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  BlocProvider.of<TodoCubit>(context)
                                      .taskCompletion(index);
                                },
                                icon: const Icon(Icons.check),
                              ),
                              onLongPress: () =>
                                  BlocProvider.of<TodoCubit>(context)
                                      .deleteTasks(index),
                            )),
                      ),
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
