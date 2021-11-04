import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:urbansat/modules/login/login_controller.dart';
import 'package:urbansat/modules/reports/last_travel_page.dart';
import 'package:urbansat/shared/themes/app_colors.dart';
import 'package:urbansat/shared/themes/app_text_styles.dart';
import 'package:urbansat/shared/widgets/bottom/bottom_widget.dart';

class MainReports extends StatelessWidget {
  const MainReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final format = DateFormat('dd/MM/yyyy hh:mm:ss');
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.primary,
          leading: BackButton(),
          leadingWidth: 25,
          title: Text(
            'Relatórios',
            style: TextStyles.titleHome,
          ),
          // actions: <Widget>[
          //   Container(
          //     padding: EdgeInsets.only(right: 5),
          //     child: Row(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(5.0),
          //           child: Container(
          //             height: 48,
          //             width: 160,
          //             alignment: Alignment.centerRight,
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Container(
          //                   alignment: Alignment.centerRight,
          //                   width: double.maxFinite,
          //                   child: GetX<LoginController>(
          //                     builder: (_) => Text(
          //                       _.username.toString(),
          //                     ),
          //                   ),
          //                 ),
          //                 Container(
          //                   alignment: Alignment.centerRight,
          //                   width: double.maxFinite,
          //                   child: Text(
          //                     format.format(DateTime.now()),
          //                     style: TextStyles.captionShape,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         GetX<LoginController>(builder: (_) {
          //           return Container(
          //             height: 48,
          //             width: 48,
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(5),
          //               image: DecorationImage(
          //                 image: NetworkImage(_.userimage.toString()),
          //               ),
          //             ),
          //           );
          //         }),
          //       ],
          //     ),
          //   ),
          // ],
          bottom: TabBar(tabs: [
            Tab(text: 'Ult. Viagem', icon: Icon(Icons.travel_explore_outlined)),
            Tab(
                text: 'Desloc. Parada',
                icon: Icon(Icons.transfer_within_a_station_sharp)),
            Tab(text: 'DP Diário', icon: Icon(Icons.airport_shuttle_outlined)),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          LastTravelPage(),
          Container(
            height: 200,
            width: double.maxFinite,
            color: Colors.green,
          ),
          Container(
            height: 200,
            width: double.maxFinite,
            color: Colors.amberAccent,
          ),
        ]),
        bottomNavigationBar: BottomWidget(route: 'reports'),
      ),
    );
  }
}
