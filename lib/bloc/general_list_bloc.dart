import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:zahir_online_clone/models/contacts_model.dart';
import 'package:zahir_online_clone/resources/general_list_source.dart';
import 'package:zahir_online_clone/states/general_list_state.dart';
import 'package:zahir_online_clone/bloc/general_list_event.dart';
import 'package:zahir_online_clone/util/modules.dart';

class GeneralListBloc extends Bloc<GeneralListEvent, GeneralListState> {

  final GeneralListSource _generalListSource;
  final int perPage = 20;
  final String baseUrl = "https://apites2.zahironline.com";

  GeneralListBloc(this._generalListSource);

  void getList(Module module) {
    dispatch(GetGeneralList(module));
  }

  void searchList(Module module, String querySearch) {
    dispatch(SearchGeneralList(module, querySearch));
  }

  fromJson(Module module, Response response) {
    switch (module.model) {
      case ContactsModel:
        return ContactsModel.fromJson(json.decode(response.body));
      default:
        break;
    }
  }

  void loadmoreList(Module module, String nextUrl) {
    dispatch(LoadmoreGeneralList(module, nextUrl));
  }
  @override
  // TODO: implement initialState
  GeneralListState get initialState => GeneralListState.initial();

  @override
  Stream<GeneralListState> mapEventToState(GeneralListEvent event) async* {
    // TODO: implement mapEventToState
    if (event is GetGeneralList) {
      final String firstUrl = "$baseUrl/${event.module.endpoint}?per_page=$perPage";
      try {
        yield currentState.rebuild((b) => b..getPending = true);
        final response = await _generalListSource.getGeneralList(firstUrl);
        yield GeneralListState.getSuccess(fromJson(event.module, response));
      } catch(_) {
        print(_);
        yield currentState.rebuild((b) => b);
      }
    }

    if(event is SearchGeneralList) {
      final String searchUrl = "$baseUrl/${event.module.endpoint}?per_page=$perPage${event.querySearch}";
      try {
        yield currentState.rebuild((b) => b..searchPending = true);
        final response = await _generalListSource.getGeneralList(searchUrl);
        yield GeneralListState.getSuccess(fromJson(event.module, response));
      } catch(_) {
        yield currentState.rebuild((b) => b);
      }
    }

    if(event is LoadmoreGeneralList) {
      try {
        yield currentState.rebuild((b) => b..loadmorePending = true);
        final response = await _generalListSource.getGeneralList(event.nextUrl);
        yield GeneralListState.loadmoreSuccess(fromJson(event.module, response), currentState);
      } catch(_) {
        yield currentState.rebuild((b) => b);
      }
    }
  }
}