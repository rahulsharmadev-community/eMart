import 'package:shared/models.dart';
import 'package:test/test.dart';

void main() {
  group('Address Tests', () {
    final addressDummy = Address(
      houseNo: '123',
      email: const Email('open@gmail.com'),
      state: (key: 'DL', value: 'Delhi'),
      country: (key: 'IN', value: 'India'),
      postalCode: '110042',
      personName: const PersonName(firstName: 'John', lastName: 'Doe'),
      plusCode: '4943+VJV',
      geoCoordinate: (lat: 40.7128, lng: -74.0060),
      phoneNumber: const PhoneNumber('1234567890'),
      type: AddressType.business,
      floorLevel: 2,
      area: 'Rohini',
      district: 'Rohini',
      city: 'Dehi',
    );
    test('Test validity', () {
      expect(addressDummy.isValid(false, print), true);

      expect(
        addressDummy.copyWith.personName(const PersonName(firstName: ' 2')).isValid(false, print),
        false,
      );

      expect(addressDummy.copyWith(plusCode: '987823kjhw').isValid(false, print), false);
    });

    test('Validator should throw errors for invalid fields', () {
      var errorObjects = [
        addressDummy.copyWith(plusCode: '987823kjhw'),
        addressDummy.copyWith(personName: PersonName.fromString('x')),
        addressDummy.copyWith(geoCoordinate: (lat: 98787, lng: -234)),
        addressDummy.copyWith(floorLevel: -20),
        addressDummy.copyWith(floorLevel: -30),
      ];

      for (var obj in errorObjects) {
        expect(() => obj.isValid(true, print), throwsArgumentError);
      }
    });

    test('Formatted address should be correct', () {
      final address = addressDummy.copyWith(
        houseNo: '123',
        postalCode: '10001',
        plusCode: '87G8P7X8+M6',
        phoneNumber: const PhoneNumber('1234567890'),
        city: 'New York',
        area: 'Manhattan',
      );

      expect(address.formattedAddress, '123, Manhattan, New York, Delhi, 10001, India');
    });
  });
}
