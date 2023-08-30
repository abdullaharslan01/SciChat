import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:scichat/proje_messages_data.dart';

class SciChat extends StatefulWidget {
  const SciChat({super.key});

  @override
  State<SciChat> createState() => _SciChatState();
}

List<String> textLabel = ["Chats", "Status", "Calls"];
String appBarLabel = "SciChat ";
Color _generalColor = Color(0XFF6E7C85);
String _fontfamily = "Helvetica";

Color _indicatiorColor = Color(0XFF0A5649);
Color _groupColor = _generalColor;

class _SciChatState extends State<SciChat> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(controller: _tabController, children: [
            _body(
              child: Text("As soon as possible"),
            ),
            _body(
              child: ListView.builder(
                itemCount: peopleData.length,
                itemBuilder: (context, index) {
                  return _listTileItem(
                      title: peopleData[index]["name"].toString(),
                      subtitle: peopleData[index]["quote"].toString(),
                      date: peopleData[index]["date"].toString(),
                      imageloc:
                          "lib/images/${peopleData[index]["image"].toString().toString()}.jpg");
                },
              ),
            ),
            _body(
              child: Text("As soon as possible"),
            ),
            _body(
              child: Text("As soon as possible"),
            ),
          ]),
          floatingActionButton: Container(
            decoration: BoxDecoration(
                color: Color(0xFF00A884),
                borderRadius: BorderRadius.circular(10)),
            child: FloatingActionButton(
              onPressed: () {},
              elevation: 0,
              highlightElevation: 0,
              backgroundColor: Colors.transparent,
              child: Icon(Icons.message_outlined),
            ),
          ),
          appBar: AppBar(
              toolbarHeight: 90,
              actions: [
                _tabBarIcon(
                  icon: Icons.camera_alt_outlined,
                ),
                _tabBarIcon(
                  icon: Icons.search_outlined,
                ),
                _tabBarIcon(
                  icon: FontAwesomeIcons.bars,
                ),
              ],
              title: Text(
                "$appBarLabel",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: _generalColor,
                    fontFamily: _fontfamily),
              ),
              backgroundColor: Color(0XFF1F2C34),
              bottom: TabBar(
                  controller: _tabController,
                  onTap: (value) {
                    value == 0
                        ? _groupColor = _indicatiorColor
                        : _groupColor = _generalColor;
                    setState(() {});
                  },
                  labelPadding: EdgeInsets.all(10),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 4,
                  labelColor: _indicatiorColor,
                  unselectedLabelColor: _generalColor,
                  indicatorColor: _indicatiorColor,
                  tabs: [
                    Icon(
                      Icons.groups,
                      size: 30,
                      color: _groupColor,
                    ),
                    _tabBarText(text: textLabel[0]),
                    _tabBarText(text: textLabel[1]),
                    _tabBarText(text: textLabel[2]),
                  ])),
        ));
  }

  ListTile _listTileItem(
      {required String title,
      required String subtitle,
      required String date,
      required String imageloc}) {
    return ListTile(
      onTap: () {},
      splashColor: Colors.black,
      trailing: Text("$date"),
      title: Text(
        "$title",
      ),
      enabled: true,
      subtitle: Text("$subtitle"),
      minVerticalPadding: 25,
      leading: CircleAvatar(
        radius: 27,
        backgroundImage: AssetImage(
          "$imageloc",
        ),
      ),
    );
  }
}

class _body extends StatelessWidget {
  _body({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFF131A22),
      child: child,
    );
  }
}

class _tabBarIcon extends StatelessWidget {
  _tabBarIcon({super.key, required this.icon});

  IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: Icon(
          icon,
          size: 26,
          color: _generalColor,
        ));
  }
}

class _tabBarText extends StatelessWidget {
  _tabBarText({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
          fontSize: 19, fontWeight: FontWeight.bold, fontFamily: _fontfamily),
    );
  }
}

enum _MyTabViews { chats, status, calls }
