import 'package:bloc/bloc.dart';
import 'package:zahir_online_clone/resources/contacts_data_source.dart';
import 'package:zahir_online_clone/screens/contacts/main.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {

  final ContactsDataSource _contactsDataSource;

  ContactsBloc(this._contactsDataSource);

  void getContacts() {
    dispatch(FetchFirstPage());
  }

  void loadmoreContacts(String nextUrl) {
    dispatch(FetchNextPage(nextUrl));
  }

  @override
  // TODO: implement initialState
  ContactsState get initialState => ContactsState.initial();

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchFirstPage) {
      try {
        final response = await _contactsDataSource.getContacts();
        yield ContactsState.success(response);
      } catch(_) {
        yield currentState.rebuild((b) => b);
      }
    }

    if(event is FetchNextPage) {
    }
  }
}