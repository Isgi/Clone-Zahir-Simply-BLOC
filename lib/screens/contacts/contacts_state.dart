library contacts_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:zahir_online_clone/models/contacts_model.dart';
part 'contacts_state.g.dart';

abstract class ContactsState implements Built<ContactsState, ContactsStateBuilder> {
  BuiltList<Results> get results;
  int get count;
  @nullable
  PageContext get page_context;
  @nullable
  Links get links;

  ContactsState._();

  factory ContactsState([updates(ContactsStateBuilder b)]) = _$ContactsState;

  factory ContactsState.initial() {
    return ContactsState((b) => b
      ..results.replace(BuiltList<Results>())
      ..count = 0
      ..page_context = null
      ..links = null);
  }

  factory ContactsState.success(ContactsModel contactsModel) {
    return ContactsState((b) => b
      ..results.replace(contactsModel.results)
      ..links.replace(contactsModel.links)
      ..page_context.replace(contactsModel.page_context)
      ..count = contactsModel.count);
  }
}