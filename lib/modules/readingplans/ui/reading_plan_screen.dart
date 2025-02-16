import 'package:flutter/material.dart';
import 'package:universalapp/screens/widgets/appframe_custom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReadingPlanScreen extends StatelessWidget {
  const ReadingPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      AppFrameWidget(
        child:
      SafeArea(
      child: SingleChildScrollView(
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
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.readingPlanMarketplace,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
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
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildPlanCard(
                              'Bible in One Year',
                              '365 days',
                              'A comprehensive journey through the entire Bible',
                            ),
                            _buildPlanCard(
                              'Wisdom Literature',
                              '90 days',
                              'Explore Proverbs, Ecclesiastes, and Job',
                            ),
                            _buildPlanCard(
                              'Prayer Journey',
                              '21 days',
                              'Daily readings focused on prayer',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )
      );



  }

  Widget _buildPlanCard(String title, String duration, String description) {
    return Container(
      width: 200,
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
              ),
              const SizedBox(height: 8),
              Text(
                duration,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Start Plan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 