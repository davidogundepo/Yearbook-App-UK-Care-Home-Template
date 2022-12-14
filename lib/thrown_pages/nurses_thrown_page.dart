import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../thrown_searches/nurses_thrown_search.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_care_home.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../api/nurses_api.dart';
import '../notifier/nurses_notifier.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/nurses_details_page.dart';


String careHomeName = "AAB Care Home";
String thrownName = "Nurses";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";

String whoWeAre = "Who We Are";
String aboutSchool = "About $careHomeName";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String imgAsset = "assets/images/landing_5.jpeg";
Color cc = Color.fromRGBO(227, 190, 198, 1.0);
Color dd = Color.fromRGBO(207, 116, 135, 1.0);


Color backgroundColor = Color.fromRGBO(5, 118, 109, 1.0);
Color appBarTextColor = Color.fromRGBO(94, 148, 138, 1.0);
Color appBarBackgroundColor = Color.fromRGBO(5, 118, 109, 1.0);
  Color appBarIconColor = Color.fromRGBO(94, 148, 138, 1.0);
Color modalColor = Colors.transparent;
Color modalBackgroundColor = Color.fromRGBO(5, 118, 109, 1.0);
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Color.fromRGBO(5, 118, 109, 1.0);
Color splashColor = Color.fromRGBO(5, 118, 109, 1.0);
Color iconColor = Color.fromRGBO(94, 148, 138, 1.0);
Color iconColorTwo = Colors.white70;
Color textColor = Color.fromRGBO(94, 148, 138, 1.0);
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(5, 118, 109, 1.0);
Color borderColor = Colors.black;


class MyNursesPage extends StatefulWidget with NavigationStates{
  MyNursesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyNursesPage createState() => _MyNursesPage();


}

class _MyNursesPage extends State<MyNursesPage> {


  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }


  Widget _buildProductItem(BuildContext context, int index) {
    NursesNotifier nursesNotifier = Provider.of<NursesNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: borderColor.withAlpha(50),
        ),

        child: Material(
          color: materialBackgroundColor,
          child: InkWell(
            splashColor: splashColor,
            onTap: () {
              nursesNotifier.currentNurses = nursesNotifier.nursesList[index];
              navigateToSubPage(context);
            },

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            alignment: Alignment(0, -1),
                            image: CachedNetworkImageProvider(
                                nursesNotifier.nursesList[index].image
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  nursesNotifier.nursesList[index].name,
                                  style: GoogleFonts.tenorSans(
                                      color: textColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                              SizedBox(width: 10),
                              Icon (
                                MdiIcons.shieldCheck,
                                color: iconColor,
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 10),
                        //   child: Text(
                        //     nursesNotifier.nursesList[index].twitter,
                        //      style: GoogleFonts.varela(
                        //           color: textColorTwo,
                        //           fontStyle: FontStyle.italic
                        //       )
                        //   ),
                        // ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
        backgroundColor: dialogBackgroundColor,
        title: Text(exitAppTitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
  }

  Future navigateToAboutAppDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppDetails()));
  }
  Future navigateToAcronymsMeaningsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AcronymsMeanings()));
  }
  Future navigateToAboutSchoolDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => aboutCareHomeDetails()));
  }
  Future navigateToWhoWeArePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WhoWeAre()));
  }


  @override
  void initState() {
    NursesNotifier nursesNotifier = Provider.of<NursesNotifier>(context, listen: false);
    getNurses(nursesNotifier);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    NursesNotifier nursesNotifier = Provider.of<NursesNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: backgroundColor,

          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.formatFloatLeft, color: iconColor
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: modalColor,
                            context: context,
                            builder: (context) => Container(
                              height: 250,
                              decoration: BoxDecoration(
                                color: modalBackgroundColor,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              ),
                              child: Material(
                                color: materialBackgroundColor,
                                child: InkWell(
                                  splashColor: splashColor,
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(
                                            MdiIcons.atom,
                                            color: iconColorTwo),
                                          title: new Text(whoWeAre,
                                            style: GoogleFonts.zillaSlab(
                                              color: textColorTwo,
                                            ),),
                                          onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen, color: iconColorTwo),
                                        title: new Text(aboutSchool,
                                          style: GoogleFonts.zillaSlab(
                                            color: textColorTwo,
                                          ),),
                                        onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToAboutSchoolDetailsPage(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending, color: iconColorTwo),
                                          title: new Text(acronymMeanings,
                                            style: GoogleFonts.zillaSlab(
                                              color: textColorTwo,
                                            ),),
                                          onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity, color: iconColorTwo),
                                        title: new Text(aboutApp,
                                          style: GoogleFonts.zillaSlab(
                                            color: textColorTwo,
                                          ),),
                                        onTap: () {
                                            Navigator.of(context).pop(false);
                                            navigateToAboutAppDetailsPage(context);
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.magnify, color: iconColor),
                      onPressed: nursesNotifier.nursesList == null
                          ? null
                          : (){
                        showSearch(
                          context: context,
                          delegate: MyNursesSearch(all: nursesNotifier.nursesList),
                        );
                      },
                      tooltip: "Search",
                    ),
                  ],
                  backgroundColor: appBarBackgroundColor,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Center(
                        heightFactor: 0.6,
                        child: Text(thrownName,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.abel(
                              color: appBarTextColor,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                    background: Image.asset(imgAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Container(
                margin: new EdgeInsets.only( bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  itemBuilder: _buildProductItem,
                  itemCount: nursesNotifier.nursesList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
