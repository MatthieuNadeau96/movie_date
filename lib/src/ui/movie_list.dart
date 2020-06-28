import 'package:flutter/material.dart';
import 'package:movie_app/src/ui/movie_card.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
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
    var results = snapshot.data.results;
    var deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              Text(
                'Movie Date.',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.autorenew),
                onPressed: () {},
              )
            ],
          ),
          Container(
            height: deviceSize.height * 0.65,
            width: deviceSize.width,
            child: TinderSwapCard(
              orientation: AmassOrientation.BOTTOM,
              totalNum: snapshot.data.results.length,
              stackNum: 3,
              swipeEdge: 6.0,
              maxHeight: deviceSize.height * 0.6,
              maxWidth: deviceSize.width * 0.75,
              minHeight: deviceSize.height * 0.58,
              minWidth: deviceSize.width * 0.7,
              cardBuilder: (context, index) => MovieCard(index, results),
              cardController: controller = CardController(),
              swipeUpdateCallback:
                  (DragUpdateDetails details, Alignment align) {
                /// Get swiping card's alignment
                if (align.x < 0) {
                  //Card is LEFT swiping
                } else if (align.x > 0) {
                  //Card is RIGHT swiping
                }
              },
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {
                /// Get orientation & index of swiped card!
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.thumb_down),
                onPressed: () {},
                iconSize: 45,
              ),
              IconButton(
                icon: Icon(Icons.bookmark),
                onPressed: () {},
                iconSize: 35,
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
                iconSize: 45,
              ),
            ],
          )
        ],
      ),
    );
  }
}
