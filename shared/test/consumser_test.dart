import 'package:shared/models.dart';
import 'package:test/test.dart';

void main() {
  group('Consumer Tests', () {
    test('Consumer creation with email and without phone number', () {
      final consumer = Consumer(
        name: const PersonName(firstName: 'John', lastName: 'Doe'),
        email: const Email('john.doe@example.com'),
        fCMid: 'testFCMid',
        devices: const [],
      );

      expect(consumer.email, const Email('john.doe@example.com'));
      expect(consumer.phoneNumber, isNull);
    });

    test('Consumer creation with phone number and without email', () {
      final consumer = Consumer(
        name: const PersonName(firstName: 'Jane', lastName: 'Doe'),
        phoneNumber: const PhoneNumber('1234567890'),
        fCMid: 'testFCMid',
        devices: const [],
      );

      expect(consumer.email, isNull);
      expect(consumer.phoneNumber!.value, '1234567890');
    });

    test('Consumer creation with both email and phone number should pass', () {
      const email = Email('alice.smith@example.com');
      const phoneNumber = PhoneNumber('0987654321');
      final consumer = Consumer(
        name: const PersonName(firstName: 'Alice', lastName: 'Smith'),
        email: email,
        phoneNumber: phoneNumber,
        fCMid: 'testFCMid',
        devices: const [],
      );

      expect(consumer.email, email);
      expect(consumer.phoneNumber, phoneNumber);
    });

    test('Validator should throw errors for invalid email, phone, and profile image', () {
      expect(
          () => Consumer(
                name: const PersonName(firstName: 'Invalid', lastName: 'Email'),
                email: const Email('invalid-email'),
                phoneNumber: const PhoneNumber('12345'),
                fCMid: 'testFCMid',
                devices: const [],
                profileImg: 'invalid-url',
              ).isValid(true),
          throwsArgumentError);
    });

    test('Primary address should be null if no addresses are set', () {
      final consumer = Consumer(
        name: const PersonName(firstName: 'No', lastName: 'Address'),
        email: const Email('no.address@example.com'),
        fCMid: 'testFCMid',
        devices: const [],
      );

      expect(consumer.primaryAddress, isNull);
    });

    test('Consumer creation with minimal data', () {
      final consumer = Consumer(
        name: const PersonName(firstName: 'Minimal', lastName: 'Data'),
        email: const Email('minimal.data@example.com'),
        fCMid: 'minimalFCMid',
        devices: const [],
      );

      expect(consumer.uid, isNotNull);
      expect(consumer.joinAt, isNotNull);
      expect(consumer.lastUpdateAt, isNotNull);
    });

    test('Consumer comparison should work correctly', () {
      final consumer1 = Consumer(
        name: const PersonName(firstName: 'John', lastName: 'Doe'),
        email: const Email('john.doe@example.com'),
        fCMid: 'testFCMid1',
        devices: const [],
      );

      final consumer2 = Consumer(
        name: const PersonName(firstName: 'John', lastName: 'Doe'),
        email: const Email('john.doe@example.com'),
        fCMid: 'testFCMid2',
        devices: const [],
      );

      expect(consumer1 == consumer2, isFalse);
    });
  });
}
