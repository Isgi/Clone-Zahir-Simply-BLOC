import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:zahir_online_clone/models/serializers.dart';

part 'contacts_model.g.dart';

abstract class Links implements Built<Links, LinksBuilder> {

  String get next;

  String get previous;

  String get first;

  String get last;

  Links._();

  factory Links([updates(LinksBuilder b)]) = _$Links;
}

abstract class Result implements Built<Result, ResultBuilder> {

  String get id;

  String get code;

  String get name;

  String get bussiness_id_number;

  String get tax_id_number;

  int get credit_limit;

  bool get is_customer;

  bool get is_supplier;

  bool get is_employee;

  bool get is_active;

  Object get classification;

  Object get default_currency;

  Object get term_of_payment;

  List<Object> get addresses;

  List<Object> get phones;

  List<Object> get emails;

  List<Object> get contact_persons;

  List<Object> get other_fields;

  List<Object> get attachments;

  Result._();

  factory Result([updates(ResultBuilder b)]) = _$Result;
}

abstract class ContactsModel implements Built<ContactsModel, ContactsModelBuilder> {

  int get count;

  Object get page_context;

  Links get links;

  List<Result> get results;

  static Serializer<ContactsModel> get serializer => _$contactsModelSerializer;

  ContactsModel._();

  factory ContactsModel([updates(ContactsModelBuilder b)]) = _$ContactsModel;

  factory ContactsModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson);
    final standardSerializers = (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
    return standardSerializers.deserializeWith<ContactsModel>(ContactsModel.serializer, parsedJson);
  }

}