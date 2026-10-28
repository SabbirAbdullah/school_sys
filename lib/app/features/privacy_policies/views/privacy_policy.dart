
import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(title: Text('Privacy Policy')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy for School – Students & Parents',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome to School – Students & Parents. Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application (“App”). By using the App, you consent to the practices described in this policy.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '1. Information Collection:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Student and Parent/Guardian Data (School-Provided):\n\n'
                    'Student identifiers (names, student IDs), academic records (attendance, grades, assignments, exam results), class schedules, and other educational information.\n\n'
                    'Parent/guardian contact details (names, phone numbers, email, addresses), and their relationship to the student.\n\n'
                    'This data handling reflects common practices in educational applications, focusing on collecting information necessary for effective school-to-home communication and student progress tracking.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Device and Usage Information:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Device specifications (model, OS version, unique identifiers, IP address), network details.\n\n'
                    'App usage patterns (feature access, time spent, navigation, crash reports), reflecting standard application usage tracking.\n\n'
                    'Device access (storage, dialer, contacts)',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Data Minimization:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'We commit to collecting only the information necessary for the App’s intended educational purposes, respecting user privacy.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Log Data:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'We collect information that your device sends whenever you use our app (“Log Data”). This Log Data may include information such as your device’s Internet Protocol (“IP”) address, device type, operating system version, the time and date of your use of the app, the time spent on those pages and other statistics.'
                  ,style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '2. Information Usage:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Educational Functionality:\n\n'
                    'Providing secure access to student academic information for authorized parents/guardians and students.\n\n'
                    'Facilitating seamless communication between the school, parents, and students (notifications, messages).\n\n'
                    'Generating and displaying relevant academic reports and records.\n\n'
                    'Providing and maintaining the service.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'App Improvement and Support:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Analyzing usage data to enhance the App’s performance, user experience, and stability.\n\n'
                    'Providing timely technical support and addressing user inquiries.\n\n'
                    'Monitoring the usage of the service.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Security and Compliance:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Detecting, preventing and addressing technical issues.\n\n'
                    'Ensuring the security and integrity of the App and its data.\n\n'
                    'Complying with legal obligations and school policies.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '3. Information Sharing:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Authorized School Personnel:\n\n'
                    'Sharing student and parent/guardian data with school administrators, teachers, and staff for educational and administrative purposes.\n\n'
                    'Third-Party Service Providers:\n\n'
                    'Engaging reputable service providers for app hosting, data storage, analytics, and communication services, under strict contractual obligations to protect user data.\n\n'
                    'Legal Requirements:\n\n'
                    'Disclosing information when required by law or to comply with legal processes (court orders, subpoenas).',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '4. Data Security:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Reasonable Security Measures:\n\n'
                    'Implementing industry-standard security measures (encryption, access controls) to protect user data from unauthorized access, use, or disclosure.\n\n'
                    'Acknowledging that no online transmission or electronic storage method is entirely secure.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '5. Data Retention:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Retention Period:\n\n'
                    'We retain user information only as long as necessary for the purposes outlined in this policy. Users may request data deletion by contacting us at info@alhasanain.edu.bd.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '6. Children’s Privacy:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'School-Directed Use:\n\n'
                    'If any data from children under 13 is collected without that consent, that data will be promptly deleted.\n\n'
                    'The App is intended for use by students and their parents/guardians under the supervision and direction of the school.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '7. User Rights:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Access and Update:\n\n'
                    'Users can access and update their information through the App’s settings or by contacting the school administration.\n\n'
                    'Data Deletion:\n\n'
                    'Users can request the deletion of their information, subject to applicable laws and school policies.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '8. Content Rating and Family Policy:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Content Rating:\n\n'
                    'This application is designed for educational use and contains content relevant to students and their parents/guardians. The content is primarily academic, including student grades, attendance records, school announcements, and communication tools.\n\n'
                    'We strive to maintain a safe and appropriate environment for all users.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Family Policy:\n\n'
                    'The App is intended for use by students and their parents/guardians under the supervision and direction of the school.\n\n'
                    'We recognize the importance of protecting children’s privacy and safety.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '9. Policy Updates:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Policy Changes:\n\n'
                    'We may periodically update this privacy policy. Users will be notified of any material changes through in-app notifications or by posting the revised policy on this page.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '10. App Development and Publication Responsibility:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'School has authorized Sabbir Abdullah to develop and publish the "School - Students & Parents" application. '
                    'As the authorized developer and publisher, Sabbir Abdullah is responsible for the technical aspects of the App\'s operation, including:\n\n'
                    '• App development, maintenance, and updates.\n'
                    '• App publication and distribution on app stores (e.g., Google Play).\n'
                    '• Ensuring the App\'s technical functionality and security.\n'
                    '• Implementing security measures to protect user data.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '11. Contact Information:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'School Contact:\n\n'
                    'For any questions regarding this privacy policy, please contact the school administration at info@alhasanain.edu.bd or Call Us 01847422750\n\n'
                    'By using the School – Students & Parents App, you consent to the terms of this privacy policy.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
