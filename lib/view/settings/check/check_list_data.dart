import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ChecklistItem {
  final String title;
  final String description;
  bool isChecked;

  ChecklistItem({
    required this.title,
    required this.description,
    this.isChecked = false,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'isChecked': isChecked,
      };

  factory ChecklistItem.fromJson(Map<String, dynamic> json) => ChecklistItem(
        title: json['title'],
        description: json['description'],
        isChecked: json['isChecked'],
      );
}

class ChecklistSection {
  final String title;
  final List<ChecklistItem> items;

  ChecklistSection({
    required this.title,
    required this.items,
  });
}

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({Key? key}) : super(key: key);

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  final List<ChecklistSection> sections = [
    ChecklistSection(
      title: 'Set the Basics',
      items: [
        ChecklistItem(
          title: 'Choose a Theme',
          description:
              '(Optional) Decide on a fun theme (e.g., retro, tropical, game night).',
        ),
        ChecklistItem(
          title: 'Pick a Date & Time',
          description: 'Make sure it suits most of your guests.',
        ),
        ChecklistItem(
          title: 'Set a Budget',
          description:
              'Define how much you\'re willing to spend on food, drinks, and decorations.',
        ),
        ChecklistItem(
          title: 'Create a Guest List',
          description:
              'Make a list of attendees and send invites (digital or physical).',
        ),
      ],
    ),
    ChecklistSection(
      title: 'Plan Food & Drinks',
      items: [
        ChecklistItem(
          title: 'Decide on a Menu',
          description:
              'Include appetizers, main dishes, and desserts. Consider dietary restrictions.',
        ),
        ChecklistItem(
          title: 'Stock Up on Drinks',
          description:
              'Alcoholic (cocktails, beer, wine) and non-alcoholic (mocktails, soda, water).',
        ),
        ChecklistItem(
          title: 'Prepare Snacks',
          description: 'Chips, dips, finger foods, or easy-to-eat options.',
        ),
        ChecklistItem(
          title: 'Arrange Serving Essentials',
          description: 'Plates, glasses, utensils, napkins',
        ),
      ],
    ),
    ChecklistSection(
      title: 'Prepare Activities',
      items: [
        ChecklistItem(
          title: 'Plan Games/Entertainment',
          description:
              'Decide on party games or activities (e.g., charades, card games, karaoke).',
        ),
        ChecklistItem(
          title: 'Create a Music Playlist',
          description:
              'Mix of upbeat, party-friendly tracks. Consider your theme!',
        ),
        ChecklistItem(
          title: 'Organize Decorations',
          description:
              'Balloons, banners, lights, or any theme-specific décor.',
        ),
      ],
    ),
    ChecklistSection(
      title: 'Set Up the Party Space',
      items: [
        ChecklistItem(
          title: 'Clean & Arrange Furniture',
          description: 'Make space for dancing or games, if needed.',
        ),
        ChecklistItem(
          title: 'Designate Areas',
          description: 'Create zones for food, drinks, games, or lounging.',
        ),
        ChecklistItem(
          title: 'Set Lighting',
          description:
              'Soft, colorful, or bright lights depending on the mood.',
        ),
        ChecklistItem(
          title: 'Decorate',
          description: 'Add final touches to enhance the vibe.',
        ),
      ],
    ),
    ChecklistSection(
      title: 'Day-of Prep',
      items: [
        ChecklistItem(
          title: 'Chill Drinks',
          description: 'Ensure beverages are cold and ready.',
        ),
        ChecklistItem(
          title: 'Set Up Food Stations',
          description: 'Arrange snacks, food trays, and utensils.',
        ),
        ChecklistItem(
          title: 'Check the Sound System',
          description: 'Test the music or microphone setup.',
        ),
        ChecklistItem(
          title: 'Prepare Guest Welcome',
          description:
              'Set a spot for coats or belongings, and have a drink ready for first arrivals.',
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadCheckedStates();
  }

  Future<void> _loadCheckedStates() async {
    final prefs = await SharedPreferences.getInstance();
    final savedStates = prefs.getString('checklist_states');

    if (savedStates != null) {
      final decodedStates = json.decode(savedStates) as Map<String, dynamic>;

      setState(() {
        for (var section in sections) {
          for (var item in section.items) {
            final key = '${section.title}_${item.title}';
            if (decodedStates.containsKey(key)) {
              item.isChecked = decodedStates[key];
            }
          }
        }
      });
    }
  }

  Future<void> _saveCheckedStates() async {
    final prefs = await SharedPreferences.getInstance();
    final states = <String, bool>{};

    for (var section in sections) {
      for (var item in section.items) {
        final key = '${section.title}_${item.title}';
        states[key] = item.isChecked;
      }
    }

    await prefs.setString('checklist_states', json.encode(states));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF30015D),
        title: Text(
          'Checklist',
          style: GoogleFonts.dmSans(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/main_background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children:
                    sections.map((section) => _buildSection(section)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(ChecklistSection section) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF30015D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              section.title,
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...section.items.map((item) => _buildChecklistItem(section, item)),
        ],
      ),
    );
  }

  Widget _buildChecklistItem(ChecklistSection section, ChecklistItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: CheckboxListTile(
        title: Text(
          item.title,
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          item.description,
          style: GoogleFonts.dmSans(
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        value: item.isChecked,
        onChanged: (bool? value) {
          setState(() {
            item.isChecked = value ?? false;
          });
          _saveCheckedStates();
        },
        checkColor: Colors.white,
        activeColor: Colors.green,
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
