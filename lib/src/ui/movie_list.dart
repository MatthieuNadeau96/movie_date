import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot, context) {
    CardController controller;
    var deviceSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: deviceSize.height * 0.75,
        child: TinderSwapCard(
          orientation: AmassOrientation.BOTTOM,
          totalNum: snapshot.data.results.length,
          stackNum: 7,
          swipeEdge: 6.0,
          maxWidth: deviceSize.width * 0.9,
          maxHeight: deviceSize.width * 0.9,
          minWidth: deviceSize.width * 0.8,
          minHeight: deviceSize.width * 0.8,
          cardBuilder: (context, index) => Card(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].backdrop_path}',
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              )),
          cardController: controller = CardController(),
          swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
            /// Get swiping card's alignment
            if (align.x < 0) {
              //Card is LEFT swiping
            } else if (align.x > 0) {
              //Card is RIGHT swiping
            }
          },
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            /// Get orientation & index of swiped card!
          },
        ),
      ),
    );
  }
}
