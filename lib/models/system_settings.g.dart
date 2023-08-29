// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSystemSettingsCollection on Isar {
  IsarCollection<SystemSettings> get systemSettings => this.collection();
}

const SystemSettingsSchema = CollectionSchema(
  name: r'SystemSettings',
  id: 1918904981363900867,
  properties: {
    r'serverLink': PropertySchema(
      id: 0,
      name: r'serverLink',
      type: IsarType.string,
    )
  },
  estimateSize: _systemSettingsEstimateSize,
  serialize: _systemSettingsSerialize,
  deserialize: _systemSettingsDeserialize,
  deserializeProp: _systemSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _systemSettingsGetId,
  getLinks: _systemSettingsGetLinks,
  attach: _systemSettingsAttach,
  version: '3.1.0+1',
);

int _systemSettingsEstimateSize(
  SystemSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.serverLink.length * 3;
  return bytesCount;
}

void _systemSettingsSerialize(
  SystemSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.serverLink);
}

SystemSettings _systemSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SystemSettings(
    reader.readString(offsets[0]),
  );
  object.id = id;
  return object;
}

P _systemSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _systemSettingsGetId(SystemSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _systemSettingsGetLinks(SystemSettings object) {
  return [];
}

void _systemSettingsAttach(
    IsarCollection<dynamic> col, Id id, SystemSettings object) {
  object.id = id;
}

extension SystemSettingsQueryWhereSort
    on QueryBuilder<SystemSettings, SystemSettings, QWhere> {
  QueryBuilder<SystemSettings, SystemSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SystemSettingsQueryWhere
    on QueryBuilder<SystemSettings, SystemSettings, QWhereClause> {
  QueryBuilder<SystemSettings, SystemSettings, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SystemSettingsQueryFilter
    on QueryBuilder<SystemSettings, SystemSettings, QFilterCondition> {
  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition>
      serverLinkEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition>
      serverLinkGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition>
      serverLinkLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition>
      serverLinkBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverLink',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition>
      serverLinkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serverLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition>
      serverLinkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serverLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition>
      serverLinkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serverLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition>
      serverLinkMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serverLink',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition>
      serverLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverLink',
        value: '',
      ));
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterFilterCondition>
      serverLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serverLink',
        value: '',
      ));
    });
  }
}

extension SystemSettingsQueryObject
    on QueryBuilder<SystemSettings, SystemSettings, QFilterCondition> {}

extension SystemSettingsQueryLinks
    on QueryBuilder<SystemSettings, SystemSettings, QFilterCondition> {}

extension SystemSettingsQuerySortBy
    on QueryBuilder<SystemSettings, SystemSettings, QSortBy> {
  QueryBuilder<SystemSettings, SystemSettings, QAfterSortBy>
      sortByServerLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverLink', Sort.asc);
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterSortBy>
      sortByServerLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverLink', Sort.desc);
    });
  }
}

extension SystemSettingsQuerySortThenBy
    on QueryBuilder<SystemSettings, SystemSettings, QSortThenBy> {
  QueryBuilder<SystemSettings, SystemSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterSortBy>
      thenByServerLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverLink', Sort.asc);
    });
  }

  QueryBuilder<SystemSettings, SystemSettings, QAfterSortBy>
      thenByServerLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverLink', Sort.desc);
    });
  }
}

extension SystemSettingsQueryWhereDistinct
    on QueryBuilder<SystemSettings, SystemSettings, QDistinct> {
  QueryBuilder<SystemSettings, SystemSettings, QDistinct> distinctByServerLink(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverLink', caseSensitive: caseSensitive);
    });
  }
}

extension SystemSettingsQueryProperty
    on QueryBuilder<SystemSettings, SystemSettings, QQueryProperty> {
  QueryBuilder<SystemSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SystemSettings, String, QQueryOperations> serverLinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverLink');
    });
  }
}
