import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sibeluapp/widget/widget_card_loading.dart';

import 'components/custom_button.dart';

class AduanPage extends StatefulWidget {
  @override
  _AduanPageState createState() => _AduanPageState();
}

class _AduanPageState extends State<AduanPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(),
      body: Container(
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
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                CustomButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      // Scaffold.of(context).showSnackBar(
                      //     SnackBar(content: Text('Processing Data')));
                      return WidgetCardLoading();
                    }
                    // Navigator.pushNamed(context, '/aduan-page');
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
