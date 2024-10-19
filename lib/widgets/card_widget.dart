import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nimap_app/models/record_model.dart';
import 'package:nimap_app/widgets/carousel_widget.dart';
import 'package:nimap_app/widgets/info_widget.dart';

class CardWidget extends StatelessWidget {
  final RecordModel record;
  const CardWidget({super.key, required this.record});

  // Mehtod to Calculate remaining days
  int calculateDaysLeft(String startDate, String endDate) {
    DateTime start = DateFormat("dd/MM/yyyy").parse(startDate);
    DateTime end = DateFormat("dd/MM/yyyy").parse(endDate);

    return end.difference(start).inDays;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Column(
          children: [
            CarouselWidget(record: record),
            Container(
              height: height * 0.15,
              decoration: BoxDecoration(
                color: Colors.blue[800],
              ),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.067,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '₹',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              ' ${record.collectedValue}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'FUNDED',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.067,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              '₹',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              ' ${record.totalValue}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'GOALS',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.067,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${calculateDaysLeft(record.startDate, record.endDate)}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        ),
                        const Text(
                          'ENDS IN',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'PLEDGE',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 90,
          child: InfoWidget(width: width, height: height, record: record),
        ),
      ],
    );
  }
}
