import 'package:rxdart/rxdart.dart';
import 'dart:async';

import 'package:zahir_online_clone/models/contacts_model.dart';
import 'package:zahir_online_clone/screens/contacts/contacts_state.dart';
import 'package:zahir_online_clone/resources/contacts_data_source.dart';

const int pageSize = 10;

class ContactsBloc {

  final ContactsDataSource _contactsDataSource;

  ///
  /// PublishSubject emit object when reach max items
  ///
  final _loadAllController = PublishSubject<void>();

  ///
  /// BehaviorSubject of errors, emit null when have no error
  ///
  final _errorController = BehaviorSubject<Object>(seedValue: null, sync: true);
  ValueObservable<Object> _errorNullable$;
  Stream<Object> _errorNotNull$; // stream of errors exposed to UI

  ///
  /// BehaviorSubject and Stream handle first page is loading
  ///
  final _isLoadingFirstPageController = BehaviorSubject<bool>(seedValue: false, sync: true);
  ValueObservable<bool> _isLoadingFirstPage$;

  ///
  /// PublishSubject handle load first page intent
  ///
  final _loadFirstPageController = PublishSubject<void>();

  ///
  /// PublishSubject handle load more intent
  ///
  final _loadMoreController = PublishSubject<void>();

  ///
  /// Stream of states
  ///
  ValueConnectableObservable<ContactsState> _contacts$;
  StreamSubscription<ContactsState> _streamSubscription;

  ///
  /// Sinks
  ///
  Sink<void> get loadMore => _loadMoreController.sink;

  Sink<void> get loadFirstPage => _loadFirstPageController.sink;

  ///
  /// Streams
  ///
  Stream<ContactsState> get contacts => _contacts$;

  Stream<void> get loadedAllContacts => _loadAllController.stream;

  Stream<Object> get error => _errorNotNull$;

  ContactsBloc(this._contactsDataSource) : assert(_contactsDataSource != null) {
    _errorNullable$ = _errorController;
    _errorNotNull$ = _errorController.where((error) => error != null);
    _isLoadingFirstPage$ = _isLoadingFirstPageController.stream;

    final Observable<ContactsState> loadMore = _loadMoreController
    .throttle(Duration(milliseconds: 500))
    .doOnData((_) => print('_loaddMoreController emitted...'))
    .where((_) {
      final error = _errorNullable$.value;
      final isLoadingFirstPage = _isLoadingFirstPage$.value;
      return !isLoadingFirstPage && error == null;
    })
    .doOnData((_) => print('Load more emitted...'))
    .map((_) => false)
    .exhaustMap(_loadMoreData)
    .doOnData(
      (data) => print('after exhaustMap onNext = $data'),
    ); // use exhaustMap operator, to ignore all value source emit, while loading data from api,

    final Observable<ContactsState> loadFirstPage = _loadFirstPageController
    .doOnData((_) => print('Load first page emitted...'))
    .map((_) => true)
    .flatMap(_loadMoreData)
    .doOnData((data) => print('after flatMap onNext = $data'));

    final Observable<Observable<ContactsState>> streams = Observable.merge([
      loadFirstPage,
      loadMore,
    ]).map((state) => Observable.just(state));

    _contacts$ = Observable.switchLatest(streams)
    .distinct()
    .doOnData((state) => print('state = $state'))
    .publishValue(seedValue: ContactsState.initial());

    _streamSubscription = _contacts$.connect();

  }

  Future<void> refresh() async {
    print('Refresh start');

    _isLoadingFirstPageController.add(true);
    _loadFirstPageController.add(null);
    await _isLoadingFirstPage$.firstWhere((b) => !b);

    print('Refresh done');
  }

  Stream<ContactsState> _loadMoreData(bool loadFirstPage) async* {
    if (loadFirstPage) {
      _isLoadingFirstPageController.add(true);
    }

    // get latest state
    final latestState = _contacts$.value;
    print(
      '_loadMoreData loadFirstPage = $loadFirstPage, latestState = $latestState',
    );

    final currentList = latestState.contacts;
    // emit loading state
    yield latestState.copyWith(isLoading: true);

    try {
      final page = await _contactsDataSource.getContacts(
        limit: pageSize,
        field: 'name',
        startAfter: loadFirstPage
          ? null
          : null,
      );

      if (page.isEmpty) {
        // if page is empty, emit all paged loaded
        _loadAllController.add(null);
      }

      // if fetch success, emit null
      _errorController.add(null);

      final contacts = ContactsModel();
      if (!loadFirstPage) {
        // if not load first page, append current list
//        contacts.
      }
//      contacts.toBuilder(page);

      // emit list state
//      yield latestState.copyWith(
//        isLoading: false,
//        error: null,
//        contacts: contacts,
//      );
    } catch (e) {
      // if error was occurred, emit error
      _errorController.add(e);

      yield latestState.copyWith(
        isLoading: false,
        error: e,
      );
    } finally {
      if (loadFirstPage) {
        _isLoadingFirstPageController.add(false);
      }
    }
  }

  dispose() async {
    await _streamSubscription.cancel();
    await Future.wait([
      _loadAllController.close(),
      _loadMoreController.close(),
      _loadFirstPageController.close(),
      _errorController.close(),
      _isLoadingFirstPageController.close(),
    ]);
  }

}