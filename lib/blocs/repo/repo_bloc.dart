import 'package:bloc/bloc.dart';
import 'package:flutter_repos/models/models.dart';
import 'package:flutter_repos/blocs/repo/bloc.dart';
import 'package:flutter_repos/providers/providers.dart';
import 'package:flutter_repos/utils/utils.dart';

class RepoBloc extends Bloc<RepoEvent, RepoState> {
  final RepoProvider _repoProvider = RepoProvider();

  @override
  RepoState get initialState => InitialRepoState();

  @override
  Stream<RepoState> mapEventToState(RepoEvent event) async* {
    if (event is FetchRepoEvent) {
      yield* _mapFetchRepoToState(event);
    }
  }

  Stream<RepoState> _mapFetchRepoToState(FetchRepoEvent event) async* {
    yield FetchingRepoState();
    final List<Repo> repos = await _repoProvider.fetchRepos();
    try {
      yield FetchedReposState(
        repos: repos
      );
    } on AppException catch(e) {
      yield RepoStateException(e);
    }
  }
}