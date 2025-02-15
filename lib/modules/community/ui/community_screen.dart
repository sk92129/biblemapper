import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Communities Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Communities',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
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
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        child: ListView(
                          children: [
                            _buildCommunityTile(
                              'Bible Study Group',
                              '250 members',
                              true,
                            ),
                            _buildCommunityTile(
                              'Prayer Warriors',
                              '180 members',
                              false,
                            ),
                            _buildCommunityTile(
                              'Youth Fellowship',
                              '120 members',
                              false,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Implement create community
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Create New Community'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Active Members Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Most Active Members',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildMemberTile(
                        'John Doe',
                        '500 contributions',
                        Colors.amber,
                      ),
                      _buildMemberTile(
                        'Jane Smith',
                        '450 contributions',
                        Colors.grey.shade400,
                      ),
                      _buildMemberTile(
                        'Mike Johnson',
                        '400 contributions',
                        Colors.brown.shade300,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Prayer Topics Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recent Prayer Topics',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // TODO: Implement see all functionality
                            },
                            child: const Text('See All'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildPrayerTopic(
                        'Healing for Sarah',
                        'Please pray for my sister Sarah who is...',
                        '2h ago',
                        42,
                      ),
                      const Divider(),
                      _buildPrayerTopic(
                        'Mission Trip Support',
                        'Our team is preparing for a mission...',
                        '4h ago',
                        28,
                      ),
                      const Divider(),
                      _buildPrayerTopic(
                        'Church Building Project',
                        'We need prayers for our new building...',
                        '6h ago',
                        35,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommunityTile(String name, String members, bool isSelected) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(name[0]),
      ),
      title: Text(name),
      subtitle: Text(members),
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: Colors.green)
          : null,
      selected: isSelected,
      onTap: () {
        // TODO: Implement community selection
      },
    );
  }

  Widget _buildMemberTile(String name, String contributions, Color medalColor) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(Icons.person, color: Colors.grey.shade700),
      ),
      title: Text(name),
      subtitle: Text(contributions),
      trailing: Icon(Icons.workspace_premium, color: medalColor),
    );
  }

  Widget _buildPrayerTopic(
    String title,
    String preview,
    String timeAgo,
    int prayerCount,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            preview,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                timeAgo,
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.people_outline,
                size: 16,
                color: Colors.grey.shade500,
              ),
              const SizedBox(width: 4),
              Text(
                '$prayerCount praying',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 