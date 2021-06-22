import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../shared/search_field.dart';
import 'movie/movie_screen.dart';
import 'movie/widgets/search_movie_screen.dart';
import 'tvshow/tv_show_screen.dart';
import 'tvshow/widgets/search_tv_show_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController controller;
  int switching = 0;
  bool onTapping = true;
  int idd;
  bool isSwitched = false;
  List<int> numofMovie = [];

  final switchIndex = BehaviorSubject<int>.seeded(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('An App'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SearchField(
                  controller: controller,
                  initialValue: '',
                  hint: '',
                  onChanged: (value) async {
                    if (value.length > 2) if (switchIndex.value == 0) {
                      Navigator.pushNamed(context, SearchMovieScreen.route,
                          arguments: value);
                    } else {
                      Navigator.pushNamed(context, SearchTvShowScreen.route,
                          arguments: value);
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            ToggleSwitch(
              minWidth: 250,
              minHeight: 30,
              initialLabelIndex: 1,
              totalSwitches: 2,
              activeBgColor: [Color.fromRGBO(0, 122, 255, 1)],
              activeFgColor: Color.fromRGBO(255, 255, 255, 1),
              inactiveBgColor: Color.fromRGBO(255, 255, 255, 1),
              inactiveFgColor: Color.fromRGBO(0, 122, 255, 1),
              borderWidth: 2.0,
              borderColor: [Color.fromRGBO(0, 122, 255, 1)],
              labels: ['Movies', 'TV Shows'],
              onToggle: (index) {
                switchIndex.add(index);
                print(index);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder<int>(
                  stream: switchIndex.stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      CircularProgressIndicator();
                    }
                    return snapshot.data == 1
                        ? TvShowStreamBuilder()
                        : MovieScreen();
                  }),
            ),
          ],
        ));
  }
}
