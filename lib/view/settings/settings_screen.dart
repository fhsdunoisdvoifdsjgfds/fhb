import 'package:flutter/material.dart';
import 'package:funhub/view/settings/check/check_list_data.dart';
import 'package:funhub/view/settings/contact_form/contact_support_screen.dart';
import 'package:funhub/view/settings/events/events_creation_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/details_background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Settings',
                    style: GoogleFonts.dmSans(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                _buildSection(
                  'Events',
                  [
                    _buildTile(
                      icon: Icons.event,
                      title: 'Events',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EventsScreen(),
                          ),
                        );
                      },
                    ),
                    _buildTile(
                      icon: Icons.checklist,
                      title: 'Checklist',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChecklistScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                _buildSection(
                  'Application',
                  [
                    _buildTile(
                      icon: Icons.contact_support,
                      title: 'Contact us',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ContactUsScreen(),
                          ),
                        );
                      },
                    ),
                    _buildTile(
                      icon: Icons.thumb_up,
                      title: 'Rate App',
                      onTap: () async {
                        final InAppReview inAppReview = InAppReview.instance;
                        if (await inAppReview.isAvailable()) {
                          inAppReview.requestReview();
                        }
                      },
                    ),
                  ],
                ),
                _buildSection(
                  'Legal',
                  [
                    _buildTile(
                      icon: Icons.description,
                      title: 'Terms and Conditions',
                      onTap: () =>
                          _launchURL('https://sneakerwin.online/vibehub-terms'),
                    ),
                    _buildTile(
                      icon: Icons.privacy_tip,
                      title: 'Privacy Policy',
                      onTap: () => _launchURL(
                          'https://sneakerwin.online/vibehub-policy'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> tiles) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF30015D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.dmSans(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ...tiles,
        ],
      ),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: GoogleFonts.dmSans(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: onTap,
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
