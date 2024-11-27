// lib/widgets/custom_list_item.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:funhub/view/home/items/data/data.dart';
import 'package:google_fonts/google_fonts.dart';

import 'details_game_screen.dart';

class CustomListItem extends StatelessWidget {
  final int index;
  const CustomListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        color: const Color(0xFF30015D),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      child: Image.asset(
                        'assets/images/game_card_top.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 80,
                        width: 150,
                        child: Image.asset(games[index].asset),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        games[index].title,
                        style: GoogleFonts.bowlbyOne(
                          fontSize: 21,
                          color: const Color(0xFFFD7F3A),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  games[index].title,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Text(
                  games[index].description,
                  maxLines: 2,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    CupertinoIcons.person_2_fill,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    games[index].players,
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    CupertinoIcons.clock_fill,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                  Text(
                    games[index].time,
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameDetailsScreen(index: index),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(93),
                        color: const Color(0xFFCB00FF),
                        border: Border.all(
                          color: Colors.white,
                          width: 5.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Read',
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
