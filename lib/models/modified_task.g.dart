// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modified_task.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetModifiedTaskCollection on Isar {
  IsarCollection<ModifiedTask> get modifiedTasks => this.collection();
}

const ModifiedTaskSchema = CollectionSchema(
  name: r'ModifiedTask',
  id: -8631799481410092684,
  properties: {
    r'taskCreatedDate': PropertySchema(
      id: 0,
      name: r'taskCreatedDate',
      type: IsarType.string,
    )
  },
  estimateSize: _modifiedTaskEstimateSize,
  serialize: _modifiedTaskSerialize,
  deserialize: _modifiedTaskDeserialize,
  deserializeProp: _modifiedTaskDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'task': LinkSchema(
      id: -7640205707548732565,
      name: r'task',
      target: r'Task',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _modifiedTaskGetId,
  getLinks: _modifiedTaskGetLinks,
  attach: _modifiedTaskAttach,
  version: '3.1.0+1',
);

int _modifiedTaskEstimateSize(
  ModifiedTask object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.taskCreatedDate.length * 3;
  return bytesCount;
}

void _modifiedTaskSerialize(
  ModifiedTask object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.taskCreatedDate);
}

ModifiedTask _modifiedTaskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ModifiedTask(
    reader.readString(offsets[0]),
  );
  object.id = id;
  return object;
}

P _modifiedTaskDeserializeProp<P>(
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

Id _modifiedTaskGetId(ModifiedTask object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _modifiedTaskGetLinks(ModifiedTask object) {
  return [object.task];
}

void _modifiedTaskAttach(
    IsarCollection<dynamic> col, Id id, ModifiedTask object) {
  object.id = id;
  object.task.attach(col, col.isar.collection<Task>(), r'task', id);
}

extension ModifiedTaskQueryWhereSort
    on QueryBuilder<ModifiedTask, ModifiedTask, QWhere> {
  QueryBuilder<ModifiedTask, ModifiedTask, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ModifiedTaskQueryWhere
    on QueryBuilder<ModifiedTask, ModifiedTask, QWhereClause> {
  QueryBuilder<ModifiedTask, ModifiedTask, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterWhereClause> idBetween(
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

extension ModifiedTaskQueryFilter
    on QueryBuilder<ModifiedTask, ModifiedTask, QFilterCondition> {
  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition>
      taskCreatedDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskCreatedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition>
      taskCreatedDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskCreatedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition>
      taskCreatedDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskCreatedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition>
      taskCreatedDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskCreatedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition>
      taskCreatedDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskCreatedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition>
      taskCreatedDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskCreatedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition>
      taskCreatedDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskCreatedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition>
      taskCreatedDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskCreatedDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition>
      taskCreatedDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskCreatedDate',
        value: '',
      ));
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition>
      taskCreatedDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskCreatedDate',
        value: '',
      ));
    });
  }
}

extension ModifiedTaskQueryObject
    on QueryBuilder<ModifiedTask, ModifiedTask, QFilterCondition> {}

extension ModifiedTaskQueryLinks
    on QueryBuilder<ModifiedTask, ModifiedTask, QFilterCondition> {
  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition> task(
      FilterQuery<Task> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'task');
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterFilterCondition> taskIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'task', 0, true, 0, true);
    });
  }
}

extension ModifiedTaskQuerySortBy
    on QueryBuilder<ModifiedTask, ModifiedTask, QSortBy> {
  QueryBuilder<ModifiedTask, ModifiedTask, QAfterSortBy>
      sortByTaskCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskCreatedDate', Sort.asc);
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterSortBy>
      sortByTaskCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskCreatedDate', Sort.desc);
    });
  }
}

extension ModifiedTaskQuerySortThenBy
    on QueryBuilder<ModifiedTask, ModifiedTask, QSortThenBy> {
  QueryBuilder<ModifiedTask, ModifiedTask, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterSortBy>
      thenByTaskCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskCreatedDate', Sort.asc);
    });
  }

  QueryBuilder<ModifiedTask, ModifiedTask, QAfterSortBy>
      thenByTaskCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskCreatedDate', Sort.desc);
    });
  }
}

extension ModifiedTaskQueryWhereDistinct
    on QueryBuilder<ModifiedTask, ModifiedTask, QDistinct> {
  QueryBuilder<ModifiedTask, ModifiedTask, QDistinct> distinctByTaskCreatedDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskCreatedDate',
          caseSensitive: caseSensitive);
    });
  }
}

extension ModifiedTaskQueryProperty
    on QueryBuilder<ModifiedTask, ModifiedTask, QQueryProperty> {
  QueryBuilder<ModifiedTask, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ModifiedTask, String, QQueryOperations>
      taskCreatedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskCreatedDate');
    });
  }
}
