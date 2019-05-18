// GENERATED CODE - DO NOT MODIFY BY HAND

part of contacts_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeneralListState extends GeneralListState {
  @override
  final BuiltList<Results> results;
  @override
  final int count;
  @override
  final bool getPending;
  @override
  final bool loadmorePending;
  @override
  final bool searchPending;
  @override
  final PageContext page_context;
  @override
  final Links links;

  factory _$GeneralListState([void updates(GeneralListStateBuilder b)]) =>
      (new GeneralListStateBuilder()..update(updates)).build();

  _$GeneralListState._(
      {this.results,
      this.count,
      this.getPending,
      this.loadmorePending,
      this.searchPending,
      this.page_context,
      this.links})
      : super._() {
    if (results == null) {
      throw new BuiltValueNullFieldError('GeneralListState', 'results');
    }
    if (count == null) {
      throw new BuiltValueNullFieldError('GeneralListState', 'count');
    }
  }

  @override
  GeneralListState rebuild(void updates(GeneralListStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneralListStateBuilder toBuilder() =>
      new GeneralListStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeneralListState &&
        results == other.results &&
        count == other.count &&
        getPending == other.getPending &&
        loadmorePending == other.loadmorePending &&
        searchPending == other.searchPending &&
        page_context == other.page_context &&
        links == other.links;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, results.hashCode), count.hashCode),
                        getPending.hashCode),
                    loadmorePending.hashCode),
                searchPending.hashCode),
            page_context.hashCode),
        links.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GeneralListState')
          ..add('results', results)
          ..add('count', count)
          ..add('getPending', getPending)
          ..add('loadmorePending', loadmorePending)
          ..add('searchPending', searchPending)
          ..add('page_context', page_context)
          ..add('links', links))
        .toString();
  }
}

class GeneralListStateBuilder
    implements Builder<GeneralListState, GeneralListStateBuilder> {
  _$GeneralListState _$v;

  ListBuilder<Results> _results;
  ListBuilder<Results> get results =>
      _$this._results ??= new ListBuilder<Results>();
  set results(ListBuilder<Results> results) => _$this._results = results;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  bool _getPending;
  bool get getPending => _$this._getPending;
  set getPending(bool getPending) => _$this._getPending = getPending;

  bool _loadmorePending;
  bool get loadmorePending => _$this._loadmorePending;
  set loadmorePending(bool loadmorePending) =>
      _$this._loadmorePending = loadmorePending;

  bool _searchPending;
  bool get searchPending => _$this._searchPending;
  set searchPending(bool searchPending) =>
      _$this._searchPending = searchPending;

  PageContextBuilder _page_context;
  PageContextBuilder get page_context =>
      _$this._page_context ??= new PageContextBuilder();
  set page_context(PageContextBuilder page_context) =>
      _$this._page_context = page_context;

  LinksBuilder _links;
  LinksBuilder get links => _$this._links ??= new LinksBuilder();
  set links(LinksBuilder links) => _$this._links = links;

  GeneralListStateBuilder();

  GeneralListStateBuilder get _$this {
    if (_$v != null) {
      _results = _$v.results?.toBuilder();
      _count = _$v.count;
      _getPending = _$v.getPending;
      _loadmorePending = _$v.loadmorePending;
      _searchPending = _$v.searchPending;
      _page_context = _$v.page_context?.toBuilder();
      _links = _$v.links?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneralListState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GeneralListState;
  }

  @override
  void update(void updates(GeneralListStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GeneralListState build() {
    _$GeneralListState _$result;
    try {
      _$result = _$v ??
          new _$GeneralListState._(
              results: results.build(),
              count: count,
              getPending: getPending,
              loadmorePending: loadmorePending,
              searchPending: searchPending,
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
            'GeneralListState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
