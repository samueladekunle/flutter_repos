import 'package:flutter_repos/models/models.dart';
import 'package:flutter_repos/utils/utils.dart';

class RepoState {}

class InitialRepoState extends RepoState {
  @override
  String toString() {
    return 'Initial Repo State';
  }
}

class FetchingRepoState extends RepoState {}

class FetchedReposState extends RepoState {
  final List<Repo> repos;

  FetchedReposState({
    this.repos,
  });

  @override
  String toString() {
    return 'Fetched Repo State';
  }
}

class RepoStateException extends RepoState {
  final AppException exception;

  RepoStateException(this.exception);
}