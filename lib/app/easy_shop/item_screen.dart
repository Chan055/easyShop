import 'package:easyshop/app/provider/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemsScreen extends StatefulWidget {
  final String listName;
  const ItemsScreen({super.key, required this.listName});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final itemController = TextEditingController();
  final qtyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<ItemsProvider>(context, listen: false)
        .loadItems(widget.listName);
  }

  void showAddItemModal(ItemsProvider provider) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Add Item",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: itemController,
              decoration: const InputDecoration(
                labelText: 'Item name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: qtyController,
              decoration: const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                provider.addItem(itemController.text, qtyController.text);
                itemController.clear();
                qtyController.clear();
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ItemsProvider>(context);
    final items = provider.items;

    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_rounded)),
          ),
          title: Text(widget.listName)),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final item = items[index];
          final bought = item['bought'] ?? false;

          return Card(
            child: ListTile(
              title: Text(
                "${item['name']} (${item['qty']})",
                style: TextStyle(
                  decoration:
                      bought ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
              leading: Icon(
                bought ? Icons.check_box : Icons.check_box_outline_blank,
                color: bought ? Colors.green : null,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => provider.deleteItem(index),
              ),
              onTap: () => provider.toggleBought(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddItemModal(provider),
        child: const Icon(Icons.add),
      ),
    );
  }
}
