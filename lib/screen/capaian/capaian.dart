import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sibeluapp/screen/capaian/components/body.dart';
import 'package:sibeluapp/screen/capaian/components/status_capaian_section.dart';
import 'package:sibeluapp/screen/capaian/components/top_status_capaian_section.dart';
import 'package:sibeluapp/screen/capaian/components/tren_nko_section.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Capaian extends StatefulWidget {
  @override
  _CapaianState createState() => _CapaianState();
}

class _CapaianState extends State<Capaian> {
  final date = DateTime.now();
  final months = {
    "January": 1,
    "February": 2,
    "March": 3,
    "April": 4,
    "May": 5,
    "June": 6,
    "July": 7,
    "August": 8,
    "September": 9,
    "October": 10,
    "November": 11,
    "December": 12
  };
  final quarters = {
    "Triwulan 1": 1,
    "Triwulan 2": 2,
    "Triwulan 3": 3,
    "Triwulan 4": 4,
  };
  final semesters = {
    "Semester 1": 1,
    "Semester 2": 2,
  };
  List<TabCapaian> tabCapaian = [];
  List<Tab> tab = [];
  List<IsiTab> isiTab = [];
  DateRangePickerController _datePickerController;

  DateTime _startDate = DateTime(DateTime.now().year - 1, 01, 01);
  DateTime _endDate = DateTime.now();

  String _typeReport = "Bulanan";

  List<ListItem> _dropdownItems = [
    ListItem(1, "Bulanan"),
    ListItem(2, "Triwulanan"),
    ListItem(3, "Semesteran"),
    ListItem(4, "Tahunan")
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  @override
  void initState() {
    for (var i = 1; i <= date.month; i++) {
      for (var j in months.entries) {
        if (j.value == i) {
          tab.add(Tab(
            child: Text("${j.key} ${date.year} ",
                style: TextStyle(color: Colors.white)),
          ));
          print(j.key);
        }
      }
    }
    print("panjang tab = " + tab.length.toString());

    _datePickerController = DateRangePickerController();
    _datePickerController.selectedRange = PickerDateRange(_startDate, _endDate);

    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tab.length,
      initialIndex: tab.length - 1,
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
          child: FloatingActionButton(
            child: Icon(
              Icons.date_range,
              color: Colors.white,
            ),
            backgroundColor: Colors.amber,
            elevation: 10,
            onPressed: _filterBottomSheet,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: Body(
          isiTab: isiTab,
          tab: [...tab.map((data) => data).toList()],
        ),
      ),
    );
  }

  void _filterBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.65,
            child: Column(
              children: [
                SfDateRangePicker(
                  rangeSelectionColor: Colors.amber,
                  startRangeSelectionColor: Colors.amberAccent,
                  endRangeSelectionColor: Colors.amberAccent,
                  view: DateRangePickerView.decade,
                  selectionMode: DateRangePickerSelectionMode.range,
                  allowViewNavigation: false,
                  controller: _datePickerController,
                  maxDate: DateTime.now(),
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    if (args.value.endDate == null) {
                      _startDate = args.value.startDate;
                      _endDate = DateTime(args.value.startDate.year, 12, 01);
                    } else {
                      _startDate = args.value.startDate;
                      _endDate = args.value.endDate;
                    }
                  },
                ),
                Text("Periode"),
                BottomSheet(
                  backgroundColor: Colors.white,
                  onClosing: () {},
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                        builder: (BuildContext context, setState) {
                      return DropdownButton<ListItem>(
                          value: _selectedItem,
                          items: _dropdownMenuItems,
                          onChanged: (value) {
                            setState(() {
                              _typeReport = value.name;
                              return _selectedItem = value;
                            });
                          });
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Enter"),
                  onPressed: () {
                    print("===========");
                    print("START DATE = " + _startDate.toString());
                    print("END DATE   = " + _endDate.toString());
                    print("TYPE       = " + _typeReport);
                    print("===========");
                    _resetTabBar(_startDate, _endDate, _typeReport);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });
  }

  void _resetTabBar(DateTime startDate, DateTime endDate, String typeReport) {
    int selisihTahun = endDate.year - startDate.year + 1;
    tab.clear();
    if (typeReport.toLowerCase() == "bulanan") {
      for (var i = 0; i < selisihTahun; i++) {
        for (var month in months.entries) {
          setState(() {
            tab.add(Tab(
              child: Text("${month.key} ${startDate.year + i}",
                  style: TextStyle(color: Colors.white)),
            ));
          });
        }
      }
    } else if (typeReport.toLowerCase() == "triwulanan") {
      for (var i = 0; i < selisihTahun; i++) {
        for (var quarter in quarters.entries) {
          setState(() {
            tab.add(Tab(
              child: Text("${quarter.key} ${startDate.year + i}",
                  style: TextStyle(color: Colors.white)),
            ));
          });
        }
      }
    } else if (typeReport.toLowerCase() == "semesteran") {
      for (var i = 0; i < selisihTahun; i++) {
        for (var semester in semesters.entries) {
          setState(() {
            tab.add(Tab(
              child: Text("${semester.key} ${startDate.year + i}",
                  style: TextStyle(color: Colors.white)),
            ));
          });
        }
      }
    } else if (typeReport.toLowerCase() == "tahunan") {
      for (var i = 0; i < selisihTahun; i++) {
        setState(() {
          tab.add(Tab(
            child: Text("Tahun ${startDate.year + i}",
                style: TextStyle(color: Colors.white)),
          ));
        });
      }
    }
  }

  Column _buttomNavigationMenu() {
    return Column(children: [
      ListTile(
        title: Text("Bulanan"),
        onTap: () {
          setState(() {
            for (var i = 1; i <= date.month; i++) {
              for (var j in months.entries) {
                if (j.value == i) {
                  tab.add(Tab(
                    child: Text("${j.key} ${date.year} ",
                        style: TextStyle(color: Colors.white)),
                  ));
                  print(j.key);
                }
              }
            }
          });
        },
      ),
      ListTile(
        title: Text("Triwulan"),
        onTap: () {
          setState(() {
            tab.clear();
            tab = [
              Tab(
                child:
                    Text("Triwulan 1", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Triwulan 2", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Triwulan 3", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Triwulan 4", style: TextStyle(color: Colors.white)),
              ),
            ];
          });
        },
      ),
      ListTile(
        title: Text("Semesteran"),
        onTap: () {
          setState(() {
            tab = [
              Tab(
                child: Text("Senester 1 2019",
                    style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text("Senester 2 2019",
                    style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text("Senester 1 2020",
                    style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text("Semester 2 2020",
                    style: TextStyle(color: Colors.white)),
              )
            ];
          });
        },
      ),
      ListTile(
        title: Text("Tahunan"),
        onTap: () {
          setState(() {
            tab = [
              Tab(
                child:
                    Text("Tahun 2016", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Tahun 2017", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Tahun 2018", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Tahun 2019", style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child:
                    Text("Tahun 2020", style: TextStyle(color: Colors.white)),
              )
            ];
          });
        },
      )
    ]);
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('CAPAIAN KINERJA',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Colors.blue,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_sharp,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      bottom: TabBar(
        isScrollable: true,
        indicatorColor: Colors.amber,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 3,
        tabs: [
          ...tab.map((data) => data).toList(),
        ],
      ),
    );
  }
}

class FloatingActionButtonCapaian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      showBottomSheet(
          context: context,
          builder: (context) => Container(
                color: Colors.red,
              ));
    });
  }
}

class TabCapaian {
  DateTime startDate;
  DateTime endDate;
  DateTime idDate;
}

class IsiTab {
  TopStatusCapaianSection top;
  StatusCapaianSection middle;
  TrenNKOSection bottom;
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
