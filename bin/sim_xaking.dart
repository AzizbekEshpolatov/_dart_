import 'dart:io';

class SIMCard {
  final String phoneNumber;
  final List<Map<String, String>> contacts;
  final List<Map<String, String>> smsMessages;

  SIMCard({
    required this.phoneNumber,
    required this.contacts,
    required this.smsMessages,
  });
}

void main() {
  print('📱 Legal SIM Card Reader Simulation');
  print('----------------------------------\n');

  // Create simulated SIM card data
  final mySIM = SIMCard(
    phoneNumber: '+9989XXXXXX',
    contacts: [
      {'name': 'John Doe', 'number': '+123456789'},
      {'name': 'Jane Smith', 'number': '+987654321'},
      {'name': 'Emergency', 'number': '911'},
    ],
    smsMessages: [
      {'sender': 'Bank', 'message': 'Your balance is \$100', 'time': '10:30 AM'},
      {'sender': 'Mom', 'message': 'Call me when you can', 'time': 'Yesterday'},
      {'sender': 'Service', 'message': 'Your data package expired', 'time': '1h ago'},
    ],
  );

  // Display SIM information
  print('🔢 Phone Number: ${mySIM.phoneNumber}\n');

  // Display contacts
  print('📞 Contacts (${mySIM.contacts.length}):');
  for (final contact in mySIM.contacts) {
    print('  👤 ${contact['name']}: ${contact['number']}');
  }

  // Display SMS messages
  print('\n✉️ SMS Messages (${mySIM.smsMessages.length}):');
  for (final sms in mySIM.smsMessages) {
    print('  📩 ${sms['sender']} (${sms['time']}): ${sms['message']}');
  }

  // Legal warnings
  print('\n🔐 Important Legal Notes:');
  print('  - This is a simulation only');
  print('  - Real SIM access requires special hardware');
  print('  - Unauthorized access is prohibited by law');
  print('  - Use only for educational purposes\n');

  print('✅ Simulation completed successfully');
}