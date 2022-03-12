import 'package:flutter/material.dart';
import 'package:spotifyclone/models/category.dart';
import 'package:spotifyclone/models/music.dart';
import 'package:spotifyclone/services/category_operations.dart';
import 'package:spotifyclone/services/music_operations.dart';

class Home extends StatelessWidget {
  Function _miniPlayer;
  Home(this._miniPlayer);

  Widget createCategory(Category category) {
    return Container(
        color: Colors.blueGrey.shade400,
        child: Row(
          children: [
            Image.network(category.imageUrl, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                category.text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ));
  }

  List<Widget> createListofCategories() {
    List<Category> categoryList = CategoryOperations.getCategories();
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();
    return categories;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 150,
              width: 200,
              child: InkWell(
                onTap: () {
                  _miniPlayer(music, stop: true);
                },
                child: Image.network(
                  music.imageUrl,
                  fit: BoxFit.cover,
                ),
              )),
          Text(
            music.name,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            music.desc,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperations.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
      height: 270,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListofCategories(),
        crossAxisCount: 2,
      ),
    );
  }

  Widget createAppBar(String message) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(message),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              createAppBar("Hello Everyone"),
              SizedBox(height: 5),
              createGrid(),
              createMusicList("Made For You"),
              SizedBox(height: 12),
              createMusicList("Popular Playlist"),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueGrey.shade300, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.3],
            ),
          ),
        ),
      ),
    );
  }
}
