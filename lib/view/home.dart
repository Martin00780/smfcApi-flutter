import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smsm/controller/services.dart';
import 'package:smsm/model/member.dart';
import 'package:http/http.dart' as http;

// class Page extends StatefulWidget {
//   @override
//   _PageState createState() => _PageState();
// }

// class _PageState extends State<Page> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("เลือก API ที่ต้องการ"),
//       ),
//       body: Container(),
//       bottomNavigationBar: BottomAppBar(
//         child: (
//           Bot
//         ),
//       ),

//     );
//   }
// }

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLoading = true;
  List<Members> members = [];
  var url1 =
      "https://wegivmerchantapp.firebaseapp.com/exam/bi-member-day-2020-04-01.json";
  var url2 =
      "https://wegivmerchantapp.firebaseapp.com/exam/bi-member-month-2020-03.json";
  var url3 =
      "https://wegivmerchantapp.firebaseapp.com/exam/bi-member-quarter-2019-06.json";
  var url4 =
      "https://wegivmerchantapp.firebaseapp.com/exam/bi-member-year-2019-04-01.json";

  var style1 = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  var style2 = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
  Future<Members> fetchUsers(String url) async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Members.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } catch (error) {
      return error;
    }
  }

  @override
  void initState() {
    setState(() {
      fetchUsers(url1).then((value) {
        setState(() {
          isLoading = false;
          members.clear();
          setState(() {
            members.add(value);
          });
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("SMILE"),
                      Text(
                        "SME",
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                    Column(
                      children: [
                        Text("MR_ADMIN"),
                        Text("HEAD QUATER"),
                      ],
                    )
                  ]),
                ],
              ),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                      child: Text(
                    "API",
                    style: TextStyle(
                        fontSize: 100,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  )),
                  ListTile(
                    title: Text(
                      "DAY VIEW",
                      style: TextStyle(fontSize: 32),
                    ),
                    onTap: () {
                      setState(() {
                        fetchUsers(url1).then((value) {
                          members.clear();
                          setState(() {
                            members.add(value);
                          });
                        });
                      });
                    },
                  ),
                  ListTile(
                    title: Text(
                      "MONTH VIEW",
                      style: TextStyle(color: Colors.deepOrange, fontSize: 32),
                    ),
                    onTap: () {
                      setState(() {
                        fetchUsers(url2).then((value) {
                          members.clear();
                          setState(() {
                            members.add(value);
                          });
                        });
                      });
                    },
                  ),
                  ListTile(
                    title: Text(
                      "QUARTER VIEW",
                      style: TextStyle(fontSize: 32),
                    ),
                    onTap: () {
                      setState(() {
                        fetchUsers(url3).then((value) {
                          members.clear();
                          setState(() {
                            members.add(value);
                          });
                        });
                      });
                    },
                  ),
                  ListTile(
                    title: Text(
                      "YEAR VIEW",
                      style: TextStyle(color: Colors.deepOrange, fontSize: 32),
                    ),
                    onTap: () {
                      setState(() {
                        fetchUsers(url4).then((value) {
                          members.clear();
                          setState(() {
                            members.add(value);
                          });
                        });
                      });
                    },
                  ),
                ],
              ),
            ),
            //////////////////////////////
            body: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            color: Colors.orange,
                          ),
                          Column(
                            children: [
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Total",
                                        style: style1,
                                      ),
                                      Text(
                                        "Members:",
                                        style: style2,
                                      )
                                    ],
                                  ),
                                  Text(
                                    "00",
                                    style: style2,
                                  )
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Total",
                                        style: style1,
                                      ),
                                      Text(
                                        "Rev.(THB):",
                                        style: style2,
                                      )
                                    ],
                                  ),
                                  Text(
                                    "API COUNT!",
                                    style: style2,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            color: Colors.grey,
                          ),
                          Column(
                            children: [
                              Center(
                                child: Text(
                                  "NAME",
                                  style: style2,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Total",
                                        style: style1,
                                      ),
                                      Text(
                                        "Members:",
                                        style: style2,
                                      )
                                    ],
                                  ),
                                  Text(
                                    "API COUNT!",
                                    style: style2,
                                  )
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Total",
                                        style: style1,
                                      ),
                                      Text(
                                        "Rev.(THB):",
                                        style: style2,
                                      )
                                    ],
                                  ),
                                  Text(
                                    "API COUNT!",
                                    style: style2,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: members[0].data.list.length != null
                              ? members[0].data.list.length
                              : 0,
                          itemBuilder: (context, index) {
                            return Text(
                                members[0].data.list[index].customername);
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: members[0].data.list.length != null
                              ? members[0].data.list.length
                              : 0,
                          itemBuilder: (context, index) {
                            return Text(
                                members[0].data.list[index].customerphone);
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: members[0].data.list.length != null
                              ? members[0].data.list.length
                              : 0,
                          itemBuilder: (context, index) {
                            return Text(
                                members[0].data.list[index].customertier);
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: members[0].data.list.length != null
                              ? members[0].data.list.length
                              : 0,
                          itemBuilder: (context, index) {
                            return Text(members[0]
                                .data
                                .list[index]
                                .totalamount
                                .toString());
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: members[0].data.list.length != null
                              ? members[0].data.list.length
                              : 0,
                          itemBuilder: (context, index) {
                            return Text(members[0]
                                .data
                                .list[index]
                                .totaltransaction
                                .toString());
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: members[0].data.list.length != null
                              ? members[0].data.list.length
                              : 0,
                          itemBuilder: (context, index) {
                            return Text(members[0]
                                .data
                                .list[index]
                                .remainingpoint
                                .toString());
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: members[0].data.list.length != null
                              ? members[0].data.list.length
                              : 0,
                          itemBuilder: (context, index) {
                            return Text(members[0]
                                .data
                                .list[index]
                                .remainingpoint
                                .toString());
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
