import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

import 'package:zahir_online_clone/models/contacts_model.dart';

part 'serializers.g.dart';

/// Collection of generated serializers for the built_value chat example.
@SerializersFor([ContactsModel, Results, Links, PageContext])
final Serializers serializers = _$serializers;