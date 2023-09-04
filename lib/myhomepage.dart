// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();
  bool isAlbum = true;
  bool isArtist = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4 * size.width / 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 100 * size.width / 100,
                height: 6 * size.height / 100,
                child: TextFormField(
                  onChanged: (val) {},
                  showCursor: true,
                  cursorColor: Colors.black,
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(),
                    ),
                    hintText:
                        isAlbum ? 'Search for Album' : 'Search for Artist',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              SizedBox(height: 3 * size.height / 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAlbum = true;
                        isArtist = false;
                      });
                    },
                    child: FilterContainer(
                      size: size,
                      text: 'Albums',
                      colortype: isAlbum
                          ? Color.fromARGB(255, 59, 137, 62)
                          : Colors.black,
                    ),
                  ),
                  SizedBox(width: 4 * size.width / 100),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAlbum = false;
                        isArtist = true;
                      });
                    },
                    child: FilterContainer(
                      size: size,
                      text: 'Artists',
                      colortype: isArtist
                          ? Color.fromARGB(255, 59, 137, 62)
                          : Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4 * size.height / 100),
              isArtist
                  ? SizedBox(
                      height: 100 * size.height / 100,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.only(bottom: 4 * size.height / 100),
                            child: ArtistTile(size: size),
                          );
                        },
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      height: 100 * size.height / 100,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 10.0, // Spacing between columns
                          mainAxisSpacing: 10.0, // Spacing between rows
                          mainAxisExtent: 30 * size.height / 100,
                        ),
                        itemCount: 10, // Number of items in the grid
                        itemBuilder: (context, index) {
                          return AlbumCard(size: size);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArtistTile extends StatelessWidget {
  const ArtistTile({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          foregroundImage: AssetImage('assets/gloria.jpg'),
        ),
        SizedBox(width: 4 * size.width / 100),
        Text(
          'Angelina Jordan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 * size.height / 100,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 21 * size.height / 100,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gloria.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 1.5 * size.height / 100),
          Text(
            'It\'s magic',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 1 * size.height / 100),
          Text(
            'Angela Cuban, Forever A Flutter dev singerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 0.5 * size.height / 100),
          Text(
            'Single * 2020',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class FilterContainer extends StatelessWidget {
  FilterContainer({
    super.key,
    required this.size,
    required this.text,
    required this.colortype,
  });

  final Size size;
  String text;
  Color colortype;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5 * size.height / 100,
      width: 22 * size.width / 100,
      decoration: BoxDecoration(
        color: colortype,
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          '$text',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
