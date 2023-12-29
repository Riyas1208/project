import 'package:flutter/cupertino.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      key: PageStorageKey('FavouritePage'),
      child: Text('Favorite Page'),
    );
  }
}
