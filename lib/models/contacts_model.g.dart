// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Links> _$linksSerializer = new _$LinksSerializer();
Serializer<Results> _$resultsSerializer = new _$ResultsSerializer();
Serializer<PageContext> _$pageContextSerializer = new _$PageContextSerializer();
Serializer<ContactsModel> _$contactsModelSerializer =
    new _$ContactsModelSerializer();

class _$LinksSerializer implements StructuredSerializer<Links> {
  @override
  final Iterable<Type> types = const [Links, _$Links];
  @override
  final String wireName = 'Links';

  @override
  Iterable serialize(Serializers serializers, Links object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'next',
      serializers.serialize(object.next, specifiedType: const FullType(String)),
      'first',
      serializers.serialize(object.first,
          specifiedType: const FullType(String)),
      'last',
      serializers.serialize(object.last, specifiedType: const FullType(String)),
    ];
    if (object.previous != null) {
      result
        ..add('previous')
        ..add(serializers.serialize(object.previous,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Links deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinksBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'next':
          result.next = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'previous':
          result.previous = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last':
          result.last = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ResultsSerializer implements StructuredSerializer<Results> {
  @override
  final Iterable<Type> types = const [Results, _$Results];
  @override
  final String wireName = 'Results';

  @override
  Iterable serialize(Serializers serializers, Results object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    if (object.bussiness_id_number != null) {
      result
        ..add('bussiness_id_number')
        ..add(serializers.serialize(object.bussiness_id_number,
            specifiedType: const FullType(String)));
    }
    if (object.tax_id_number != null) {
      result
        ..add('tax_id_number')
        ..add(serializers.serialize(object.tax_id_number,
            specifiedType: const FullType(String)));
    }
    if (object.credit_limit != null) {
      result
        ..add('credit_limit')
        ..add(serializers.serialize(object.credit_limit,
            specifiedType: const FullType(int)));
    }
    if (object.is_customer != null) {
      result
        ..add('is_customer')
        ..add(serializers.serialize(object.is_customer,
            specifiedType: const FullType(bool)));
    }
    if (object.is_supplier != null) {
      result
        ..add('is_supplier')
        ..add(serializers.serialize(object.is_supplier,
            specifiedType: const FullType(bool)));
    }
    if (object.is_employee != null) {
      result
        ..add('is_employee')
        ..add(serializers.serialize(object.is_employee,
            specifiedType: const FullType(bool)));
    }
    if (object.is_active != null) {
      result
        ..add('is_active')
        ..add(serializers.serialize(object.is_active,
            specifiedType: const FullType(bool)));
    }

    return result;
  }

  @override
  Results deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResultsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bussiness_id_number':
          result.bussiness_id_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tax_id_number':
          result.tax_id_number = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'credit_limit':
          result.credit_limit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'is_customer':
          result.is_customer = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_supplier':
          result.is_supplier = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_employee':
          result.is_employee = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'is_active':
          result.is_active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PageContextSerializer implements StructuredSerializer<PageContext> {
  @override
  final Iterable<Type> types = const [PageContext, _$PageContext];
  @override
  final String wireName = 'PageContext';

  @override
  Iterable serialize(Serializers serializers, PageContext object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'per_page',
      serializers.serialize(object.per_page,
          specifiedType: const FullType(int)),
      'total_pages',
      serializers.serialize(object.total_pages,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  PageContext deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PageContextBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'per_page':
          result.per_page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_pages':
          result.total_pages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ContactsModelSerializer implements StructuredSerializer<ContactsModel> {
  @override
  final Iterable<Type> types = const [ContactsModel, _$ContactsModel];
  @override
  final String wireName = 'ContactsModel';

  @override
  Iterable serialize(Serializers serializers, ContactsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.count != null) {
      result
        ..add('count')
        ..add(serializers.serialize(object.count,
            specifiedType: const FullType(int)));
    }
    if (object.page_context != null) {
      result
        ..add('page_context')
        ..add(serializers.serialize(object.page_context,
            specifiedType: const FullType(PageContext)));
    }
    if (object.links != null) {
      result
        ..add('links')
        ..add(serializers.serialize(object.links,
            specifiedType: const FullType(Links)));
    }
    if (object.results != null) {
      result
        ..add('results')
        ..add(serializers.serialize(object.results,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Results)])));
    }

    return result;
  }

  @override
  ContactsModel deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactsModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'page_context':
          result.page_context.replace(serializers.deserialize(value,
              specifiedType: const FullType(PageContext)) as PageContext);
          break;
        case 'links':
          result.links.replace(serializers.deserialize(value,
              specifiedType: const FullType(Links)) as Links);
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Results)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$Links extends Links {
  @override
  final String next;
  @override
  final String previous;
  @override
  final String first;
  @override
  final String last;

  factory _$Links([void updates(LinksBuilder b)]) =>
      (new LinksBuilder()..update(updates)).build();

  _$Links._({this.next, this.previous, this.first, this.last}) : super._() {
    if (next == null) {
      throw new BuiltValueNullFieldError('Links', 'next');
    }
    if (first == null) {
      throw new BuiltValueNullFieldError('Links', 'first');
    }
    if (last == null) {
      throw new BuiltValueNullFieldError('Links', 'last');
    }
  }

  @override
  Links rebuild(void updates(LinksBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  LinksBuilder toBuilder() => new LinksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Links &&
        next == other.next &&
        previous == other.previous &&
        first == other.first &&
        last == other.last;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, next.hashCode), previous.hashCode), first.hashCode),
        last.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Links')
          ..add('next', next)
          ..add('previous', previous)
          ..add('first', first)
          ..add('last', last))
        .toString();
  }
}

class LinksBuilder implements Builder<Links, LinksBuilder> {
  _$Links _$v;

  String _next;
  String get next => _$this._next;
  set next(String next) => _$this._next = next;

  String _previous;
  String get previous => _$this._previous;
  set previous(String previous) => _$this._previous = previous;

  String _first;
  String get first => _$this._first;
  set first(String first) => _$this._first = first;

  String _last;
  String get last => _$this._last;
  set last(String last) => _$this._last = last;

  LinksBuilder();

  LinksBuilder get _$this {
    if (_$v != null) {
      _next = _$v.next;
      _previous = _$v.previous;
      _first = _$v.first;
      _last = _$v.last;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Links other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Links;
  }

  @override
  void update(void updates(LinksBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Links build() {
    final _$result = _$v ??
        new _$Links._(next: next, previous: previous, first: first, last: last);
    replace(_$result);
    return _$result;
  }
}

class _$Results extends Results {
  @override
  final String id;
  @override
  final String code;
  @override
  final String name;
  @override
  final String bussiness_id_number;
  @override
  final String tax_id_number;
  @override
  final int credit_limit;
  @override
  final bool is_customer;
  @override
  final bool is_supplier;
  @override
  final bool is_employee;
  @override
  final bool is_active;

  factory _$Results([void updates(ResultsBuilder b)]) =>
      (new ResultsBuilder()..update(updates)).build();

  _$Results._(
      {this.id,
      this.code,
      this.name,
      this.bussiness_id_number,
      this.tax_id_number,
      this.credit_limit,
      this.is_customer,
      this.is_supplier,
      this.is_employee,
      this.is_active})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Results', 'id');
    }
    if (code == null) {
      throw new BuiltValueNullFieldError('Results', 'code');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Results', 'name');
    }
  }

  @override
  Results rebuild(void updates(ResultsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ResultsBuilder toBuilder() => new ResultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Results &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        bussiness_id_number == other.bussiness_id_number &&
        tax_id_number == other.tax_id_number &&
        credit_limit == other.credit_limit &&
        is_customer == other.is_customer &&
        is_supplier == other.is_supplier &&
        is_employee == other.is_employee &&
        is_active == other.is_active;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, id.hashCode), code.hashCode),
                                    name.hashCode),
                                bussiness_id_number.hashCode),
                            tax_id_number.hashCode),
                        credit_limit.hashCode),
                    is_customer.hashCode),
                is_supplier.hashCode),
            is_employee.hashCode),
        is_active.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Results')
          ..add('id', id)
          ..add('code', code)
          ..add('name', name)
          ..add('bussiness_id_number', bussiness_id_number)
          ..add('tax_id_number', tax_id_number)
          ..add('credit_limit', credit_limit)
          ..add('is_customer', is_customer)
          ..add('is_supplier', is_supplier)
          ..add('is_employee', is_employee)
          ..add('is_active', is_active))
        .toString();
  }
}

class ResultsBuilder implements Builder<Results, ResultsBuilder> {
  _$Results _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _bussiness_id_number;
  String get bussiness_id_number => _$this._bussiness_id_number;
  set bussiness_id_number(String bussiness_id_number) =>
      _$this._bussiness_id_number = bussiness_id_number;

  String _tax_id_number;
  String get tax_id_number => _$this._tax_id_number;
  set tax_id_number(String tax_id_number) =>
      _$this._tax_id_number = tax_id_number;

  int _credit_limit;
  int get credit_limit => _$this._credit_limit;
  set credit_limit(int credit_limit) => _$this._credit_limit = credit_limit;

  bool _is_customer;
  bool get is_customer => _$this._is_customer;
  set is_customer(bool is_customer) => _$this._is_customer = is_customer;

  bool _is_supplier;
  bool get is_supplier => _$this._is_supplier;
  set is_supplier(bool is_supplier) => _$this._is_supplier = is_supplier;

  bool _is_employee;
  bool get is_employee => _$this._is_employee;
  set is_employee(bool is_employee) => _$this._is_employee = is_employee;

  bool _is_active;
  bool get is_active => _$this._is_active;
  set is_active(bool is_active) => _$this._is_active = is_active;

  ResultsBuilder();

  ResultsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _code = _$v.code;
      _name = _$v.name;
      _bussiness_id_number = _$v.bussiness_id_number;
      _tax_id_number = _$v.tax_id_number;
      _credit_limit = _$v.credit_limit;
      _is_customer = _$v.is_customer;
      _is_supplier = _$v.is_supplier;
      _is_employee = _$v.is_employee;
      _is_active = _$v.is_active;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Results other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Results;
  }

  @override
  void update(void updates(ResultsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Results build() {
    final _$result = _$v ??
        new _$Results._(
            id: id,
            code: code,
            name: name,
            bussiness_id_number: bussiness_id_number,
            tax_id_number: tax_id_number,
            credit_limit: credit_limit,
            is_customer: is_customer,
            is_supplier: is_supplier,
            is_employee: is_employee,
            is_active: is_active);
    replace(_$result);
    return _$result;
  }
}

class _$PageContext extends PageContext {
  @override
  final int page;
  @override
  final int per_page;
  @override
  final int total_pages;

  factory _$PageContext([void updates(PageContextBuilder b)]) =>
      (new PageContextBuilder()..update(updates)).build();

  _$PageContext._({this.page, this.per_page, this.total_pages}) : super._() {
    if (page == null) {
      throw new BuiltValueNullFieldError('PageContext', 'page');
    }
    if (per_page == null) {
      throw new BuiltValueNullFieldError('PageContext', 'per_page');
    }
    if (total_pages == null) {
      throw new BuiltValueNullFieldError('PageContext', 'total_pages');
    }
  }

  @override
  PageContext rebuild(void updates(PageContextBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PageContextBuilder toBuilder() => new PageContextBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PageContext &&
        page == other.page &&
        per_page == other.per_page &&
        total_pages == other.total_pages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, page.hashCode), per_page.hashCode), total_pages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PageContext')
          ..add('page', page)
          ..add('per_page', per_page)
          ..add('total_pages', total_pages))
        .toString();
  }
}

class PageContextBuilder implements Builder<PageContext, PageContextBuilder> {
  _$PageContext _$v;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  int _per_page;
  int get per_page => _$this._per_page;
  set per_page(int per_page) => _$this._per_page = per_page;

  int _total_pages;
  int get total_pages => _$this._total_pages;
  set total_pages(int total_pages) => _$this._total_pages = total_pages;

  PageContextBuilder();

  PageContextBuilder get _$this {
    if (_$v != null) {
      _page = _$v.page;
      _per_page = _$v.per_page;
      _total_pages = _$v.total_pages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PageContext other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PageContext;
  }

  @override
  void update(void updates(PageContextBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PageContext build() {
    final _$result = _$v ??
        new _$PageContext._(
            page: page, per_page: per_page, total_pages: total_pages);
    replace(_$result);
    return _$result;
  }
}

class _$ContactsModel extends ContactsModel {
  @override
  final int count;
  @override
  final PageContext page_context;
  @override
  final Links links;
  @override
  final BuiltList<Results> results;

  factory _$ContactsModel([void updates(ContactsModelBuilder b)]) =>
      (new ContactsModelBuilder()..update(updates)).build();

  _$ContactsModel._({this.count, this.page_context, this.links, this.results})
      : super._();

  @override
  ContactsModel rebuild(void updates(ContactsModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactsModelBuilder toBuilder() => new ContactsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactsModel &&
        count == other.count &&
        page_context == other.page_context &&
        links == other.links &&
        results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, count.hashCode), page_context.hashCode), links.hashCode),
        results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContactsModel')
          ..add('count', count)
          ..add('page_context', page_context)
          ..add('links', links)
          ..add('results', results))
        .toString();
  }
}

class ContactsModelBuilder
    implements Builder<ContactsModel, ContactsModelBuilder> {
  _$ContactsModel _$v;

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

  ListBuilder<Results> _results;
  ListBuilder<Results> get results =>
      _$this._results ??= new ListBuilder<Results>();
  set results(ListBuilder<Results> results) => _$this._results = results;

  ContactsModelBuilder();

  ContactsModelBuilder get _$this {
    if (_$v != null) {
      _count = _$v.count;
      _page_context = _$v.page_context?.toBuilder();
      _links = _$v.links?.toBuilder();
      _results = _$v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactsModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContactsModel;
  }

  @override
  void update(void updates(ContactsModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ContactsModel build() {
    _$ContactsModel _$result;
    try {
      _$result = _$v ??
          new _$ContactsModel._(
              count: count,
              page_context: _page_context?.build(),
              links: _links?.build(),
              results: _results?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'page_context';
        _page_context?.build();
        _$failedField = 'links';
        _links?.build();
        _$failedField = 'results';
        _results?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ContactsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
