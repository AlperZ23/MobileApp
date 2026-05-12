import 'package:flutter_test/flutter_test.dart';
import 'package:sucab/models/ride.dart';

void main() {
  group('Ride Model Tests', () {
    final testRide = Ride(
      id: 'test-id-123',
      title: 'Sabiha → SU',
      from: 'Sabiha Gökçen Airport',
      to: 'Sabancı University',
      date: '2026-05-20',
      time: '14:00',
      availableSeats: 3,
      driverName: 'Ömür Emre',
      driverUid: 'uid-001',
      joinedUsers: [],
      status: 'Active',
      preference: 'No smoking',
      pickupPoint: 'Terminal 1 exit',
      ticketId: '#SC-1234',
      createdAt: DateTime(2026, 5, 15, 10, 0),
      createdBy: 'uid-001',
    );

    test('Ride is constructed with correct field values', () {
      expect(testRide.id, 'test-id-123');
      expect(testRide.title, 'Sabiha → SU');
      expect(testRide.from, 'Sabiha Gökçen Airport');
      expect(testRide.to, 'Sabancı University');
      expect(testRide.availableSeats, 3);
      expect(testRide.status, 'Active');
      expect(testRide.joinedUsers, isEmpty);
      expect(testRide.ticketId, '#SC-1234');
    });

    test('copyWith returns a new Ride with updated fields', () {
      final updated = testRide.copyWith(
        availableSeats: 1,
        status: 'Full',
        joinedUsers: ['uid-002', 'uid-003'],
      );

      expect(updated.availableSeats, 1);
      expect(updated.status, 'Full');
      expect(updated.joinedUsers.length, 2);

      // Original must remain unchanged
      expect(testRide.availableSeats, 3);
      expect(testRide.status, 'Active');
      expect(testRide.joinedUsers, isEmpty);
    });

    test('copyWith preserves unchanged fields', () {
      final updated = testRide.copyWith(status: 'Cancelled');

      expect(updated.id, testRide.id);
      expect(updated.title, testRide.title);
      expect(updated.from, testRide.from);
      expect(updated.driverUid, testRide.driverUid);
      expect(updated.ticketId, testRide.ticketId);
    });

    test('toMap returns correct key-value pairs', () {
      final map = testRide.toMap();

      expect(map['title'], 'Sabiha → SU');
      expect(map['from'], 'Sabiha Gökçen Airport');
      expect(map['to'], 'Sabancı University');
      expect(map['availableSeats'], 3);
      expect(map['driverUid'], 'uid-001');
      expect(map['status'], 'Active');
      expect(map['joinedUsers'], isEmpty);
      expect(map['ticketId'], '#SC-1234');
      expect(map['preference'], 'No smoking');
      expect(map['pickupPoint'], 'Terminal 1 exit');
    });

    test('toMap does not include id field', () {
      final map = testRide.toMap();
      expect(map.containsKey('id'), isFalse);
    });

    test('Ride with optional fields null is valid', () {
      final minimalRide = Ride(
        id: 'min-id',
        title: 'SU → Kadıköy',
        from: 'Sabancı University',
        to: 'Kadıköy',
        date: '2026-05-21',
        time: '18:00',
        availableSeats: 4,
        driverName: 'Test User',
        driverUid: 'uid-002',
        joinedUsers: [],
        status: 'Active',
        ticketId: '#SC-5678',
        createdAt: DateTime(2026, 5, 15),
        createdBy: 'uid-002',
      );

      expect(minimalRide.preference, isNull);
      expect(minimalRide.pickupPoint, isNull);
    });
  });
}
