import 'package:flutter/material.dart';

class viet extends StatelessWidget {
  const viet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: "huong");
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> init = ['viet', 'vu'];
  final List<String> choose = [];

  @override
  void initState() {
    super.initState();
  }

  void removeButton(int index) {
    setState(() {
      choose.add(init[index]); // Thêm phần tử đã chọn vào danh sách 'choose'
      init.removeAt(index); // Xóa phần tử đã chọn khỏi danh sách 'init'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: init.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: ElevatedButton(
                    onPressed: (){
                      removeButton(index);
                    },
                    child: Text(init[index]),
                  ),
                );
              })),
    );
  }
}
