import 'package:app/components/eventCard.dart';
import 'package:app/models/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

const List allEventTags = [
  "Cooking",
  "Coding",
  "Dancing",
  "Art",
  "Meditation",
  "Fitness"
];
const List chipColors = [
  Color(0xff0038A8),
  Color(0xff9B4F96),
  Color(0xffD60270)
];

class MainFeed extends StatefulWidget {
  @override
  _MainFeedState createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  List<Event> events = [];
  List selectedTags;
  bool loaded;

  @override
  void initState() {
    super.initState();
    this.selectedTags = [
      "Cooking",
      "Coding",
      "Dancing",
      "Art",
      "Meditation",
      "Fitness",
    ];
    loaded = false;
    loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        middle: Text("Home"),
      ),
      child: Container(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(height: 90),
            ),
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                return await Future.delayed(
                  Duration(
                    seconds: 2,
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 70,
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  itemCount: allEventTags.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (c, i) {
                    return Container(
                      width: 8,
                    );
                  },
                  itemBuilder: (c, i) {
                    String thisTag = allEventTags[i];
                    return Material(
                      type: MaterialType.transparency,
                      child: ActionChip(
                        onPressed: () {
                          setState(() {
                            this.selectedTags.contains(thisTag)
                                ? this.selectedTags.remove(thisTag)
                                : this.selectedTags.add(thisTag);
                          });
                        },
                        label: Text(
                          thisTag,
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: this.selectedTags.contains(thisTag)
                            ? chipColors[i % 3]
                            : Colors.grey[300],
                      ),
                    );
                  },
                ),
              ),
            ),
            this.loaded
                ? SliverList(
                    delegate: SliverChildListDelegate(
                      List.generate(
                        this.events.length,
                        (index) => EventCard(
                          this.events[index],
                        ),
                      ),
                    ),
                  )
                : SliverFillRemaining(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void loadEvents()async{
    Response response;
  }
}
