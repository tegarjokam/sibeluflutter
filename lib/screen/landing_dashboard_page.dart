import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibeluapp/bloc/dashboard/dashboard_user_bloc.dart';
import 'package:sibeluapp/models/user_model.dart';
import 'package:sibeluapp/screen/dashboard_page.dart';
import 'package:sibeluapp/screen/dashboard_page_2.dart';
import 'package:sibeluapp/widget/profile_image.dart';

class LandingDashboardPage extends StatefulWidget {
  @override
  _LandingDashboardPageState createState() => _LandingDashboardPageState();
}

class _LandingDashboardPageState extends State<LandingDashboardPage> {
  final DashboardUserBloc _dashboardUserBloc =
      DashboardUserBloc(DashboardUserInitial());
  @override
  void initState() {
    _dashboardUserBloc.add(DashboardUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<DashboardUserBloc>(
        create: (ctx) => _dashboardUserBloc,
        child: BlocListener<DashboardUserBloc, DashboardUserState>(
          listener: (context, state) {
            if (state is DashboardUserFailure) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
              ));
            }
          },
          child: BlocBuilder<DashboardUserBloc, DashboardUserState>(
            builder: (context, state) {
              if (state is DashboardUserLoading) {
                return CircularProgressIndicator();
              } else if (state is DashboardUserSuccess) {
                User user = state.users;
                return GestureDetector(
                  onVerticalDragUpdate: (_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return DashboardPage(
                            user: user,
                          );
                        },
                      ),
                    );
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Selamat Datang',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Hero(
                            tag: 'profileImage',
                            child: ProfileImage(
                              imageUrl: user.imageUrl,
                              width: 210.0,
                              height: 210.0,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${user.fullName}',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'Pelaksana Pemeriksa',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Kantor Wilayah DJBC Maluku',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),

      // bottomNavigationBar: GestureDetector(
      //   onTapUp: (a) {
      //     print(a.globalPosition);
      //   },
      // ),
    );
  }
}
