library contacts_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:zahir_online_clone/models/contacts_model.dart';

part 'general_list_state.g.dart';

abstract class GeneralListState implements Built<GeneralListState, GeneralListStateBuilder> {

  BuiltList<Results> get results;
  int get count;
  @nullable
  bool get getPending;
  @nullable
  bool get loadmorePending;
  @nullable
  bool get searchPending;
  @nullable
  PageContext get page_context;
  @nullable
  Links get links;

  GeneralListState._();

  factory GeneralListState([updates(GeneralListStateBuilder b)]) = _$GeneralListState;

  factory GeneralListState.initial() {
    return GeneralListState((b) => b
      ..results.replace(BuiltList<Results>())
      ..count = 0
      ..page_context = null
      ..links = null
      ..getPending = false
      ..loadmorePending = false
    );
  }

  factory GeneralListState.success(contactsModel) {
    return GeneralListState((b) => b
      ..results.replace(contactsModel.results)
      ..links.replace(contactsModel.links)
      ..page_context.replace(contactsModel.page_context)
      ..count = contactsModel.count);
  }

  factory GeneralListState.getSuccess(contactsModel) {
    return GeneralListState((b) => b
      ..results.replace(contactsModel.results)
      ..links.replace(contactsModel.links)
      ..page_context.replace(contactsModel.page_context)
      ..count = contactsModel.count
      ..getPending = false
      ..searchPending = false);
  }

  factory GeneralListState.loadmoreSuccess(contactsModel, GeneralListState state) {
    return GeneralListState((b) => b
      ..results.replace(state.results + contactsModel.results)
      ..links.replace(contactsModel.links)
      ..page_context.replace(contactsModel.page_context)
      ..count = contactsModel.count
      ..loadmorePending = false);
  }
}

