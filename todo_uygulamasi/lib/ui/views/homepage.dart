import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_uygulamasi/data/entity/todos.dart';
import 'package:todo_uygulamasi/ui/cubits/homepage_cubit.dart';
import 'package:todo_uygulamasi/ui/views/detailpage.dart';
import 'package:todo_uygulamasi/ui/views/savepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    context.read<HomepageCubit>().getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (searchResult) {
                  context.read<HomepageCubit>().searchTodo(searchResult);
                },
              )
            : const Text("Yapılacaklar Listesi"),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                    });
                    context.read<HomepageCubit>().getTodos();
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<HomepageCubit, List<Todos>>(
          builder: (context, todosList) {
        if (todosList.isNotEmpty) {
          return ListView.builder(
            itemCount: todosList.length,
            itemBuilder: (context, index) {
              var todo = todosList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(todo: todo)))
                      .then((value) {
                    context.read<HomepageCubit>().getTodos();
                  });
                },
                child: todoCard(id: todo.id, name: todo.name),
              );
            },
          );
        } else {
          return const Center();
        }
      }),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SavePage()))
              .then((value) {
            context.read<HomepageCubit>().getTodos();
          });
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}

class todoCard extends StatelessWidget {
  int id;
  String name;

  todoCard({required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:80,bottom: 20),
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: Container(
            height: 80,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    width: 8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(name, style: const TextStyle(fontSize: 20), maxLines: 1, overflow: TextOverflow.ellipsis)),
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text("Yapılacak iş silinsin mi?"),
                        action: SnackBarAction(
                            label: "Evet",
                            onPressed: () {
                              context.read<HomepageCubit>().deleteTodo(id);
                            }),
                      ));
                    },
                    icon: const Icon( Icons.clear ))
              ],
            )
          ),
        ),
      ),
    );
  }
}
