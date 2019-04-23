// GENERATED CODE - DO NOT MODIFY BY HAND

part of contacts_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ContactsState extends ContactsState {
  @override
  final BuiltList<Results> results;
  @override
  final int count;
  @override
  final PageContext page_context;
  @override
  final Links links;

  factory _$ContactsState([void updates(ContactsStateBuilder b)]) =>
      (new ContactsStateBuilder()..update(updates)).build();

  _$ContactsState._({this.results, this.count, this.page_context, this.links})
      : super._() {
    if (results == null) {
      throw new BuiltValueNullFieldError('ContactsState', 'results');
    }
    if (count == null) {
      throw new BuiltValueNullFieldError('ContactsState', 'count');
    }
  }

  @override
  ContactsState rebuild(void updates(ContactsStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactsStateBuilder toBuilder() => new ContactsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactsState &&
        results == other.results &&
        count == other.count &&
        page_context == other.page_context &&
        links == other.links;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, results.hashCode), count.hashCode),
            page_context.hashCode),
        links.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContactsState')
          ..add('results', results)
          ..add('count', count)
          ..add('page_context', page_context)
          ..add('links', links))
        .toString();
  }
}

class ContactsStateBuilder
    implements Builder<ContactsState, ContactsStateBuilder> {
  _$ContactsState _$v;

  ListBuilder<Results> _results;
  ListBuilder<Results> get results =>
      _$this._results ??= new ListBuilder<Results>();
  set results(ListBuilder<Results> results) => _$this._results = results;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  PageContextBuilder _page_context;
  PageContextBuilder get page_context =>
      _$this._page_context ??= new PageContextBuilder();
  set page_context(PageContextBuilder page_context) =>
      _$this._page_context = page_context;

  LinksBuilder _links;
  LinksBuilder get links => _$this._links ??= new LinksBuilder();
  set links(LinksBuilder links) => _$this._links = links;

  ContactsStateBuilder();

  ContactsStateBuilder get _$this {
    if (_$v != null) {
      _results = _$v.results?.toBuilder();
      _count = _$v.count;
      _page_context = _$v.page_context?.toBuilder();
      _links = _$v.links?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactsState;
  }

  @override
  void update(void updates(ContactsStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactsState build() {
    _$ContactsState _$result;
    try {
      _$result = _$v ??
          new _$ContactsState._(
              results: results.build(),
              count: count,
              page_context: _page_context?.build(),
              links: _links?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        results.build();

        _$failedField = 'page_context';
        _page_context?.build();
        _$failedField = 'links';
        _links?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ContactsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
