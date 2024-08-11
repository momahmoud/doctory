import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_comp/features/bookings/data/models/booking_model.dart';

import 'booking_card_widget.dart';

class BookingsListWidget extends StatelessWidget {
  final List<BookingModel> doctors;
  final String appointmentStatus;
  const BookingsListWidget({
    super.key,
    required this.doctors,
    required this.appointmentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: doctors.length,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      physics: const BouncingScrollPhysics(
        decelerationRate: ScrollDecelerationRate.fast,
      ),
      itemBuilder: (context, index) {
        return BookingCardWidget(
          booking: doctors[index],
          appointmentStatus: appointmentStatus,
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 12.h),
    );
  }
}
