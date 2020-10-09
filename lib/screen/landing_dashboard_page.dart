import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibeluapp/bloc/dashboard/dashboard_user_bloc.dart';
import 'package:sibeluapp/models/user_model.dart';

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

  Widget _imageBuilder(User user) {
    return Container(
      width: 210.0,
      height: 210.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.red),
        image: new DecorationImage(
          fit: BoxFit.fitHeight,
          image: new NetworkImage('${user.imageUrl}'),
        ),
      ),
    );
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
              print('${user.imageUrl}');
              return Center(
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
                    _imageBuilder(user),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${users.fullName}',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 20,
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
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    ));
  }
}
