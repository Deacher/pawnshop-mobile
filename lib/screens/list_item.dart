import 'package:flutter/material.dart';
import 'package:pawnshop/main.dart';
import 'package:pawnshop/screens/pawnshop_form.dart';
import 'package:pawnshop/widgets/left_drawer.dart';
import 'package:pawnshop/widgets/global.dart' as global;

class ListItemPage extends StatefulWidget {
  const ListItemPage({super.key});

  @override
  State<ListItemPage> createState() => _ListItemState();
}

class _ListItemState extends State<ListItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item data'),
      ),
      drawer: const LeftDrawer(),
      body: Center(
          child: ListView.builder(
            itemCount: global.allItem.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(5.0),
                    shadowColor: const Color.fromARGB(255, 89, 104, 112),
                    child: ListTile(
                      title: Text(global.allItem[index].name),
                      subtitle: Text(global.allItem[index].description),
                      trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Jumlah : ${global.allItem[index].amount}")
                          ]),
                    )),
              );
            }),
          )),
    );
  }
}