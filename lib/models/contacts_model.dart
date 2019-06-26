import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:zahir_online_clone/screens/contacts/serializers.dart';

part 'contacts_model.g.dart';

abstract class Links implements Built<Links, LinksBuilder> {

  @nullable
  String get next;

  @nullable
  String get previous;

  String get first;

  String get last;

  Links._();

  factory Links([updates(LinksBuilder b)]) = _$Links;

  static Serializer<Links> get serializer => _$linksSerializer;
}

abstract class Results implements Built<Results, ResultsBuilder> {

  String get id;

  String get code;

  String get name;

  @nullable
  bool get selected;

  set selected(bool selected) {
    selected = selected;
  }

  @nullable
  String get bussiness_id_number;

  @nullable
  String get tax_id_number;

  @nullable
  int get credit_limit;

  @nullable
  bool get is_customer;

  @nullable
  bool get is_supplier;

  @nullable
  bool get is_employee;

  @nullable
  bool get is_active;

//  Object get classification;
//
//  Object get default_currency;
//
//  Object get term_of_payment;

//  List<Object> get addresses;
//
//  List<Object> get phones;
//
//  List<Object> get emails;
//
//  List<Object> get contact_persons;
//
//  List<Object> get other_fields;
//
//  List<Object> get attachments;

  Results._();

  factory Results([updates(ResultsBuilder b)]) = _$Results;

  static Serializer<Results> get serializer => _$resultsSerializer;
}

abstract class PageContext implements Built<PageContext, PageContextBuilder> {
  int get page;
  int get per_page;
  int get total_pages;

  PageContext._();

  factory PageContext([updates(PageContextBuilder b)]) = _$PageContext;

  static Serializer<PageContext> get serializer => _$pageContextSerializer;
}

abstract class ContactsModel implements Built<ContactsModel, ContactsModelBuilder> {

  @nullable
  int get count;

  @nullable
  PageContext get page_context;

  @nullable
  Links get links;

  @nullable
  BuiltList<Results> get results;

  static Serializer<ContactsModel> get serializer => _$contactsModelSerializer;

  ContactsModel._();

  factory ContactsModel([updates(ContactsModelBuilder b)]) = _$ContactsModel;

  factory ContactsModel.fromJson(Map<String, dynamic> parsedJson) {
    final standardSerializers = (serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())).build();
    return standardSerializers.deserializeWith(ContactsModel.serializer, parsedJson);
  }

}
