// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shows_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DBShow extends DataClass implements Insertable<DBShow> {
  final int id;
  final double? averageRating;
  final String? description;
  final String? imageUrl;
  final int noOfReviews;
  final String title;
  DBShow(
      {required this.id,
      this.averageRating,
      this.description,
      this.imageUrl,
      required this.noOfReviews,
      required this.title});
  factory DBShow.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBShow(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      averageRating: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}average_rating']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      imageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image_url']),
      noOfReviews: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}no_of_reviews'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || averageRating != null) {
      map['average_rating'] = Variable<double?>(averageRating);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String?>(imageUrl);
    }
    map['no_of_reviews'] = Variable<int>(noOfReviews);
    map['title'] = Variable<String>(title);
    return map;
  }

  ShowsCompanion toCompanion(bool nullToAbsent) {
    return ShowsCompanion(
      id: Value(id),
      averageRating: averageRating == null && nullToAbsent
          ? const Value.absent()
          : Value(averageRating),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      noOfReviews: Value(noOfReviews),
      title: Value(title),
    );
  }

  factory DBShow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBShow(
      id: serializer.fromJson<int>(json['id']),
      averageRating: serializer.fromJson<double?>(json['averageRating']),
      description: serializer.fromJson<String?>(json['description']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      noOfReviews: serializer.fromJson<int>(json['noOfReviews']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'averageRating': serializer.toJson<double?>(averageRating),
      'description': serializer.toJson<String?>(description),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'noOfReviews': serializer.toJson<int>(noOfReviews),
      'title': serializer.toJson<String>(title),
    };
  }

  DBShow copyWith(
          {int? id,
          double? averageRating,
          String? description,
          String? imageUrl,
          int? noOfReviews,
          String? title}) =>
      DBShow(
        id: id ?? this.id,
        averageRating: averageRating ?? this.averageRating,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        noOfReviews: noOfReviews ?? this.noOfReviews,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('DBShow(')
          ..write('id: $id, ')
          ..write('averageRating: $averageRating, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('noOfReviews: $noOfReviews, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          averageRating.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(imageUrl.hashCode,
                  $mrjc(noOfReviews.hashCode, title.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBShow &&
          other.id == this.id &&
          other.averageRating == this.averageRating &&
          other.description == this.description &&
          other.imageUrl == this.imageUrl &&
          other.noOfReviews == this.noOfReviews &&
          other.title == this.title);
}

class ShowsCompanion extends UpdateCompanion<DBShow> {
  final Value<int> id;
  final Value<double?> averageRating;
  final Value<String?> description;
  final Value<String?> imageUrl;
  final Value<int> noOfReviews;
  final Value<String> title;
  const ShowsCompanion({
    this.id = const Value.absent(),
    this.averageRating = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.noOfReviews = const Value.absent(),
    this.title = const Value.absent(),
  });
  ShowsCompanion.insert({
    this.id = const Value.absent(),
    this.averageRating = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
    required int noOfReviews,
    required String title,
  })  : noOfReviews = Value(noOfReviews),
        title = Value(title);
  static Insertable<DBShow> custom({
    Expression<int>? id,
    Expression<double?>? averageRating,
    Expression<String?>? description,
    Expression<String?>? imageUrl,
    Expression<int>? noOfReviews,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (averageRating != null) 'average_rating': averageRating,
      if (description != null) 'description': description,
      if (imageUrl != null) 'image_url': imageUrl,
      if (noOfReviews != null) 'no_of_reviews': noOfReviews,
      if (title != null) 'title': title,
    });
  }

  ShowsCompanion copyWith(
      {Value<int>? id,
      Value<double?>? averageRating,
      Value<String?>? description,
      Value<String?>? imageUrl,
      Value<int>? noOfReviews,
      Value<String>? title}) {
    return ShowsCompanion(
      id: id ?? this.id,
      averageRating: averageRating ?? this.averageRating,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      noOfReviews: noOfReviews ?? this.noOfReviews,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (averageRating.present) {
      map['average_rating'] = Variable<double?>(averageRating.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String?>(imageUrl.value);
    }
    if (noOfReviews.present) {
      map['no_of_reviews'] = Variable<int>(noOfReviews.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShowsCompanion(')
          ..write('id: $id, ')
          ..write('averageRating: $averageRating, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('noOfReviews: $noOfReviews, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $ShowsTable extends Shows with TableInfo<$ShowsTable, DBShow> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ShowsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _averageRatingMeta =
      const VerificationMeta('averageRating');
  late final GeneratedColumn<double?> averageRating = GeneratedColumn<double?>(
      'average_rating', aliasedName, true,
      typeName: 'REAL', requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _imageUrlMeta = const VerificationMeta('imageUrl');
  late final GeneratedColumn<String?> imageUrl = GeneratedColumn<String?>(
      'image_url', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _noOfReviewsMeta =
      const VerificationMeta('noOfReviews');
  late final GeneratedColumn<int?> noOfReviews = GeneratedColumn<int?>(
      'no_of_reviews', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, averageRating, description, imageUrl, noOfReviews, title];
  @override
  String get aliasedName => _alias ?? 'shows';
  @override
  String get actualTableName => 'shows';
  @override
  VerificationContext validateIntegrity(Insertable<DBShow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('average_rating')) {
      context.handle(
          _averageRatingMeta,
          averageRating.isAcceptableOrUnknown(
              data['average_rating']!, _averageRatingMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('no_of_reviews')) {
      context.handle(
          _noOfReviewsMeta,
          noOfReviews.isAcceptableOrUnknown(
              data['no_of_reviews']!, _noOfReviewsMeta));
    } else if (isInserting) {
      context.missing(_noOfReviewsMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBShow map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBShow.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ShowsTable createAlias(String alias) {
    return $ShowsTable(_db, alias);
  }
}

class DBReview extends DataClass implements Insertable<DBReview> {
  final String id;
  final String comment;
  final int rating;
  final int showId;
  final String userId;
  final String userEmail;
  final String? userImageUrl;
  DBReview(
      {required this.id,
      required this.comment,
      required this.rating,
      required this.showId,
      required this.userId,
      required this.userEmail,
      this.userImageUrl});
  factory DBReview.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBReview(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      comment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment'])!,
      rating: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating'])!,
      showId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}show_id'])!,
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      userEmail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_email'])!,
      userImageUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_image_url']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['comment'] = Variable<String>(comment);
    map['rating'] = Variable<int>(rating);
    map['show_id'] = Variable<int>(showId);
    map['user_id'] = Variable<String>(userId);
    map['user_email'] = Variable<String>(userEmail);
    if (!nullToAbsent || userImageUrl != null) {
      map['user_image_url'] = Variable<String?>(userImageUrl);
    }
    return map;
  }

  ReviewsCompanion toCompanion(bool nullToAbsent) {
    return ReviewsCompanion(
      id: Value(id),
      comment: Value(comment),
      rating: Value(rating),
      showId: Value(showId),
      userId: Value(userId),
      userEmail: Value(userEmail),
      userImageUrl: userImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(userImageUrl),
    );
  }

  factory DBReview.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBReview(
      id: serializer.fromJson<String>(json['id']),
      comment: serializer.fromJson<String>(json['comment']),
      rating: serializer.fromJson<int>(json['rating']),
      showId: serializer.fromJson<int>(json['showId']),
      userId: serializer.fromJson<String>(json['userId']),
      userEmail: serializer.fromJson<String>(json['userEmail']),
      userImageUrl: serializer.fromJson<String?>(json['userImageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'comment': serializer.toJson<String>(comment),
      'rating': serializer.toJson<int>(rating),
      'showId': serializer.toJson<int>(showId),
      'userId': serializer.toJson<String>(userId),
      'userEmail': serializer.toJson<String>(userEmail),
      'userImageUrl': serializer.toJson<String?>(userImageUrl),
    };
  }

  DBReview copyWith(
          {String? id,
          String? comment,
          int? rating,
          int? showId,
          String? userId,
          String? userEmail,
          String? userImageUrl}) =>
      DBReview(
        id: id ?? this.id,
        comment: comment ?? this.comment,
        rating: rating ?? this.rating,
        showId: showId ?? this.showId,
        userId: userId ?? this.userId,
        userEmail: userEmail ?? this.userEmail,
        userImageUrl: userImageUrl ?? this.userImageUrl,
      );
  @override
  String toString() {
    return (StringBuffer('DBReview(')
          ..write('id: $id, ')
          ..write('comment: $comment, ')
          ..write('rating: $rating, ')
          ..write('showId: $showId, ')
          ..write('userId: $userId, ')
          ..write('userEmail: $userEmail, ')
          ..write('userImageUrl: $userImageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          comment.hashCode,
          $mrjc(
              rating.hashCode,
              $mrjc(
                  showId.hashCode,
                  $mrjc(userId.hashCode,
                      $mrjc(userEmail.hashCode, userImageUrl.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBReview &&
          other.id == this.id &&
          other.comment == this.comment &&
          other.rating == this.rating &&
          other.showId == this.showId &&
          other.userId == this.userId &&
          other.userEmail == this.userEmail &&
          other.userImageUrl == this.userImageUrl);
}

class ReviewsCompanion extends UpdateCompanion<DBReview> {
  final Value<String> id;
  final Value<String> comment;
  final Value<int> rating;
  final Value<int> showId;
  final Value<String> userId;
  final Value<String> userEmail;
  final Value<String?> userImageUrl;
  const ReviewsCompanion({
    this.id = const Value.absent(),
    this.comment = const Value.absent(),
    this.rating = const Value.absent(),
    this.showId = const Value.absent(),
    this.userId = const Value.absent(),
    this.userEmail = const Value.absent(),
    this.userImageUrl = const Value.absent(),
  });
  ReviewsCompanion.insert({
    required String id,
    required String comment,
    required int rating,
    required int showId,
    required String userId,
    required String userEmail,
    this.userImageUrl = const Value.absent(),
  })  : id = Value(id),
        comment = Value(comment),
        rating = Value(rating),
        showId = Value(showId),
        userId = Value(userId),
        userEmail = Value(userEmail);
  static Insertable<DBReview> custom({
    Expression<String>? id,
    Expression<String>? comment,
    Expression<int>? rating,
    Expression<int>? showId,
    Expression<String>? userId,
    Expression<String>? userEmail,
    Expression<String?>? userImageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (comment != null) 'comment': comment,
      if (rating != null) 'rating': rating,
      if (showId != null) 'show_id': showId,
      if (userId != null) 'user_id': userId,
      if (userEmail != null) 'user_email': userEmail,
      if (userImageUrl != null) 'user_image_url': userImageUrl,
    });
  }

  ReviewsCompanion copyWith(
      {Value<String>? id,
      Value<String>? comment,
      Value<int>? rating,
      Value<int>? showId,
      Value<String>? userId,
      Value<String>? userEmail,
      Value<String?>? userImageUrl}) {
    return ReviewsCompanion(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
      showId: showId ?? this.showId,
      userId: userId ?? this.userId,
      userEmail: userEmail ?? this.userEmail,
      userImageUrl: userImageUrl ?? this.userImageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (showId.present) {
      map['show_id'] = Variable<int>(showId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (userEmail.present) {
      map['user_email'] = Variable<String>(userEmail.value);
    }
    if (userImageUrl.present) {
      map['user_image_url'] = Variable<String?>(userImageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewsCompanion(')
          ..write('id: $id, ')
          ..write('comment: $comment, ')
          ..write('rating: $rating, ')
          ..write('showId: $showId, ')
          ..write('userId: $userId, ')
          ..write('userEmail: $userEmail, ')
          ..write('userImageUrl: $userImageUrl')
          ..write(')'))
        .toString();
  }
}

class $ReviewsTable extends Reviews with TableInfo<$ReviewsTable, DBReview> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ReviewsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  late final GeneratedColumn<String?> comment = GeneratedColumn<String?>(
      'comment', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  late final GeneratedColumn<int?> rating = GeneratedColumn<int?>(
      'rating', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _showIdMeta = const VerificationMeta('showId');
  late final GeneratedColumn<int?> showId = GeneratedColumn<int?>(
      'show_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _userEmailMeta = const VerificationMeta('userEmail');
  late final GeneratedColumn<String?> userEmail = GeneratedColumn<String?>(
      'user_email', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _userImageUrlMeta =
      const VerificationMeta('userImageUrl');
  late final GeneratedColumn<String?> userImageUrl = GeneratedColumn<String?>(
      'user_image_url', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, comment, rating, showId, userId, userEmail, userImageUrl];
  @override
  String get aliasedName => _alias ?? 'reviews';
  @override
  String get actualTableName => 'reviews';
  @override
  VerificationContext validateIntegrity(Insertable<DBReview> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('show_id')) {
      context.handle(_showIdMeta,
          showId.isAcceptableOrUnknown(data['show_id']!, _showIdMeta));
    } else if (isInserting) {
      context.missing(_showIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('user_email')) {
      context.handle(_userEmailMeta,
          userEmail.isAcceptableOrUnknown(data['user_email']!, _userEmailMeta));
    } else if (isInserting) {
      context.missing(_userEmailMeta);
    }
    if (data.containsKey('user_image_url')) {
      context.handle(
          _userImageUrlMeta,
          userImageUrl.isAcceptableOrUnknown(
              data['user_image_url']!, _userImageUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBReview map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DBReview.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ReviewsTable createAlias(String alias) {
    return $ReviewsTable(_db, alias);
  }
}

abstract class _$ShowsDatabase extends GeneratedDatabase {
  _$ShowsDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ShowsTable shows = $ShowsTable(this);
  late final $ReviewsTable reviews = $ReviewsTable(this);
  late final ShowDao showDao = ShowDao(this as ShowsDatabase);
  late final ReviewDao reviewDao = ReviewDao(this as ShowsDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [shows, reviews];
}
