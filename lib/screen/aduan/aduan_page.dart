import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sibeluapp/bloc/aduan/aduan_bloc.dart';
import 'package:sibeluapp/injector/injector.dart';
import 'package:sibeluapp/models/aduan/aduan_body.dart';
import 'package:sibeluapp/repository/api_aduan_repository.dart';
import 'package:sibeluapp/repository/api_auth_repository.dart';
import 'package:sibeluapp/screen/aduan/utils/toast_utils.dart';
import 'package:sibeluapp/storage/sharedpreferences/shared_preferences_manager.dart';
import 'package:sibeluapp/widget/widget_card_loading.dart';

import 'components/custom_button.dart';

class AduanPage extends StatefulWidget {
  @override
  _AduanPageState createState() => _AduanPageState();
}

class _AduanPageState extends State<AduanPage> {
  final AduanBloc _aduanBloc = AduanBloc(AduanInitial());
  ApiAduanRepository apiAduanRepository = ApiAduanRepository();
  final _formKey = GlobalKey<FormState>();
  String _eventDate;
  String _jenisAduan;
  String _email;
  String _phoneNumber;
  String _chronology;
  DateTime dateInit = DateTime.now();

  TextEditingController dateCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController phoneNumberCtl = TextEditingController();

  Widget _buildEventDate() {
    String _formattedate = new DateFormat.yMMMMEEEEd().format(dateInit);
    return TextFormField(
      controller: dateCtl,
      decoration: InputDecoration(labelText: 'Date Event'),
      onTap: () async {
        FocusScope.of(context).requestFocus(new FocusNode());

        DateTime picked = await showDatePicker(
            context: context,
            initialDate: dateInit,
            firstDate: DateTime(2020),
            lastDate: DateTime(2100));
        dateCtl.text = _formattedate.toString();
        print('date : $dateInit');
        print('dateCtl : ${dateCtl.text}');
        if (picked != null && picked != dateInit) {
          setState(() {
            print('picked : ${picked.toLocal()}');
            print('before - date : $dateInit');
            dateInit = picked.toLocal();
            _eventDate = picked.toLocal().toString();
            dateCtl.text = picked.toLocal().toString();
            print('after - date : $dateInit');
          });
        }
      },
      validator: (value) {
        if (value.isEmpty) {
          return "can't be empty";
        }
        return null;
      },
    );
  }

  Widget _buildJenisAduan() {
    return DropdownButtonFormField(
      dropdownColor: Colors.white,
      items: [
        DropdownMenuItem(
          child: Text('Masalah Operasional'),
          value: 'OPERASIONAL',
        ),
        DropdownMenuItem(
          child: Text('Melanggar Tugas dan Fungsi'),
          value: 'TUSI',
        ),
        DropdownMenuItem(
          child: Text('Tindak Pidana'),
          value: 'PIDANA',
        ),
        DropdownMenuItem(
          child: Text('Fraud'),
          value: 'FRAUD',
        ),
        DropdownMenuItem(
          child: Text('Lainnya'),
          value: 'LAINNYA',
        )
      ],
      onSaved: (val) => _jenisAduan = val,
      onChanged: (val) {
        _jenisAduan = val;
        print('jenis aduan : $_jenisAduan');
      },
      decoration: InputDecoration(labelText: 'Kind of Aduan'),
      validator: (value) {
        if (value == null) {
          return "can't be empty";
        }
        return null;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: emailCtl,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      onSaved: (val) {
        _email = val;
        print('email : $_email');
      },
      onChanged: (val) {
        _email = val;
        print('email : $_email');
      },
      validator: (value) {
        if (value.isEmpty) {
          return "can't be empty";
        } else if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return "please fill the correct email";
        }
        return null;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      controller: phoneNumberCtl,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Phone number',
      ),
      onSaved: (val) => _phoneNumber = val,
      onChanged: (val) {
        _phoneNumber = val;
        print('phone number : $_phoneNumber');
      },
      validator: (value) {
        if (value.isEmpty) {
          return "can't be empty";
        } else if (value.length < 9) {
          return "invalid phone number";
        }
        return null;
      },
    );
  }

  Widget _buildChronology() {
    return TextFormField(
      maxLines: 10,
      decoration: InputDecoration(
        labelText: 'Chronology',
      ),
      onSaved: (val) => _chronology = val,
      onChanged: (val) {
        _chronology = val;
        print('chronology : $_chronology');
        print('length : ${_chronology.toString().length}');
      },
      validator: (value) {
        if (value.isEmpty) {
          return "can't be empty";
        }
        return null;
      },
    );
  }

  Widget _buildSuccesSend() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 40,
          height: 40,
          color: Colors.green[300],
          child: Icon(
            Icons.check_circle_outline,
            size: 30,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(),
      body: BlocProvider<AduanBloc>(
        create: (context) => _aduanBloc,
        child: BlocListener<AduanBloc, AduanState>(
          listener: (context, state) {
            if (state is AduanFailure) {
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
            } else if (state is AduanSuccess) {
              ToastSuccessAduan.showCustomToast(
                  context, "Aduan successful send!");
              return Navigator.pop(context);
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(top: 40, left: 30, right: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Hero(
                      tag: 'logo-aduan',
                      child: Image.asset(
                        'assets/img/logo_aduan.png',
                        height: 100,
                      ),
                    ),
                    Text(
                      'Pojok Aduan.',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text('Designed and developed by BCKanwilMaluku'),
                    SizedBox(height: 30),
                    _buildEmail(),
                    _buildPhoneNumber(),
                    _buildEventDate(),
                    _buildJenisAduan(),
                    _buildChronology(),
                    SizedBox(
                      height: 30,
                    ),
                    BlocBuilder<AduanBloc, AduanState>(
                      builder: (context, state) {
                        if (state is AduanLoading) {
                          return CircularProgressIndicator();
                        } else {
                          return CustomButton(onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _aduanBloc.add(AduanEvent(AduanBody(
                                email: _email,
                                phoneNumber: _phoneNumber,
                                jenisAduan: _jenisAduan,
                                eventDate: _eventDate,
                                kronologi: _chronology,
                              )));
                            }
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
