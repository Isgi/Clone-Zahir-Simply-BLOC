import 'dart:collection' show UnmodifiableListView;

import 'package:collection/collection.dart' show ListEquality;
import 'package:zahir_online_clone/models/contacts_model.dart';
import 'package:meta/meta.dart';

@immutable
class ContactsState {
  final ContactsModel contacts;
  final bool isLoading;
  final Object error;

  const ContactsState({
    @required this.contacts,
    @required this.isLoading,
    @required this.error,
  });

  factory ContactsState.initial() =>
      ContactsState(
        isLoading: false,
        contacts: null,
        error: null,
      );

  ContactsState copyWith({
    List<ContactsModel> contacts,
    bool isLoading,
    Object error,
  }) =>
      ContactsState(
        error: error,
        contacts: contacts != null ? contacts : this.contacts,
        isLoading: isLoading ?? this.isLoading,
      );

//  @override
//  bool operator ==(Object other) =>
//      identical(this, other) ||
//          other is ContactsState &&
//              runtimeType == other.runtimeType &&
//              const ListEquality().equals(contacts, other.contacts) &&
//              isLoading == other.isLoading;

  @override
  int get hashCode => contacts.hashCode ^ isLoading.hashCode;

  @override
  String toString() =>
      'ContactsState(people.length=${contacts.results
          .length}, isLoading=$isLoading, error=$error)';
}