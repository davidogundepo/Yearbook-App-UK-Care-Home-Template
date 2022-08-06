
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api/care_home_arial_images_api.dart';
import '../api/achievement_images_api.dart';
import '../notifier/care_home_arial_notifier.dart';
import '../notifier/achievement_images_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pie_chart/pie_chart.dart';


String careHomeName = "AAB Care Home";
String aboutCareHome = "About $careHomeName";

String visionSwipe = "Swipe left on 'OUR VISION STATEMENT'  >>>";
String visionTitle = "OUR VISION STATEMENT";
String visionStatement = "Raising the total livelihood through comprehensive care structure.";
String missionTitle = "OUR MISSION STATEMENT";
String missionStatement = "Mobilizing Moral, Social, and Religious tools, by dedicated and vision driven carers in a proactive environment of clinical staff and learning, which is geared towards impacting and equipping our staff to be THE TOTAL YOUTH the world will be proud of.";

String coreValues = "OUR CORE VALUES";
String cvStatement1 = "1. We are dedicated to the success of each staff \n\n";
String cvStatement2 = "2. We provide care as well as hope for the future\n\n";
String cvStatement3 = "3. We are genuinely interested in deploying the full capacity of each careAssistant.\n\n";
String cvStatement4 = "4. We create a social atmosphere for staff and we believe every footballer can excel.";

String whyCareHome = "WHY $careHomeName?".toUpperCase();
String whyCareHomeStatement = "$careHomeName was established on the 3rd of October 2015 out of the vision and passion of Dr. Edwin Greaves to empower today’s youth for tomorrows challenges.\n\nWe offer staff (both domestic and international) the opportunity to earn an unparalleled high-quality educational experience. With passionate and  qualified clinical staff staff, a clean and caring careHome atmosphere, and the resources to supply staff with the skills necessary for their continued personal success, our careHome looks to help staff to realize their potential.";
String staffBody = "Staff Body\n\n";
String staffBodyStatement = "We have 5 clinical staff staff and 9 non-clinical staff staff (including management body) in $careHomeName.";
String populationChart = "$careHomeName Population Chart";
String careAssistantBody = "Care Assistants Body\n\n";
String careAssistantBodyStatement = "We currently have 34 staff in $careHomeName, 14 male staff and 20 female staff.";
String careAssistantPopulationChart = "$careHomeName staff Population Chart";

String careExerciseSwipe = "Swipe up for all Care exercises offered";
String careExercisesOffered = "Some of the care exercises provided in $careHomeName are:";
String careExercisesOffered1 = "1. Physiological needs\n";
String careExercisesOffered2 = "2. Safety\n";
String careExercisesOffered3 = "3. Social\n";
String careExercisesOffered4 = "4. Esteem \n";
String careExercisesOffered5 = "5. Evident person-centred care\n";
String careExercisesOffered6 = "6. A Homely Physical Environment\n";
String careExercisesOffered7 = "7. Efficient Communication\n";
String careExercisesOffered8 = "8. Happy and responsive residents\n";
String careExercisesOffered9 = "9. Toilet Mobility to aid Incontinence\n";
String careExercisesOffered10 = "10. Appealing and tasty foods.\n\n";


String extraCurricularActs = "Extra-curricular Activities offered in $careHomeName\n\n";
String extraCurricularActsStatement1 = "1. Range of activities like cake making, painting, bingos, take place.\n";
String extraCurricularActsStatement2 = "2. Crosswords and other handy games\n";
String extraCurricularActsStatement3 = "3. Garden recreational activities\n";
String extraCurricularActsStatement4 = "4. Easter celebrations and gifts day\n";

String careHomeArialViewsSwipe = "Swipe left or right for more photos";
String careHomeArialViews = "Some Arial views of $careHomeName";
String careHomeAchievementsSwipe = "Swipe left or right for more photos";
String careHomeAchievements = "Some of our achievements";
String moreInfoAboutCareHome = "For more information about $careHomeName please trust and click me";
String moreInfoAboutCareHomeURL = "https://beaufortcarehome.uk/";

double maleCareAssistantPopulation = 871;
double femaleCareAssistantPopulation = 655;
double clinicalStaffPopulation = 85;
double nonClinicalStaffPopulation = 32;


Color backgroundColor = Color.fromRGBO(161, 37, 104, 1);
Color cardBackgroundColor = Color.fromRGBO(217, 81, 155, 1.0);
Color appBarIconColor = Colors.white;
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(161, 37, 104, 1);
Color cardTextColor = Colors.white;
Color cardColor = Color.fromRGBO(217, 81, 155, 1.0);
Color boxDecorationColor = Color.fromRGBO(233, 108, 175, 1.0);
Color chartBackgroundColor = Color.fromRGBO(28, 26, 26, 1.0);
Color materialColor = Colors.transparent;
Color textColor = Colors.white;
Color firstCareHomeChartColor = Color.fromRGBO(140, 27, 88, 1.0);
Color secondCareHomeChartColor = Color.fromRGBO(233, 108, 175, 1.0);
Color thirdCareHomeChartColor = Color.fromRGBO(217, 81, 155, 1.0);
Color fourthCareHomeChartColor = Color.fromRGBO(179, 10, 102, 1.0);
Color firstCareAssistantChartColor = Color.fromRGBO(140, 27, 88, 1.0);
Color secondCareAssistantChartColor = Color.fromRGBO(233, 108, 175, 1.0);


class aboutCareHomeDetails extends StatefulWidget {

  aboutCareHomeDetails({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _aboutCareHomeDetailsState createState() => _aboutCareHomeDetailsState();
}

class _aboutCareHomeDetailsState extends State<aboutCareHomeDetails> {

  final controlla = PageController(
    initialPage: 0,
  );

  var scrollDirection = Axis.horizontal;


  @override
  void initState() {
    CareHomeArialNotifier careHomeArialNotifier = Provider.of<CareHomeArialNotifier>(context, listen: false);
    getCareHomeArial(careHomeArialNotifier);

    AchievementsNotifier achievementsNotifier = Provider.of<AchievementsNotifier>(context, listen: false);
    getAchievements(achievementsNotifier);

    careHomeMap.putIfAbsent("Care Assistants", () => 16);
    careHomeMap.putIfAbsent("Nurses", () => 7);
    careHomeMap.putIfAbsent("Non Clinical Staff", () => 5);
    careHomeMap.putIfAbsent("Management Body", () => 6);

    careAssistantMap.putIfAbsent("Male Care Assistants", () => 5);
    careAssistantMap.putIfAbsent("Female Care Assistants", () => 11);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CareHomeArialNotifier careHomeArialNotifier = Provider.of<CareHomeArialNotifier>(context);
    AchievementsNotifier achievementsNotifier = Provider.of<AchievementsNotifier>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(aboutCareHome,
          style: TextStyle(
            color: appBarIconColor
          )
        ),
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: appBarIconColor),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
        elevation: 10,
        backgroundColor: appBarBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(visionSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cardTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 500,
              child: PageView(
                controller: controlla,
                scrollDirection: scrollDirection,
                pageSnapping: true,
                children: <Widget>[
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin: EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    visionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                visionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: cardTextColor,
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    missionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                missionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: cardTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    coreValues,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: cvStatement1,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement2,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement3,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement4,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    whyCareHome,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                whyCareHomeStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: staffBody,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: staffBodyStatement,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10),
                            child: Text(populationChart,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: cardTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          PieChart(
                            dataMap: careHomeMap,
                            animationDuration: Duration(milliseconds: 8000),
                            chartLegendSpacing: 42,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            colorList: careHomeColorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.disc,
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.bottom,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                color: cardTextColor,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              // showChartValueLabel: true,
                              chartValueStyle: defaultChartValueStyle.copyWith(
                                color: textColor.withOpacity(0.9),
                              ),
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 0,
                              chartValueBackgroundColor: chartBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: careAssistantBody,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: careAssistantBodyStatement,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 370,
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10),
                            child: Text(careAssistantPopulationChart,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: cardTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          PieChart(
                            dataMap: careAssistantMap,
                            animationDuration: Duration(milliseconds: 8000),
                            chartLegendSpacing: 42,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            colorList: careAssistantColorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.right,
                              showLegends: true,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                color: cardTextColor,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              // showChartValueLabel: true,
                              chartValueStyle: defaultChartValueStyle.copyWith(
                                color: textColor.withOpacity(0.9),
                              ),
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              decimalPlaces: 0,
                              chartValueBackgroundColor: chartBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(careExercisesOffered,
                style: TextStyle(
                    fontSize: 20,
                    color: cardTextColor,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(careExerciseSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cardTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 300,
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: careExercisesOffered,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: careExercisesOffered1,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: careExercisesOffered2,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: careExercisesOffered3,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: careExercisesOffered4,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: careExercisesOffered5,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: careExercisesOffered6,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: careExercisesOffered7,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: careExercisesOffered8,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: careExercisesOffered9,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: careExercisesOffered10,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 300,
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: extraCurricularActs,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement1,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement2,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement3,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                              TextSpan(
                                  text: extraCurricularActsStatement4,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(careHomeArialViews,
              style: TextStyle(
                fontSize: 20,
                color: cardTextColor,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(careHomeArialViewsSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cardTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: careHomeArialNotifier.careHomeArialList.length,
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              careHomeArialNotifier.careHomeArialList[index].image
                          ),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        color: cardColor
                      ),
                      child: ListTile(
                        title: Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              careHomeArialNotifier.careHomeArialList[index].toastName,
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 17.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(careHomeAchievements,
              style: TextStyle(
                fontSize: 20,
                color: cardTextColor,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Container(
                child: Material (
                  color: materialColor,
                  child: InkWell(
                    splashColor: cardTextColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(careHomeArialViewsSwipe,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: cardTextColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: boxDecorationColor.withAlpha(50),
                    borderRadius: new BorderRadius.circular(5)
                ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: achievementsNotifier.achievementsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                          image: DecorationImage(
//                            colorFilter: ColorFilter.linearToSrgbGamma(),
                            image: CachedNetworkImageProvider(
                                achievementsNotifier.achievementsList[index].image
                            ),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          color: cardColor
                        ),
                        child: ListTile(
                          title: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                achievementsNotifier.achievementsList[index].toastName,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemWidth: 350,
                  layout: SwiperLayout.STACK,
//                pagination: SwiperPagination(),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30, top: 20),
              child: RichText(
                text: TextSpan(
                  text: moreInfoAboutCareHome,
                  style: TextStyle(
                    fontSize: 17,
                    color: cardTextColor,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    launch(moreInfoAboutCareHomeURL);
                  }
                ),
              )
            ),

          ],
        ),
      ),
    );

  }
}

class CareHomeCareAssistantPopulation{
  String x;
  double y;
  CareHomeCareAssistantPopulation(this.x,this.y);
}

dynamic getCareAssistantPopulationData(){
  List<CareHomeCareAssistantPopulation> careAssistantPopulationData = <CareHomeCareAssistantPopulation>[
    CareHomeCareAssistantPopulation('Male Care Assistants', maleCareAssistantPopulation),
    CareHomeCareAssistantPopulation('Female Care Assistants', femaleCareAssistantPopulation),
  ];
  return careAssistantPopulationData;
}

class CareHomePopulation{
  String x;
  double y;
  CareHomePopulation(this.x,this.y);
}

dynamic getCareHomePopulationData(){
  List<CareHomePopulation> careHomePopulationData = <CareHomePopulation>[
    CareHomePopulation('Care Assistants', maleCareAssistantPopulation),
    CareHomePopulation('Nurses', femaleCareAssistantPopulation),
    CareHomePopulation('Non Clinical Staff', clinicalStaffPopulation),
    CareHomePopulation('ManagementBody', nonClinicalStaffPopulation),
  ];
  return careHomePopulationData;
}


bool toggle = false;
Map<String, double> careHomeMap = Map();

Map<String, double> careAssistantMap = Map();

List<Color> careHomeColorList = [
  firstCareHomeChartColor,
  secondCareHomeChartColor,
  thirdCareHomeChartColor,
  fourthCareHomeChartColor,
];

List<Color> careAssistantColorList = [
  firstCareAssistantChartColor,
  secondCareAssistantChartColor,
];