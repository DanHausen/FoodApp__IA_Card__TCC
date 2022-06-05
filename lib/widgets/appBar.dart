import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ia_card/constants.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key, this.textTitle, this.leading})
      : super(key: key);
  final String? textTitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      elevation: 1,
      centerTitle: true,
      leading: leading,
      title: Column(
        children: [
          Text(
            textTitle.toString(),
            style: GoogleFonts.passionOne(
                fontStyle: FontStyle.normal, fontSize: 40),
          ),
        ],
      ),
      backgroundColor: K_PRIMARY_COLOR_LIGHT,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
