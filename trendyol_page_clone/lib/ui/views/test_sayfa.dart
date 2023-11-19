import 'dart:math';

import 'package:flutter/material.dart';

class TestSayfa extends StatefulWidget {
  const TestSayfa({super.key});

  @override
  State<TestSayfa> createState() => _TestSayfaState();
}

class _TestSayfaState extends State<TestSayfa> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter test",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 5,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey.shade500,
        child: ListView(
          children: [
            HorizontalList(),
            VerticalList(),
          ],
        ),
      ),
    );
  }
}

class ListHeader extends StatelessWidget {
  final String title;
  const ListHeader(String title) : title = title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18),
    );
  }
}

class ScrollUp extends StatelessWidget {
  const ScrollUp({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        height: 50,
        child: const Center(
          child: Text(
            "Click to scroll up",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) => Container(
            margin:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: 30,
            height: 20,
            color: Colors.red,
            child: const Text("a"),
          )),
    );
  }
}

class VerticalList extends StatelessWidget {
  const VerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, int) {
        return Container(
          margin: const EdgeInsets.all(10),
          height: 50,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        );
      },
      itemCount: 28,
    );
  }
}
