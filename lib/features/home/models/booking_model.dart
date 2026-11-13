class BookingModel {
  final String bookingNumber;
  final String status;
  final String time;
  final String price;
  final String currency;

  const BookingModel({
    required this.bookingNumber,
    required this.status,
    required this.time,
    required this.price,
    required this.currency,
  });
}
