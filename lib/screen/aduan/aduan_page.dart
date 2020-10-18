import 'package:flutter/material.dart';

import 'components/custom_button.dart';

class AduanPage extends StatefulWidget {
  @override
  _AduanPageState createState() => _AduanPageState();
}

class _AduanPageState extends State<AduanPage> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                InkWell(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020, 1),
                      lastDate: DateTime(2100),
                    ); // Call Function that has showDatePicker()
                  },
                  child: IgnorePointer(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Tanggal'),
                      onChanged: (value) {
                        // print(value);
                        selectedDate = DateTime.parse(value);
                        print('date dari onChanged = $selectedDate');
                      },
                      onSaved: (val) {
                        print(val);
                        selectedDate = DateTime.parse(val);
                        print('date dari onSaved = $selectedDate');
                      },
                      onEditingComplete: () {
                        // date = DateTime.parse();
                        print('date dari onChanged = $selectedDate');
                      },
                    ),
                  ),
                ),
                DropdownButtonFormField(
                  dropdownColor: Colors.white,
                  items: [
                    DropdownMenuItem(
                      child: Text('Korupsi'),
                      value: 'Korupsi',
                    ),
                    DropdownMenuItem(
                      child: Text('Gratifikasi'),
                      value: 'Gratifikasi',
                    ),
                    DropdownMenuItem(
                      child: Text('Disiplin'),
                      value: 'Disiplin',
                    )
                  ],
                  onChanged: (value) {},
                  decoration: InputDecoration(labelText: 'Jenis Aduan'),
                ),
                TextFormField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    labelText: 'Kronologi',
                  ),
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
