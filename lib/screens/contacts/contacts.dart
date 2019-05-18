import 'package:flutter/material.dart';

import 'package:zahir_online_clone/decorations/general_list.dart';
import 'package:zahir_online_clone/util/modules.dart';


class Contacts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new GeneralList(
      module: contacts
    );
  }
}