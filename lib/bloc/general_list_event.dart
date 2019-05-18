import 'package:zahir_online_clone/util/modules.dart';

abstract class GeneralListEvent {}

class GetGeneralList extends GeneralListEvent {
  Module module;
  GetGeneralList(this.module);
}

class SearchGeneralList extends GeneralListEvent {
  String querySearch;
  Module module;
  SearchGeneralList(this.module, this.querySearch);
}

class LoadmoreGeneralList extends GeneralListEvent {
  String nextUrl;
  Module module;
  LoadmoreGeneralList(this.module, this.nextUrl);
}