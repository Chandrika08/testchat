import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 4, 58, 103),
                Color.fromARGB(255, 68, 183, 255),
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeading('1. Acceptance of Terms'),
              _buildParagraph(
                'By using the University Chat App, you agree to comply with and be bound by these Terms and Conditions. If you do not agree with any part of these terms, you may not use our app.',
              ),
              _buildHeading('2. User Eligibility'),
              _buildParagraph(
                'The University Chat App is intended for use by university students, faculty, and staff. By using our app, you affirm that you are at least 18 years old or have obtained parental consent if you are under the age of 18.',
              ),
              _buildHeading('3. Account Registration'),
              _buildList([
                'a. You must provide accurate and complete information during the registration process.',
                'b. You are responsible for maintaining the confidentiality of your account credentials.',
                'c. You agree to notify us immediately of any unauthorized use of your account.',
              ]),
              _buildHeading('4. Code of Conduct'),
              _buildList([
                'a. Users must adhere to the university\'s code of conduct and policies.',
                'b. Respectful communication is required. Harassment, bullying, or any form of inappropriate behavior is strictly prohibited.',
              ]),
              _buildHeading('5. User-Generated Content'),
              _buildList([
                'a. Users are solely responsible for the content they post on the app.',
                'b. Content must not violate any intellectual property rights, privacy, or other legal rights.',
                'c. We reserve the right to remove any content that violates these terms.',
              ]),
              _buildHeading('6. Privacy and Data Protection'),
              _buildList([
                'a. Our Privacy Policy governs the collection, use, and disclosure of personal information.',
                'b. By using the app, you consent to the terms outlined in our Privacy Policy.',
              ]),
              _buildHeading('7. Termination of Accounts'),
              _buildList([
                'a. We reserve the right to suspend or terminate user accounts for violations of these terms.',
                'b. Users may terminate their accounts at any time by following the app\'s provided procedures.',
              ]),
              _buildHeading('8. App Modifications and Updates'),
              _buildParagraph(
                'We may update, modify, or discontinue features of the app at any time. Users will be notified of significant changes.',
              ),
              _buildHeading('9. Limitation of Liability'),
              _buildList([
                'a. The University Chat App is provided "as is" without warranties of any kind.',
                'b. We are not liable for any direct, indirect, incidental, or consequential damages arising from the use of the app.',
              ]),
              _buildHeading('10. Governing Law'),
              _buildParagraph(
                'These terms are governed by and construed in accordance with the laws of [Your Jurisdiction].',
              ),
              _buildHeading('Contact Information:'),
              _buildParagraph(
                'For questions or concerns regarding these terms, please contact us at [Your Contact Information].',
              ),
              _buildHeading('These terms were last updated on [Date].'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeading(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16.0),
    );
  }

  Widget _buildList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      size: 16.0,
                    ),
                    SizedBox(width: 8.0),
                    Expanded(child: Text(item)),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
