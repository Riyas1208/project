import 'package:flutter/cupertino.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      key: PageStorageKey('FavouritePage'),
      child: Text('Favorite Page'),
    );
  }
}
