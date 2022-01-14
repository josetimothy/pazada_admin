import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/global/global.dart';
import 'package:ecommerce_admin_tut/helpers/enumerators.dart';
import 'package:ecommerce_admin_tut/provider/app_provider.dart';
import 'package:ecommerce_admin_tut/provider/tables.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/services/navigation_service.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/ResponsiveDatatable.dart';
import 'package:responsive_table/responsive_table.dart';

import '../../locator.dart';

class PazaheroPage extends StatefulWidget {
  @override
  _PazaheroPageState createState() => _PazaheroPageState();
}

class _PazaheroPageState extends State<PazaheroPage> {
  @override
  void dispose() {
    super.dispose();
  }
  List pazahero = ["All Pazahero", "Active","DeActivated"];
  String pazaheroType;


  TextEditingController usertypeTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    final TablesProvider tablesProvider = Provider.of<TablesProvider>(context);
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              PageHeader(
                text: 'Pazaheros',
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints(
                  maxHeight: 700,
                ),
                child: Card(
                  elevation: 1,
                  shadowColor: Colors.black,
                  clipBehavior: Clip.none,
                  child: ResponsiveDatatable(
                    title: Row(
                        children:[
                          RaisedButton.icon(
                              color: Colors.green,
                              onPressed: () {
                                Map<String, dynamic> userData =
                                {
                                  "status": "approved",
                                };
                                FirebaseFirestore.instance.collection("PazadaUsers")
                                    .doc(id)
                                    .update(userData).then((value)
                                {
                                  print("Account Activated successfully.");
                                  appProvider.changeCurrentPage(DisplayedPage.PAZAHERO);
                                  locator<NavigationService>().navigateTo(PazaheroRoute);
                                  tablesProvider.initData();
                                });
                              },
                              icon: Icon(Icons.check_circle_outline,color: Colors.white,),
                              label: Text("Activate",style: TextStyle(color: Colors.white))),
                          SizedBox(width: 10,),
                          RaisedButton.icon(
                              color: Colors.red,
                              onPressed: () {
                                Map<String, dynamic> userData =
                                {
                                  "status": "not approved",
                                };
                                FirebaseFirestore.instance.collection("PazadaUsers")
                                    .doc(id)
                                    .update(userData).then((value)
                                {

                                  print("Account Blocked successfully.");
                                  appProvider.changeCurrentPage(DisplayedPage.PAZAHERO);
                                  locator<NavigationService>().navigateTo(PazaheroRoute);
                                  tablesProvider.initData();

                                });
                              },
                              icon: Icon(Icons.remove_circle_outline,color: Colors.white,),
                              label: Text("DeActivate", style: TextStyle(color: Colors.white))),
                          SizedBox(width: 10,),

                          Container(//dropdown
                            height: 33,
                            width: MediaQuery.of(context).size.width * .10,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5),

                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:0, ),
                              child: DropdownButton(

                                underline: SizedBox(),
                                isExpanded: true,
                                icon: Icon(Icons.arrow_drop_down, size: 25,),
                                hint: Text("See User",style: TextStyle(fontSize: 12, fontFamily: "bolt"),textAlign: TextAlign.center, ),
                                value: pazaheroType,
                                onChanged:(userValue){
                                  setState(() {
                                    pazaheroType = userValue;
                                    usertypeTextEditingController.text = pazaheroType;
                                  });
                                },
                                items: pazahero.map((pazaheroItem){
                                  return DropdownMenuItem(

                                    value: pazaheroItem,
                                    child: Text(pazaheroItem,style: TextStyle(fontSize: 12, fontFamily: "bolt"),textAlign: TextAlign.center,),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),

                        ]),

                    // Container(
                    //   width: MediaQuery.of(context).size.width * .86,
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey[200],
                    //     borderRadius: BorderRadius.circular(5),
                    //
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal:10, ),
                    //     child: DropdownButton(
                    //
                    //       underline: SizedBox(),
                    //       isExpanded: true,
                    //       icon: Icon(Icons.arrow_drop_down_circle_outlined),
                    //       hint: Text("Select Vehicle Type",style: TextStyle(fontSize: 15, fontFamily: "bolt"),textAlign: TextAlign.center, ),
                    //       value: vehicleType,
                    //       onChanged:(vehicleValue){
                    //         setState(() {
                    //           vehicleType = vehicleValue;
                    //           vehicletypeTextEditingController.text = vehicleType;
                    //         });
                    //       },
                    //       items: vehicle.map((vehicleItem){
                    //         return DropdownMenuItem(
                    //
                    //           value: vehicleItem,
                    //           child: Text(vehicleItem,style: TextStyle(fontSize: 15, fontFamily: "bolt"),textAlign: TextAlign.center,),
                    //         );
                    //       }).toList(),
                    //     ),
                    //   ),
                    // ),
                    // actions: [
                    //   if (tablesProvider.isSearch)
                    //     Expanded(
                    //         child: TextField(
                    //           decoration: InputDecoration(
                    //               prefixIcon: IconButton(
                    //                   icon: Icon(Icons.cancel),
                    //                   onPressed: () {
                    //                     setState(() {
                    //                       tablesProvider.isSearch = false;
                    //                     });
                    //                   }),
                    //               suffixIcon: IconButton(
                    //                   icon: Icon(Icons.search), onPressed: () {})),
                    //         )),
                    //   if (!tablesProvider.isSearch)
                    //     IconButton(
                    //         icon: Icon(Icons.search),
                    //         onPressed: () {
                    //           setState(() {
                    //             tablesProvider.isSearch = true;
                    //           });
                    //         })
                    // ],
                    headers: tablesProvider.usersTableHeader,
                    source: tablesProvider.usersTableSource,
                    selecteds: tablesProvider.selecteds,
                    showSelect: tablesProvider.showSelect,
                    autoHeight: false,
                    onTabRow: (data) {
                      print(data);
                    },
                    onSort: tablesProvider.onSort,
                    sortAscending: tablesProvider.sortAscending,
                    sortColumn: tablesProvider.sortColumn,
                    isLoading: tablesProvider.isLoading,
                    onSelect: tablesProvider.onSelected,
                    onSelectAll: tablesProvider.onSelectAlluser,
                    footers: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("Rows per page:"),
                      ),
                      if (tablesProvider.perPages != null)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: DropdownButton(
                              value: tablesProvider.currentPerPage,
                              items: tablesProvider.perPages
                                  .map((e) => DropdownMenuItem(
                                child: Text("$e"),
                                value: e,
                              ))
                                  .toList(),
                              onChanged: (value) {}),
                        ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                            "${tablesProvider.currentPage} - ${tablesProvider.currentPage} of ${tablesProvider.total}"),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                        ),
                        onPressed: tablesProvider.previous,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios, size: 16),
                        onPressed: tablesProvider.next,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      )
                    ],
                  ),
                ),
              ),
            ]));
  }
}
