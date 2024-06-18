import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubit/todo_cubit.dart';

// ignore: must_be_immutable
class TextFormFeiLd extends StatelessWidget {
  TextFormFeiLd({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        if (value.isNotEmpty) {
          BlocProvider.of<TodoCubit>(context).addTasks(value);
        }
      },
      style: const TextStyle(fontSize: 18),
      controller: controller,
      cursorColor: const Color.fromARGB(255, 117, 16, 9),
      decoration: const InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 117, 16, 9))),
          focusColor: Color.fromARGB(255, 117, 16, 9),
          fillColor: Color.fromARGB(255, 117, 16, 9),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 117, 16, 9)),
          )),
    );
  }
}

// Done ❤❤