import 'package:easyshop/app/easy_shop/item_screen.dart';
import 'package:easyshop/app/provider/shopping_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShoppingListProvider>(context);
    final TextEditingController controller = TextEditingController();

    void showAddListModal() {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("New Shopping List",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'List name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  provider.addList(controller.text.trim());
                  controller.clear();
                  Navigator.pop(context);
                },
                child: const Text("Add"),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: provider.lists.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final name = provider.lists[index];
          return Card(
            child: ListTile(
              title: Text(name),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => provider.deleteList(index),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ItemsScreen(listName: name),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddListModal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
