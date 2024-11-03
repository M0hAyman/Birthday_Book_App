import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserListScreen extends StatefulWidget {
  final Function(List) updateFavorites;
  final List favoriteUsers;

  const UserListScreen({
    super.key,
    required this.updateFavorites,
    required this.favoriteUsers,
  });

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List users = [];
  bool isLoading = true; // Add loading state

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse('https://dummyjson.com/users'));
    if (response.statusCode == 200) {
      setState(() {
        users = json.decode(response.body)['users'];
        isLoading = false; // Update loading state
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // Optionally handle error here
    }
  }

  void addToFavorites(user) {
    setState(() {
      if (!widget.favoriteUsers.contains(user)) {
        widget.favoriteUsers.add(user);
      } else {
        widget.favoriteUsers.remove(user);
      }
      widget.updateFavorites(widget.favoriteUsers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(), // Display loading indicator
          )
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(user['image']), // Display user image
                ),
                title: Text(user['firstName']),
                subtitle: Text(user['phone']),
                trailing: IconButton(
                  icon: Icon(
                    widget.favoriteUsers.contains(user)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  onPressed: () => addToFavorites(user),
                ),
              );
            },
          );
  }
}
