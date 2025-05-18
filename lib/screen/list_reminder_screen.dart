import 'package:flutter/material.dart';
import 'package:reminder/model/reminder.dart';
import 'add_reminder_screen.dart';
import 'package:intl/intl.dart';

List<Reminder> reminders = [
  Reminder(name: 'Buy Groceries', dateTime: DateTime.now().add(const Duration(hours: 1))),
  Reminder(name: 'Call Mom', dateTime: DateTime.now().add(const Duration(days: 1))),
  Reminder(name: 'Project Deadline', dateTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 17, 0)), // Example time
];

class ListReminderScreen extends StatefulWidget {
  const ListReminderScreen({super.key});

  @override
  _ListReminderScreenState createState() => _ListReminderScreenState();
}

class _ListReminderScreenState extends State<ListReminderScreen> {
  String _formatDateTime(DateTime dateTime) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    return dateFormat.format(dateTime);
  }

  void _navigateToAddReminder() async {
    final newReminder = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddReminderScreen()),
    );

    if (newReminder != null && newReminder is Reminder) {
      setState(() {
        reminders.add(newReminder);
        reminders.sort((a, b) => a.dateTime.compareTo(b.dateTime));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
      ),
      body: reminders.isEmpty
          ? const Center(child: Text('No reminders yet!'))
          : ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          final reminder = reminders[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(reminder.name),
              subtitle: Text(_formatDateTime(reminder.dateTime)),
              onTap: () {
                print('Tapped on reminder: ${reminder.name}');
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddReminder,
        tooltip: 'Add Reminder',
        child: const Icon(Icons.add),
      ),
    );
  }
}