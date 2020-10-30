import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sibeluapp/bloc/aduan/admin_aduan.dart';
import 'package:sibeluapp/models/aduan/aduan_body.dart';
import 'package:sibeluapp/models/aduan/list_aduan.dart';
import 'package:sibeluapp/repository/api_aduan_repository.dart';
import 'package:sibeluapp/screen/aduan/components/custom_button.dart';
import 'package:sibeluapp/screen/error/server_error.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class AduanAdminPage extends StatefulWidget {
  @override
  _AduanAdminPageState createState() => _AduanAdminPageState();
}

class _AduanAdminPageState extends State<AduanAdminPage> {
  final AduanAdminBloc _aduanAdminBloc = AduanAdminBloc(AduanAdminInitial());
  ApiAduanRepository apiAduanRepository = ApiAduanRepository();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  @override
  void initState() {
    _aduanAdminBloc.add(AduanAdminEvent());
    super.initState();
  }

  Widget _buildTitlePage(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          bottom: MediaQuery.of(context).size.height * 0.01),
      color: Colors.white,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/logo_list_aduan.jpg',
            width: MediaQuery.of(context).size.width * 0.08,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Text(
            'Admin Aduan',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String label,
    Color color,
    Color splashColor,
    Function onPressed,
  ) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.04,
      child: RaisedButton(
        splashColor: splashColor,
        color: color,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(label),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AduanAdminBloc>(
      create: (context) => _aduanAdminBloc,
      child: BlocConsumer<AduanAdminBloc, AduanAdminState>(
        listener: (context, state) {
          if (state is AduanAdminFailure) {
            String title = 'info';
            showDialog(
              context: context,
              builder: (context) {
                if (Platform.isIOS) {
                  return CupertinoAlertDialog(
                    title: Text(title),
                    content: Text(state.error),
                  );
                } else {
                  return AlertDialog(
                    title: Text(title),
                    content: Text(state.error),
                  );
                }
              },
            );
          }
        },
        builder: (context, state) {
          if (state is AduanAdminLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AduanAdminSuccess) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: ListView(
                children: [
                  _buildTitlePage(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.listAduan.result.length,
                    itemBuilder: (BuildContext context, int index) {
                      AduanBody aduan = state.listAduan.result[index];
                      return Container(
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffC6E1FF)),
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            AduanTiles(aduan),
                            // Positioned(
                            //   top: -15,
                            //   right: -15,
                            //   child: Icon(
                            //     Icons.check_circle,
                            //     size: 40,
                            //     color: Color(0xFF48A500),
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return ServerErrorPage();
          }
        },
      ),
    );
  }
}

class AduanTiles extends ListTile {
  AduanTiles(AduanBody aduan)
      : super(
          leading: CircleAvatar(
            backgroundColor: Colors.deepOrangeAccent,
            child: Text(aduan.email[0]),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                aduan.jenisAduan,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.yMMMMd()
                    .format(DateFormat('dd-MM-yyyy').parse(aduan.createdTime)),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          subtitle: Text(
            aduan.kronologi.substring(1, 15).trim() + '...',
          ),
          trailing: aduan.statusTL == 'SELESAI'
              ? Icon(
                  Icons.check_circle,
                  size: 40,
                  color: Color(0xFF48A500),
                )
              : Icon(
                  Icons.pending_rounded,
                  size: 40,
                  color: Color(0xFF48A500),
                ),
          onTap: () {
            print('click !');
          },
        );
}

// PopupMenuButton<WhyFarther>(
//                 onSelected: (WhyFarther result) {
//                   if (result == WhyFarther.harder) {
//                     print(result);
//                   }
//                   setState(() {
//                     _selection = result;
//                   });
//                 },
//                 itemBuilder: (BuildContext context) =>
//                     <PopupMenuEntry<WhyFarther>>[
//                   const PopupMenuItem<WhyFarther>(
//                     value: WhyFarther.harder,
//                     child: Text('Working a lot harder'),
//                   ),
//                   const PopupMenuItem<WhyFarther>(
//                     value: WhyFarther.smarter,
//                     child: Text('Being a lot smarter'),
//                   ),
//                   const PopupMenuItem<WhyFarther>(
//                     value: WhyFarther.selfStarter,
//                     child: Text('Being a self-starter'),
//                   ),
//                   const PopupMenuItem<WhyFarther>(
//                     value: WhyFarther.tradingCharter,
//                     child: Text('Placed in charge of trading charter'),
//                   ),
//                 ],
//               ),
