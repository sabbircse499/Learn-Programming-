import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class Problem extends StatefulWidget {
  const Problem({super.key});

  @override
  State<Problem> createState() => _ProblemState();
}

class _ProblemState extends State<Problem> {
  // Sample list of reasons
  final List<String> reasons = [
    "Find the factorial of a number",
        "Check if two strings are anagrams",
        "Reverse words in a sentence",
        "Convert a decimal number to binary",
        "Find the sum of all elements in an array",
        "Check if a number is a palindrome",
        "Flatten a nested list",
        "Find the maximum depth of a binary tree",
        "Count the frequency of each character in a string",
        "Implement a queue using two stacks",
        "Find the intersection of two arrays",
        "Rotate an array to the right by K steps",
        "Check if a linked list contains a cycle",
        "Remove all occurrences of a given element from a list",
        "Generate all subsets of a set",
        "Merge overlapping intervals in a list",
        "Find the longest common prefix of a list of strings",
        "Check if a string is a valid palindrome with punctuation ignored",
        "Sort a list of strings by their length",
        "Find the first non-repeating character in a string",
        "Convert a Roman numeral to an integer",
        "Calculate the power of a number (without using built-in functions)",
        "Check if two binary trees are identical",
        "Find the median of two sorted arrays",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Problems'),
      ),
      body: ListView.builder(
        itemCount: reasons.length,
        itemBuilder: (context, index) {
          return CustomContainer(reason: reasons[index],ind: index,);
        },
      ),
    );
  }
}


class CustomContainer extends StatelessWidget {
  final String reason;
  final int ind;

  const CustomContainer({super.key, required this.reason, required this.ind});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to ProblemSubmit class with parameters
        Get.to(ProblemSubmit(), arguments: {'reason': reason, 'ind': ind});
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$ind. $reason",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProblemSubmit extends StatefulWidget {
  const ProblemSubmit({super.key});

  @override
  State<ProblemSubmit> createState() => _ProblemSubmitState();
}

class _ProblemSubmitState extends State<ProblemSubmit> {
  // Controllers to capture the user's email and additional message
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Retrieve the passed parameters (reason and ind)
    final arguments = Get.arguments;
    final String reason = arguments['reason'] ?? 'No reason provided';
    final int ind = arguments['ind'] ?? 0;

    // Function to send an email
    Future<void> sendEmail() async {
      final Email email = Email(
        body: 'Reply Email: ${_emailController.text}\n\n\n\nAnswer: ${_messageController.text}',
        subject: 'Problem Submission : $reason',
        recipients: ['sabbir472003@gmail.com'], // Replace with the recipient's email
        isHTML: false,
      );

      try {
        await FlutterEmailSender.send(email);
        Get.snackbar('Success', 'Email sent successfully!',
            snackPosition: SnackPosition.BOTTOM);
      } catch (error) {
        Get.snackbar('Error', 'Failed to send email: $error',
            snackPosition: SnackPosition.BOTTOM);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Problem'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                '$ind. $reason',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              // TextField for user's email address
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Write your Answer : ',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // TextField for additional details
              TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Enter additional details',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              // Button to send the email
              ElevatedButton(
                onPressed: sendEmail,
                child: const Text('Send Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}