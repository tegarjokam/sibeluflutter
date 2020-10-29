import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibeluapp/bloc/aduan/aduan_roles_bloc.dart';
import 'package:sibeluapp/repository/api_aduan_repository.dart';
import 'package:sibeluapp/screen/aduan/aduan_admin.dart';
import 'package:sibeluapp/screen/aduan/aduan_page.dart';

import 'components/custom_button.dart';

class LandingAduanPage extends StatefulWidget {
  @override
  _LandingAduanPageState createState() => _LandingAduanPageState();
}

class _LandingAduanPageState extends State<LandingAduanPage> {
  final AduanRolesBloc _aduanRolesBloc = AduanRolesBloc(AduanRolesInitial());
  ApiAduanRepository apiAduanRepository = ApiAduanRepository();

  @override
  void initState() {
    _aduanRolesBloc.add(AduanRolesEvent());
    super.initState();
  }

  Widget _buildLaporkan() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(top: 40, left: 30, right: 30),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            'Pojok Aduan.',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text('Designed and developed by BCKanwilMaluku'),
          SizedBox(
            height: 30,
          ),
          Hero(
            tag: 'logo-aduan',
            child: Image.asset(
              'assets/img/logo_aduan.png',
              height: 200,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Pojok Aduan adalah portal untuk melaporkan kejadian yang berkaitan dengan pelanggaran disiplin dan/atau kode etik yang dilakukan oleh pegawai Kantor Wilayah Direktorat Jenderal Bea dan Cukai Maluku',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, wordSpacing: 3),
          ),
          SizedBox(
            height: 30,
          ),
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, '/aduan-page');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: BlocProvider<AduanRolesBloc>(
          create: (context) => _aduanRolesBloc,
          child: BlocListener<AduanRolesBloc, AduanRolesState>(
            listener: (BuildContext context, state) {
              if (state is AduanRolesFailure) {
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
              } else if (state is AduanRolesSuccess) {
                print('SUKSES');
                print('ROLES BODY = ${state.rolesBody.roles}');
                print(
                    'APAKAH USER ADALAH ADMIN ? ${state.rolesBody.roles.contains('ROLE_ADMIN')}');
                if (state.rolesBody.roles.contains('ROLE_ADMIN')) {
                  return PageView(
                    children: [
                      MainLandingAduanPage(),
                      AduanAdminPage(),
                    ],
                  );
                } else {
                  return PageView(
                    children: [MainLandingAduanPage()],
                  );
                }
              }
            },
            child: BlocBuilder<AduanRolesBloc, AduanRolesState>(
              builder: (context, state) {
                if (state is AduanRolesLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is AduanRolesSuccess) {
                  if (state.rolesBody.roles.contains('ROLE_ADMIN')) {
                    return PageView(
                      children: [
                        _buildLaporkan(),
                        AduanAdminPage(),
                      ],
                    );
                  } else {
                    return PageView(
                      children: [_buildLaporkan()],
                    );
                  }
                }
              },
            ),
          ),
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
