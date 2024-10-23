import 'package:farmbroapk/page/dashboard/dashboard_detail_page.dart';
import 'package:flutter/material.dart';

class SensorCard extends StatelessWidget {
  final String titleCard;
  final String statusCard;
  final String valueCard;
  final Color colorBackground;
  final Color colorFont;

  const SensorCard({super.key, required this.titleCard, required this.statusCard, required this.valueCard, required this.colorBackground, required this.colorFont,});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      shadowColor: Colors.black.withOpacity(1),
      color: colorBackground,
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashboardDetail(nameDetail: titleCard)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleCard,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: colorFont,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        statusCard,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: colorFont
                        ),
                      ),
                    ],
                  ),
                  Text(
                    valueCard,
                    style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: colorFont,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
