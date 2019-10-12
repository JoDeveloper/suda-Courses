import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:suda_courses/animation/nav.dart';
import 'package:suda_courses/utils/oval-right-clipper.dart';
import 'package:suda_courses/widgets/cards.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color primary = Color(0xff291747);
  final Color active = Color(0xff6C48AB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text('Suda Courses'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _key.currentState.openDrawer();
            },
          ),
        ),
        drawer: _buildDrawer(),
        body: SafeArea(
            child: Stack(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Colors.orangeAccent.shade700,
              ),
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.only(left: 90, bottom: 20),
              width: 299,
              height: 279,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent.shade400,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(160),
                      bottomLeft: Radius.circular(290),
                      bottomRight: Radius.circular(160),
                      topRight: Radius.circular(10))),
            ),
            CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Good Morning",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                color: Colors.white)),
                        Text("Everyone",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                color: Colors.white)),
                        SizedBox(
                          height: 40,
                        ),
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: TextField(
                            controller:
                                TextEditingController(text: 'Search...'),
                            cursorColor: Theme.of(context).primaryColor,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            decoration: InputDecoration(
                                suffixIcon: Material(
                                  elevation: 2.0,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: Icon(Icons.search),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 13)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(26.0),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: <Widget>[
                      cards('assets/imgs/logo2.svg', 'Brocoli', '30'),
                      cards('assets/imgs/logo2.svg', 'Cabbage', '37'),
                      cards('assets/imgs/logo2.svg', 'Mango', '22'),
                      cards('assets/imgs/logo2.svg', 'Pineapple', '90'),
                      cards('assets/imgs/logo2.svg', 'Cabbage', '37'),
                      cards('assets/imgs/logo2.svg', 'Mango', '22'),
                      cards('assets/imgs/logo2.svg', 'Pineapple', '90'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )));
  }

  _buildDrawer() {
    final String image = images[0];
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.pink, Colors.deepPurple])),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: CachedNetworkImageProvider(image),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "erika costell",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  Text(
                    "@erika07",
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(Icons.home, "Home"),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Your profile"),
                  _buildDivider(),
                  _buildRow(Icons.settings, "Settings"),
                  _buildDivider(),
                  _buildRow(Icons.email, "Contact us"),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, "Help"),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: active,
    );
  }

  Widget _buildRow(IconData icon, String title) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: [
        Icon(
          icon,
          color: active,
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
      ]),
    );
  }
}
