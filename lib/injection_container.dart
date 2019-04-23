import 'package:kiwi/kiwi.dart';
import 'package:zahir_online_clone/resources/contacts_data_source.dart';
import 'package:zahir_online_clone/bloc/contacts_bloc.dart';

void initKiwi() {
  Container().registerFactory((c) => ContactsDataSource());
  Container().registerFactory((c) => ContactsBloc(c.resolve()));
}