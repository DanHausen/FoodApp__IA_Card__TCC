import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class SandwichPage extends StatefulWidget {
  @override
  _SandwichPageState createState() => _SandwichPageState();
}
class _SandwichPageState extends State<SandwichPage> {
  SearchBar searchBar;
  
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      toolbarHeight: 90,
      centerTitle: true,
      title: new Text('Lanches', 
            style: GoogleFonts.passionOne(
            fontStyle: FontStyle.normal,
            fontSize: 40
            )),
      actions: [searchBar.getSearchAction(context)],
      backgroundColor: Color.fromRGBO(255, 161, 73, 1),
    );
  }  

  _SandwichPageState() {
    searchBar = new SearchBar(
      inBar: false,
      setState: setState,
      onSubmitted: print,
      buildDefaultAppBar: buildAppBar
    );
  }

    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      body: _buildBody(),
    );
  }

  _buildBody() {
    
   return Align(
     alignment: Alignment.center,
      child: 
           Container(
       padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Em construção', 
            style: GoogleFonts.metrophobic(
            fontStyle: FontStyle.normal,
            fontSize: 25
            )
          ),
        ],
      ),
        ),
    );
  }
  }