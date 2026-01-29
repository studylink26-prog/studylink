import 'package:flutter/material.dart';
import 'package:studylink/screens/Chat.dart';
import '../widgets/AppButton.dart';
import '../models/HelpRequest.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<HelpRequest> mockRequests = const [
    HelpRequest(studentName: 'Alice', subject: 'Math', question: 'Integrals!'),
    HelpRequest(studentName: 'Bob', subject: 'Physics', question: 'Kinematics'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StudyLink')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Incoming Requests', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: mockRequests.length,
                itemBuilder: (context, index) {
                  final request = mockRequests[index];
                  return Card(
                    child: ListTile(
                      title: Text('${request.studentName} needs help with ${request.subject}'),
                      subtitle: Text(request.question),
                      trailing: AppButton(
                        text: 'Accept',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatScreen(request: request)),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
