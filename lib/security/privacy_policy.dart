import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
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
              _buildHeading('Privacy Policy'),
              const SizedBox(height: 8.0),
              _buildSubHeading('Last updated: December 8, 2023'),
              _buildParagraph(
                'University Chat App ("us", "we", or "our") operates the University Chat mobile application (the "Service").',
              ),
              _buildParagraph(
                'This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data.',
              ),
              _buildParagraph(
                'We use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy.',
              ),
              _buildHeading('Information Collection And Use'),
              const SizedBox(height: 8.0),
              _buildParagraph(
                'We collect several different types of information for various purposes to provide and improve our Service to you.',
              ),
              _buildSubHeading('Types of Data Collected'),
              const SizedBox(height: 8.0),
              _buildParagraph('- Personal Data\n- Usage Data'),
              _buildHeading('Use of Data'),
              const SizedBox(height: 8.0),
              _buildParagraph(
                'University Chat App uses the collected data for various purposes:',
              ),
              _buildParagraph(
                '- To provide and maintain the Service\n'
                '- To notify you about changes to our Service\n'
                '- To provide customer care and support\n'
                '- To monitor the usage of the Service',
              ),
              _buildHeading('Disclosure Of Data'),
              const SizedBox(height: 8.0),
              _buildParagraph(
                'Legal Requirements\n'
                'University Chat App may disclose your Personal Data in the good faith belief that such action is necessary to:',
              ),
              _buildParagraph(
                '- To comply with a legal obligation\n'
                '- To protect and defend the rights or property of University Chat App\n'
                '- To prevent or investigate possible wrongdoing in connection with the Service\n'
                '- To protect the personal safety of users of the Service or the public',
              ),
              _buildHeading('Security Of Data'),
              const SizedBox(height: 8.0),
              _buildParagraph(
                'The security of your data is important to us, but remember that no method of transmission over the Internet, or method of electronic storage is completely secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.',
              ),
              // ... Add more sections as needed
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

  Widget _buildSubHeading(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16.0),
    );
  }
}
