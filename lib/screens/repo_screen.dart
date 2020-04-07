import 'package:flutter/material.dart';
import 'package:flutter_repos/models/models.dart';

class ReposScreen extends StatefulWidget {
  static const routeName = '/repos';

  @override
  _ReposScreenState createState() => _ReposScreenState();
}

class _ReposScreenState extends State<ReposScreen> {
  List<Repo> _repos;

  List<Repo> _returnTenRepos(int index) {
    int start = index * 10;
    int end = start + 10 > _repos.length ? _repos.length : start + 10;
    return List<Repo>.from(_repos.getRange(start, end));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _repos = ModalRoute.of(context).settings.arguments as List<Repo>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Repos'
        ),
        automaticallyImplyLeading: false,
      ),
      body: PageView.builder(
        itemCount: (_repos.length / 10).floor(),
        itemBuilder: (BuildContext context, int index) {
          return ListView(
            children: _returnTenRepos(index).map((Repo repo) {
              return ListTile(
                title: Text(repo.name),
                subtitle: Text(
                  repo.owner,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}