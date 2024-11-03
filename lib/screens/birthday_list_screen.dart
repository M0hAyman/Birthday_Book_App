import 'package:flutter/material.dart';

class BirthdayListScreen extends StatelessWidget {
  final List favoriteUsers;

  const BirthdayListScreen({super.key, required this.favoriteUsers});

  List<Map<String, dynamic>> getBirthdays() {
    final birthdays = <Map<String, dynamic>>[];
    for (var user in favoriteUsers) {
      //if (user.containsKey('birthDate')) {
      birthdays.add({
        'name': '${user['firstName']} ${user['lastName']}',
        'birthDate': user['birthDate'],
        'age': user['age'],
        'image': user['image'],
      });
      //}
    }

    // Sort birthdays by year, then month, then day in ascending order (earliest date first)
    birthdays.sort((a, b) {
      List<String> dateA =
          a['birthDate'].split('-'); // ['year', 'month', 'day']
      List<String> dateB = b['birthDate'].split('-');

      // Compare year, then month, then day in ascending order
      int yearComparison = int.parse(dateA[0]).compareTo(int.parse(dateB[0]));
      if (yearComparison != 0) return yearComparison;

      int monthComparison = int.parse(dateA[1]).compareTo(int.parse(dateB[1]));
      if (monthComparison != 0) return monthComparison;

      return int.parse(dateA[2]).compareTo(int.parse(dateB[2]));
    });

    return birthdays;
  }

  @override
  Widget build(BuildContext context) {
    final birthdays = getBirthdays();

    return ListView.builder(
      itemCount: birthdays.length,
      itemBuilder: (context, index) {
        var birthday = birthdays[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage(birthday['image']), // Display user's image
          ),
          title: Text(birthday['name']),
          subtitle: Text(
              'Birthdate: ${birthday['birthDate']} (Age: ${birthday['age']})'),
        );
      },
    );
  }
}
