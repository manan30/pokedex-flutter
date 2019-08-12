import 'package:flutter/material.dart';
import 'package:pokedex/blocs/PokemonDetailsBloc.dart';
import 'package:pokedex/models/PokemonDetailsModel.dart';
import 'package:pokedex/utils/API/APIResponse.dart';

class Details extends StatefulWidget {
  final String url;

  Details(this.url);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  PokemonDetailsBloc _detailsBloc;

  @override
  void initState() {
    super.initState();
    _detailsBloc = PokemonDetailsBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _detailsBloc.fetchPokemonDetails(widget.url),
        child: StreamBuilder<APIResponse<PokemonDetails>>(
          stream: _detailsBloc.pokemonDetailsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  print('Loading $snapshot');
                  return CircularProgressIndicator(
                    semanticsLabel: snapshot.data.message,
                  );
                case Status.COMPLETED:
                  print('Completed $snapshot');
                  return Container(
                    child: Text('Loaded'),
                  );
                case Status.ERROR:
                  print('Error $snapshot');
                  return Container(
                    child: Text(snapshot.data.message),
                  );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _detailsBloc.dispose();
  }
}
