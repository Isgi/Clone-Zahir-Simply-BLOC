abstract class ContactsEvent {}

class FetchFirstPage extends ContactsEvent {}

class FetchNextPage extends ContactsEvent {
  final String nextUrl;
  FetchNextPage(this.nextUrl);
}