// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContactsModel> _$contactsModelSerializer =
    new _$ContactsModelSerializer();

class _$ContactsModelSerializer implements StructuredSerializer<ContactsModel> {
  @override
  final Iterable<Type> types = const [ContactsModel, _$ContactsModel];
  @override
  final String wireName = 'ContactsModel';

  @override
  Iterable serialize(Serializers serializers, ContactsModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
      'page_context',
      serializers.serialize(object.page_context,
          specifiedType: const FullType(Object)),
      'links',
      serializers.serialize(object.links, specifiedType: const FullType(Links)),
      'results',
      serializers.serialize(object.results,
          specifiedType: const FullType(List, const [const FullType(Result)])),
    ];

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
          result.page_context = serializers.deserialize(value,
              specifiedType: const FullType(Object));
          break;
        case 'links':
          result.links.replace(serializers.deserialize(value,
              specifiedType: const FullType(Links)) as Links);
          break;
        case 'results':
          result.results = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(Result)]))
              as List<Result>;
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
    if (previous == null) {
      throw new BuiltValueNullFieldError('Links', 'previous');
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

class _$Result extends Result {
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
  @override
  final Object classification;
  @override
  final Object default_currency;
  @override
  final Object term_of_payment;
  @override
  final List<Object> addresses;
  @override
  final List<Object> phones;
  @override
  final List<Object> emails;
  @override
  final List<Object> contact_persons;
  @override
  final List<Object> other_fields;
  @override
  final List<Object> attachments;

  factory _$Result([void updates(ResultBuilder b)]) =>
      (new ResultBuilder()..update(updates)).build();

  _$Result._(
      {this.id,
      this.code,
      this.name,
      this.bussiness_id_number,
      this.tax_id_number,
      this.credit_limit,
      this.is_customer,
      this.is_supplier,
      this.is_employee,
      this.is_active,
      this.classification,
      this.default_currency,
      this.term_of_payment,
      this.addresses,
      this.phones,
      this.emails,
      this.contact_persons,
      this.other_fields,
      this.attachments})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Result', 'id');
    }
    if (code == null) {
      throw new BuiltValueNullFieldError('Result', 'code');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Result', 'name');
    }
    if (bussiness_id_number == null) {
      throw new BuiltValueNullFieldError('Result', 'bussiness_id_number');
    }
    if (tax_id_number == null) {
      throw new BuiltValueNullFieldError('Result', 'tax_id_number');
    }
    if (credit_limit == null) {
      throw new BuiltValueNullFieldError('Result', 'credit_limit');
    }
    if (is_customer == null) {
      throw new BuiltValueNullFieldError('Result', 'is_customer');
    }
    if (is_supplier == null) {
      throw new BuiltValueNullFieldError('Result', 'is_supplier');
    }
    if (is_employee == null) {
      throw new BuiltValueNullFieldError('Result', 'is_employee');
    }
    if (is_active == null) {
      throw new BuiltValueNullFieldError('Result', 'is_active');
    }
    if (classification == null) {
      throw new BuiltValueNullFieldError('Result', 'classification');
    }
    if (default_currency == null) {
      throw new BuiltValueNullFieldError('Result', 'default_currency');
    }
    if (term_of_payment == null) {
      throw new BuiltValueNullFieldError('Result', 'term_of_payment');
    }
    if (addresses == null) {
      throw new BuiltValueNullFieldError('Result', 'addresses');
    }
    if (phones == null) {
      throw new BuiltValueNullFieldError('Result', 'phones');
    }
    if (emails == null) {
      throw new BuiltValueNullFieldError('Result', 'emails');
    }
    if (contact_persons == null) {
      throw new BuiltValueNullFieldError('Result', 'contact_persons');
    }
    if (other_fields == null) {
      throw new BuiltValueNullFieldError('Result', 'other_fields');
    }
    if (attachments == null) {
      throw new BuiltValueNullFieldError('Result', 'attachments');
    }
  }

  @override
  Result rebuild(void updates(ResultBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ResultBuilder toBuilder() => new ResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Result &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        bussiness_id_number == other.bussiness_id_number &&
        tax_id_number == other.tax_id_number &&
        credit_limit == other.credit_limit &&
        is_customer == other.is_customer &&
        is_supplier == other.is_supplier &&
        is_employee == other.is_employee &&
        is_active == other.is_active &&
        classification == other.classification &&
        default_currency == other.default_currency &&
        term_of_payment == other.term_of_payment &&
        addresses == other.addresses &&
        phones == other.phones &&
        emails == other.emails &&
        contact_persons == other.contact_persons &&
        other_fields == other.other_fields &&
        attachments == other.attachments;
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                id
                                                                                    .hashCode),
                                                                            code
                                                                                .hashCode),
                                                                        name
                                                                            .hashCode),
                                                                    bussiness_id_number
                                                                        .hashCode),
                                                                tax_id_number
                                                                    .hashCode),
                                                            credit_limit
                                                                .hashCode),
                                                        is_customer.hashCode),
                                                    is_supplier.hashCode),
                                                is_employee.hashCode),
                                            is_active.hashCode),
                                        classification.hashCode),
                                    default_currency.hashCode),
                                term_of_payment.hashCode),
                            addresses.hashCode),
                        phones.hashCode),
                    emails.hashCode),
                contact_persons.hashCode),
            other_fields.hashCode),
        attachments.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Result')
          ..add('id', id)
          ..add('code', code)
          ..add('name', name)
          ..add('bussiness_id_number', bussiness_id_number)
          ..add('tax_id_number', tax_id_number)
          ..add('credit_limit', credit_limit)
          ..add('is_customer', is_customer)
          ..add('is_supplier', is_supplier)
          ..add('is_employee', is_employee)
          ..add('is_active', is_active)
          ..add('classification', classification)
          ..add('default_currency', default_currency)
          ..add('term_of_payment', term_of_payment)
          ..add('addresses', addresses)
          ..add('phones', phones)
          ..add('emails', emails)
          ..add('contact_persons', contact_persons)
          ..add('other_fields', other_fields)
          ..add('attachments', attachments))
        .toString();
  }
}

class ResultBuilder implements Builder<Result, ResultBuilder> {
  _$Result _$v;

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

  Object _classification;
  Object get classification => _$this._classification;
  set classification(Object classification) =>
      _$this._classification = classification;

  Object _default_currency;
  Object get default_currency => _$this._default_currency;
  set default_currency(Object default_currency) =>
      _$this._default_currency = default_currency;

  Object _term_of_payment;
  Object get term_of_payment => _$this._term_of_payment;
  set term_of_payment(Object term_of_payment) =>
      _$this._term_of_payment = term_of_payment;

  List<Object> _addresses;
  List<Object> get addresses => _$this._addresses;
  set addresses(List<Object> addresses) => _$this._addresses = addresses;

  List<Object> _phones;
  List<Object> get phones => _$this._phones;
  set phones(List<Object> phones) => _$this._phones = phones;

  List<Object> _emails;
  List<Object> get emails => _$this._emails;
  set emails(List<Object> emails) => _$this._emails = emails;

  List<Object> _contact_persons;
  List<Object> get contact_persons => _$this._contact_persons;
  set contact_persons(List<Object> contact_persons) =>
      _$this._contact_persons = contact_persons;

  List<Object> _other_fields;
  List<Object> get other_fields => _$this._other_fields;
  set other_fields(List<Object> other_fields) =>
      _$this._other_fields = other_fields;

  List<Object> _attachments;
  List<Object> get attachments => _$this._attachments;
  set attachments(List<Object> attachments) =>
      _$this._attachments = attachments;

  ResultBuilder();

  ResultBuilder get _$this {
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
      _classification = _$v.classification;
      _default_currency = _$v.default_currency;
      _term_of_payment = _$v.term_of_payment;
      _addresses = _$v.addresses;
      _phones = _$v.phones;
      _emails = _$v.emails;
      _contact_persons = _$v.contact_persons;
      _other_fields = _$v.other_fields;
      _attachments = _$v.attachments;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Result other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Result;
  }

  @override
  void update(void updates(ResultBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Result build() {
    final _$result = _$v ??
        new _$Result._(
            id: id,
            code: code,
            name: name,
            bussiness_id_number: bussiness_id_number,
            tax_id_number: tax_id_number,
            credit_limit: credit_limit,
            is_customer: is_customer,
            is_supplier: is_supplier,
            is_employee: is_employee,
            is_active: is_active,
            classification: classification,
            default_currency: default_currency,
            term_of_payment: term_of_payment,
            addresses: addresses,
            phones: phones,
            emails: emails,
            contact_persons: contact_persons,
            other_fields: other_fields,
            attachments: attachments);
    replace(_$result);
    return _$result;
  }
}

class _$ContactsModel extends ContactsModel {
  @override
  final int count;
  @override
  final Object page_context;
  @override
  final Links links;
  @override
  final List<Result> results;

  factory _$ContactsModel([void updates(ContactsModelBuilder b)]) =>
      (new ContactsModelBuilder()..update(updates)).build();

  _$ContactsModel._({this.count, this.page_context, this.links, this.results})
      : super._() {
    if (count == null) {
      throw new BuiltValueNullFieldError('ContactsModel', 'count');
    }
    if (page_context == null) {
      throw new BuiltValueNullFieldError('ContactsModel', 'page_context');
    }
    if (links == null) {
      throw new BuiltValueNullFieldError('ContactsModel', 'links');
    }
    if (results == null) {
      throw new BuiltValueNullFieldError('ContactsModel', 'results');
    }
  }

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

  Object _page_context;
  Object get page_context => _$this._page_context;
  set page_context(Object page_context) => _$this._page_context = page_context;

  LinksBuilder _links;
  LinksBuilder get links => _$this._links ??= new LinksBuilder();
  set links(LinksBuilder links) => _$this._links = links;

  List<Result> _results;
  List<Result> get results => _$this._results;
  set results(List<Result> results) => _$this._results = results;

  ContactsModelBuilder();

  ContactsModelBuilder get _$this {
    if (_$v != null) {
      _count = _$v.count;
      _page_context = _$v.page_context;
      _links = _$v.links?.toBuilder();
      _results = _$v.results;
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
              page_context: page_context,
              links: links.build(),
              results: results);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'links';
        links.build();
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
