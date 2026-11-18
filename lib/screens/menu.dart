import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/widgets/project_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // Personal Information
  final String npm = "2506619285";
  final String nama = "Raffa Zia Arya Putra";
  final String kelas = "PBP A";

  // Quick Actions
  final List<ItemHomepage> items = [
    ItemHomepage("View Portofolio", Icons.folder_open, const Color(0xFF3979B9)),
    ItemHomepage(
      "Add Portofolio Item",
      Icons.add_circle_outline,
      const Color(0xFF269B72),
    ),
    ItemHomepage("Logout", Icons.logout, const Color(0xFFD85B55)),
  ];

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF384959);

    return Scaffold(
      drawer: const LeftDrawer(),
      // AppBar
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MyPortofolio',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text('HOME', style: TextStyle(fontSize: 11)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 19,
              backgroundColor: Color(0xFFDCEBFA),
              child: Icon(Icons.person, color: navy),
            ),
          ),
        ],
      ),

      // Main Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: navy.withValues(alpha: 0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCEBFA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'INFORMATION SYSTEMS',
                      style: TextStyle(
                        color: navy,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'Hello, Raffa!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Welcome to my personal portofolio.',
                    style: TextStyle(fontSize: 14, color: Color(0xFF718096)),
                  ),

                  const SizedBox(height: 16),

                  const Row(
                    children: [
                      Icon(
                        Icons.school_outlined,
                        color: Color(0xFF3979B9),
                        size: 19,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Undergraduate Information Systems',
                          style: TextStyle(fontSize: 12, color: navy),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Personal Information
            Row(
              children: [
                Expanded(
                  child: InfoCard(
                    title: 'NPM',
                    content: npm,
                    icon: Icons.badge_outlined,
                  ),
                ),
                Expanded(
                  child: InfoCard(
                    title: 'NAME',
                    content: nama,
                    icon: Icons.person_outline,
                  ),
                ),
                Expanded(
                  child: InfoCard(
                    title: 'CLASS',
                    content: kelas,
                    icon: Icons.account_tree_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Quick Actions
            const Text(
              'QUICK ACTIONS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: navy,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3.5,
              children: items.map((item) {
                return ItemCard(item);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Widget: InfoCard
class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const InfoCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF384959);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 5),
        child: Column(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFDCEBFA),
              child: Icon(icon, color: navy, size: 21),
            ),

            const SizedBox(height: 9),

            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF718096),
              ),
            ),

            const SizedBox(height: 4),

            Text(
              content,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model Data: ItemHomepage
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}
