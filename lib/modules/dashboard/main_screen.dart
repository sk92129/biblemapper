import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universalapp/screens/widgets/appframe_custom.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
            children: [
              // Bible Reading Card
              Card(
                child: InkWell(
                  onTap: () {
                    context.go('/bible/reading');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Continue Reading',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Genesis 1:1',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'In the beginning God created the heavens and the earth...',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Quiz Card
              Card(
                child: InkWell(
                  onTap: () {
                    // TODO: Handle quiz answer
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Daily Quiz',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Who was the first person to build an ark?',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Noah'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Moses'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Abraham'),
                            ),
                          ],
                        ),
                      ],
                    ),
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
} 