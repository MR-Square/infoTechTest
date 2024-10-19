import 'package:flutter/material.dart';
import 'package:nimap_app/models/record_model.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.width,
    required this.height,
    required this.record,
  });

  final double width;
  final double height;
  final RecordModel record;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: width * 0.65,
            height: height * 0.1,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      record.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  width: width * 0.5,
                  child: Text(
                    record.shortDescription,
                    style:
                        TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: height * 0.11,
            height: height * 0.11,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              // color: Colors.blue[800],
              color: const Color.fromARGB(255, 12, 68, 87),
            ),
            child: const Center(
              child: Text(
                '100%',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}