import 'package:flutter/material.dart';
import 'package:universalapp/screens/widgets/appframe_custom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReadingPlanScreen extends StatelessWidget {
  const ReadingPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppFrameWidget(
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recent Reading Plans Card
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.yourReadingPlans,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.book),
                              ),
                              title: const Text('30 Days in Psalms'),
                              subtitle: const Text('Progress: 5/30 days'),
                              trailing: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Continue'),
                              ),
                            ),
                            const Divider(),
                            ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.book),
                              ),
                              title: const Text('Life of Jesus'),
                              subtitle: const Text('Progress: 12/40 days'),
                              trailing: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Continue'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Marketplace Card
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                SizedBox(
                                  width: constraints.maxWidth - 100, // Account for padding and icon
                                  child: Text(
                                    AppLocalizations.of(context)!.readingPlanMarketplace,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.search),
                                  onPressed: () {
                                    // TODO: Implement search functionality
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Search reading plans...',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  final plans = [
                                    {
                                      'title': 'Bible in One Year',
                                      'duration': '365 days',
                                      'description': 'A comprehensive journey through the entire Bible'
                                    },
                                    {
                                      'title': 'Wisdom Literature',
                                      'duration': '90 days',
                                      'description': 'Explore Proverbs, Ecclesiastes, and Job'
                                    },
                                    {
                                      'title': 'Prayer Journey',
                                      'duration': '21 days',
                                      'description': 'Daily readings focused on prayer'
                                    },
                                  ];
                                  return _buildPlanCard(
                                    plans[index]['title']!,
                                    plans[index]['duration']!,
                                    plans[index]['description']!,
                                    constraints.maxWidth,
                                  );
                                },
                              ),
                            ),
                    const SizedBox(height: 16),
                    // Featured Reading Plans Card
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Featured Reading Plans",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 120,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  _buildFeaturedPlanButton(
                                    'assets/icons/psalm.jpg',
                                    'Psalms',
                                    Colors.blue.shade100,
                                    () {
                                      debugPrint('Psalms plan tapped');
                                    },
                                  ),
                                  _buildFeaturedPlanButton(
                                    'assets/icons/gospel.jpg',
                                    'Gospels',
                                    Colors.purple.shade100,
                                    () {
                                      debugPrint('Gospels plan tapped');
                                    },
                                  ),
                                  _buildFeaturedPlanButton(
                                    'assets/icons/paul.jpg',
                                    'Paul\'s Letters',
                                    Colors.orange.shade100,
                                    () {
                                      debugPrint('Paul\'s Letters plan tapped');
                                    },
                                  ),
                                  _buildFeaturedPlanButton(
                                    'assets/icons/prophets.jpg',
                                    'Prophets',
                                    Colors.red.shade100,
                                    () {
                                      debugPrint('Prophets plan tapped');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ]
                ),
              ),
            )
                  ]
                ),
              ),
            );

          },
        ),
      ),
    );
  }

  Widget _buildPlanCard(String title, String duration, String description, double screenWidth) {
    // Calculate card width based on screen size
    double cardWidth = screenWidth < 400 ? screenWidth * 0.7 : 300;
    
    return Container(
      width: cardWidth,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                duration,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Start Plan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedPlanButton(
    String iconPath,
    String label,
    Color backgroundColor,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(16),
              child: Ink(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  width: 80,
                  height: 80,
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    iconPath,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        _getIconForPath(iconPath),
                        size: 40,
                        color: backgroundColor.withBlue(backgroundColor.blue - 50),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForPath(String path) {
    // Since we don't have actual assets yet, return appropriate icons
    switch (path) {
      case 'assets/icons/psalms.png':
        return Icons.music_note;
      case 'assets/icons/wisdom.png':
        return Icons.lightbulb;
      case 'assets/icons/gospel.png':
        return Icons.book;
      case 'assets/icons/paul.png':
        return Icons.mail;
      case 'assets/icons/prophets.png':
        return Icons.record_voice_over;
      default:
        return Icons.book;
    }
  }
} 