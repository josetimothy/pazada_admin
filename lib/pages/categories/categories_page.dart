import 'dart:math';

import 'package:ecommerce_admin_tut/provider/tables.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/ResponsiveDatatable.dart';
import 'package:responsive_table/responsive_table.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    final TablesProvider tablesProvider = Provider.of<TablesProvider>(context);
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
          PageHeader(
            text: 'Categories',
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
                      SizedBox(width: 10,),
                      RaisedButton.icon(
                          color: Colors.red,
                          onPressed: () {},
                          icon: Icon(Icons.delete,color: Colors.white,),
                          label: Text("Delete", style: TextStyle(color: Colors.white))),
                    ]),
                // actions: [
                //   if (tablesProvider.isSearch)
                //     Expanded(
                //         child: TextField(
                //       decoration: InputDecoration(
                //           prefixIcon: IconButton(
                //               icon: Icon(Icons.cancel),
                //               onPressed: () {
                //                 setState(() {
                //                   tablesProvider.isSearch = false;
                //                 });
                //               }),
                //           suffixIcon: IconButton(
                //               icon: Icon(Icons.search), onPressed: () {})),
                //     )),
                //   if (!tablesProvider.isSearch)
                //     IconButton(
                //         icon: Icon(Icons.search),
                //         onPressed: () {
                //           setState(() {
                //             tablesProvider.isSearch = true;
                //           });
                //         })
                // ],
                headers: tablesProvider.categoriesTableHeader,
                source: tablesProvider.categoriesTableSource,
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
                onSelectAll: tablesProvider.onSelectAllcat,
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
