import 'package:kiwi/kiwi.dart';
import 'package:zahir_online_clone/resources/general_list_source.dart';
import 'package:zahir_online_clone/bloc/general_list_bloc.dart';

void initKiwi() {
  Container().registerFactory((c) => GeneralListSource());
  Container().registerFactory((c) => GeneralListBloc(c.resolve()));
}