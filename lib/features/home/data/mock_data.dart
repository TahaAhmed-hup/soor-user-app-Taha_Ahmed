import 'package:soor_user_app/core/const/app_icons.dart';
import 'package:soor_user_app/core/themes/colors/app_colors.dart';
import 'package:soor_user_app/features/home/models/booking_model.dart';
import 'package:soor_user_app/features/home/models/offer_model.dart';
import 'package:soor_user_app/features/home/models/review_model.dart';
import 'package:soor_user_app/features/home/models/service_model.dart';

class MockData {
  static const List<OfferModel> offers = [
    OfferModel(title: 'خصم 50%\nعلى اول حجز', buttonText: 'احجز الآن'),
    OfferModel(title: 'خصم 30%\nعلى اول حجز', buttonText: 'احجز الآن'),
    OfferModel(title: 'خصم 10%\nعلى اول حجز', buttonText: 'احجز الآن'),
  ];

  static const List<ServiceModel> services = [
    ServiceModel(
      name: 'طلب فرد',
      iconPath: AppIcons.person,
      startColor: AppColors.individualStartColor,
      endColor: AppColors.individualEndColor,
    ),
    ServiceModel(
      name: 'مناسبات',
      iconPath: AppIcons.people,
      startColor: AppColors.occasionsStartColor,
      endColor: AppColors.occasionsEndColor,
    ),
  ];

  static const BookingModel currentBooking = BookingModel(
    bookingNumber: '#12336455',
    status: 'منتهى',
    time: 'اليوم 8:00 م الى 11:00 م',
    price: '1600',
    currency: 'ريال',
  );

  static const List<ReviewModel> reviews = [
    ReviewModel(
      customerName: 'على احمد ابراهيم',
       comment: 'خدمة ممتازة مع الالتزام فى المواعيد',
        rating: 5
        ),
        ReviewModel(
      customerName: 'على احمد ابراهيم',
       comment: 'خدمة ممتازة مع الالتزام فى المواعيد',
        rating: 4.5
        ),
        ReviewModel(
      customerName: 'على احمد ابراهيم',
       comment: 'خدمة ممتازة مع الالتزام فى المواعيد',
        rating: 3
        ),
  ];
}
