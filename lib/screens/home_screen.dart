import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_repos/blocs/blocs.dart';
import 'package:flutter_repos/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RepoBloc>(
      create: (BuildContext context) => RepoBloc()..add(FetchRepoEvent()),
      child: Scaffold(
        body: BlocListener<RepoBloc, RepoState>(
          listener: (BuildContext context, RepoState state) {
            if (state is RepoStateException) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(state.exception.message),
              ));
            }

            if (state is FetchedReposState) {
              Navigator.of(context).pushReplacementNamed(ReposScreen.routeName, arguments: state.repos);
            }
          },
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}