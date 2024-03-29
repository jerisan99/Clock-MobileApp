import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:limitless/clock_view.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now().toUtc().add(const Duration(hours: 2));

    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      alignment: Alignment.center,
      color: Color(0xFF2D2F41),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(
                  fontFamily: 'avenir',
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 24),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(
                      fontFamily: 'avenir', color: Colors.white, fontSize: 64),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: ClockView(
                size: MediaQuery.of(context).size.height / 4,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Timezone',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20),
                ),
                SizedBox(width: 16),
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'UTC' + offsetSign + timezoneString,
                      style: TextStyle(
                          fontFamily: 'avenir',
                          color: Colors.white,
                          fontSize: 14),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}


