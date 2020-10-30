import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibeluapp/bloc/aduan/aduan_roles_bloc.dart';
import 'package:sibeluapp/repository/api_aduan_repository.dart';
import 'package:sibeluapp/screen/aduan/aduan_admin.dart';
import 'package:sibeluapp/screen/aduan/aduan_page.dart';
import 'package:sibeluapp/screen/aduan/my_aduan.dart';
import 'package:sibeluapp/screen/error/server_error.dart';

import 'components/custom_button.dart';

class LandingAduanPage extends StatefulWidget {
  @override
  _LandingAduanPageState createState() => _LandingAduanPageState();
}

class _LandingAduanPageState extends State<LandingAduanPage> {
  final AduanRolesBloc _aduanRolesBloc = AduanRolesBloc(AduanRolesInitial());
  ApiAduanRepository apiAduanRepository = ApiAduanRepository();
  int bottomSelectIndex = 0;

  @override
  void initState() {
    _aduanRolesBloc.add(AduanRolesEvent());
    super.initState();
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems(String typePage) {
    if (typePage == 'ROLE_ADMIN') {
      return [
        BottomNavigationBarItem(
          label: 'Laporkan',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Admin',
          icon: Icon(Icons.admin_panel_settings_outlined),
        ),
        BottomNavigationBarItem(
          label: 'My Aduan',
          icon: Icon(Icons.list),
        ),
      ];
    } else {
      return [
        BottomNavigationBarItem(
          label: 'Laporkan',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'My Aduan',
          icon: Icon(Icons.list),
        ),
      ];
    }
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      bottomSelectIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectIndex = index;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AduanRolesBloc>(
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
              return Scaffold(
                appBar: buildAppBar(),
                bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Colors.amber,
                  currentIndex: bottomSelectIndex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) {
                    bottomTapped(index);
                  },
                  items: buildBottomNavBarItems('ROLE_ADMIN'),
                ),
                body: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    pageChanged(index);
                  },
                  children: [
                    MainAduanLandingPage(),
                    AduanAdminPage(),
                    MyAduanPage(),
                  ],
                ),
              );
            } else {
              return Scaffold(
                // appBar: buildAppBar(),
                bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Colors.amber,
                  currentIndex: bottomSelectIndex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) {
                    bottomTapped(index);
                  },
                  items: buildBottomNavBarItems('ROLE_ADMIN'),
                ),
                body: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    pageChanged(index);
                  },
                  children: [
                    MainAduanLandingPage(),
                    MyAduanPage(),
                  ],
                ),
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
                return Scaffold(
                  // appBar: buildAppBar(),
                  bottomNavigationBar: BottomNavigationBar(
                    selectedItemColor: Colors.amber,
                    currentIndex: bottomSelectIndex,
                    type: BottomNavigationBarType.fixed,
                    onTap: (index) {
                      bottomTapped(index);
                    },
                    items: buildBottomNavBarItems('ROLE_ADMIN'),
                  ),
                  body: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      pageChanged(index);
                    },
                    children: [
                      MainAduanLandingPage(),
                      AduanAdminPage(),
                      MyAduanPage(),
                    ],
                  ),
                );
              } else {
                return Scaffold(
                  appBar: buildAppBar(),
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: bottomSelectIndex,
                    type: BottomNavigationBarType.fixed,
                    onTap: (index) {
                      bottomTapped(index);
                    },
                    items: buildBottomNavBarItems('NOT_ADMIN'),
                  ),
                  body: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      pageChanged(index);
                    },
                    children: [
                      MainAduanLandingPage(),
                      MyAduanPage(),
                    ],
                  ),
                );
              }
            } else {
              return ServerErrorPage();
            }
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Title(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle_sharp),
            SizedBox(
              width: 10,
            ),
            Text('SIBeLu.'),
          ],
        ),
      ),
    );
  }
}

class MainAduanLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 30, right: 30),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              height: MediaQuery.of(context).size.height * 0.2,
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
}
