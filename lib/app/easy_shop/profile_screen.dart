import 'package:easyshop/app/auth_service.dart';
import 'package:easyshop/app/provider/theme_provider.dart';
import 'package:easyshop/app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = AuthService();
  final displayNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final name = auth.currentUser?.displayName ?? "";
    displayNameController.text = name;
  }

  Future<void> _showConfirmDialog(
      String title, String content, VoidCallback onConfirm) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context, false)),
          ElevatedButton(
              child: const Text("Confirm"),
              onPressed: () => Navigator.pop(context, true)),
        ],
      ),
    );
    if (confirmed == true) onConfirm();
  }

  Widget actionButton(
      {required IconData icon,
      required String label,
      required VoidCallback onPressed,
      Color? color}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final user = auth.currentUser;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.account_circle, size: 80),
            const SizedBox(height: 10),
            Text(
              user?.email ?? "No email",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Username: ${userProvider.displayName.isNotEmpty ? userProvider.displayName : "Guest"}",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text("Dark Mode"),
              value: themeProvider.isDarkMode,
              onChanged: themeProvider.toggleTheme,
            ),
            actionButton(
              icon: Icons.save,
              label: "Update Name",
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Update Display Name",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: displayNameController,
                            decoration: const InputDecoration(
                              labelText: "New Display Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.save),
                            label: const Text("Save"),
                            onPressed: () async {
                              try {
                                final name = displayNameController.text.trim();
                                await auth.updateUsername(name);
                                userProvider.updateName(name);
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Username updated")),
                                );
                              } catch (e) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Error: $e")),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 10),

            const Spacer(),
            actionButton(
              icon: Icons.delete_forever,
              label: "Delete Account",
              color: Colors.red,
              onPressed: () => _showConfirmDialog(
                "Delete Account",
                "Are you sure you want to permanently delete your account?",
                () async {
                  try {
                    await auth.deleteAccount();
                    if (context.mounted)
                      Navigator.pushReplacementNamed(context, '/signup');
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Error: $e")));
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            actionButton(
              icon: Icons.logout,
              label: "Logout",
              color: Colors.grey.shade800,
              onPressed: () => _showConfirmDialog(
                "Logout",
                "Are you sure you want to log out?",
                () async {
                  await auth.signOut();
                  if (context.mounted)
                    Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
