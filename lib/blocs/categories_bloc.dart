import 'dart:developer';

import 'package:antara/blocs/result_state.dart';
import 'package:antara/serene%20data/repository.dart';
import 'package:antara/serene%20model/category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class CategoryBloc extends Bloc<CategoryEvent, Result> {
  final DataRepository repository;

  CategoryBloc({@required this.repository}) : assert(repository != null);

  @override
  Result get initialState => Empty();

  @override
  Stream<Result<List<Category>>> mapEventToState(CategoryEvent event) async* {
    if (event is FetchCategories) {
      yield* _mapFetchCategoriesToState(event);
    }
  }

  Stream<Result<List<Category>>> _mapFetchCategoriesToState(
      FetchCategories event) async* {
    yield Loading();
    try {
      yield Success(await repository.loadCategories());
    } catch (error) {
      log(error);
      yield Error(error);
    }
  }
}

// Events
abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class FetchCategories extends CategoryEvent {
  const FetchCategories();

  @override
  List<Object> get props => [];
}
