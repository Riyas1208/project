import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/data/api_data_2.dart';

class PhotoListScreen extends StatefulWidget {
  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  late List<Photo> photos = [];
  late ScrollController _scrollController;
  int _page = 1;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    if (_loading) return;

    setState(() {
      _loading = true;
    });

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos?_page=$_page&_limit=10'),
    );

    if (response.statusCode == 200) {
      setState(() {
        photos.addAll((json.decode(response.body) as List)
            .map((data) => Photo.fromJson(data))
            .toList());
        _loading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _page++;
      });
      fetchPhotos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: photos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        controller: _scrollController,
        itemCount: photos.length + 1,
        itemBuilder: (context, index) {
          if (index < photos.length) {
            return Card(
              elevation: 2.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    photos[index].url,
                    width: double.infinity,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      photos[index].title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
