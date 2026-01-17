import 'package:flutter/material.dart';
import '../../widgets/feed/post_composer.dart';
import '../../widgets/feed/post_card.dart';
import '../funding/funding_request_screen.dart';
import '../business/business_dashboard_screen.dart';
import '../deals/deal_tracking_screen.dart';
import '../chat/chat_inbox_screen.dart';
import '../funding/mentorship_request_screen.dart';
import '../funding/pitch_deck_upload_screen.dart';

class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  State<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  int unreadMessages = 2; // <-- replace with your actual unread count

  @override
  Widget build(BuildContext context) {
    final List<_NavItem> items = [
      _NavItem(
        title: "Funding Request",
        subtitle: "Post funding needs",
        icon: Icons.request_quote,
        route: const FundingRequestScreen(),
        startColor: const Color(0xFF0A74FF),
        endColor: const Color(0xFF00D4FF),
      ),
      _NavItem(
        title: "Business Dashboard",
        subtitle: "Browse startups",
        icon: Icons.business_center,
        route: const BusinessDashboardScreen(),
        startColor: const Color(0xFF4B2BE0),
        endColor: const Color(0xFF7C4DFF),
      ),
      _NavItem(
        title: "Deal Tracking",
        subtitle: "Track your deals",
        icon: Icons.track_changes,
        route: const DealTrackingScreen(),
        startColor: const Color(0xFFFFA726),
        endColor: const Color(0xFFFF5252),
      ),

      // 🆕 PITCH DECK
      _NavItem(
        title: "Pitch Deck",
        subtitle: "Upload your pitch",
        icon: Icons.upload_file,
        route: PitchDeckUploadScreen(),
        startColor: const Color(0xFF00C853),
        endColor: const Color(0xFF69F0AE),
      ),

      // 🆕 MENTORSHIP
      _NavItem(
        title: "Mentorship",
        subtitle: "Request a mentor",
        icon: Icons.school,
        route: const MentorshipRequestScreen(),
        startColor: const Color(0xFF6A1B9A),
        endColor: const Color(0xFFAB47BC),
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 12),

            // NAV CARDS (MANUAL SCROLL)
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (_, index) {
                  final item = items[index];
                  return _NavCard(
                    title: item.title,
                    subtitle: item.subtitle,
                    icon: item.icon,
                    startColor: item.startColor,
                    endColor: item.endColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => item.route),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 12),
            const PostComposer(),
            const SizedBox(height: 12),

            Expanded(
              child: ListView(
                children: const [
                  PostCard(
                    name: "EcoGrow",
                    role: "Startup",
                    content:
                        "We just secured 5 pilot customers 🌱 Looking to raise seed funding.",
                    postType: "Opportunity",
                  ),
                  PostCard(
                    name: "Andile M",
                    role: "Investor",
                    content:
                        "Interested in early-stage fintech and agritech startups.",
                    postType: "Pitch",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // 🔥 Floating Chat Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0B6EFF),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ChatInboxScreen()),
          );
        },
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Icon(Icons.chat_bubble_outline, size: 26),
            ),

            // 🔴 Unread badge
            if (unreadMessages > 0)
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    unreadMessages.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final Color startColor;
  final Color endColor;

  const _NavCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    required this.startColor,
    required this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          width: 190,
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [startColor, endColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: startColor.withOpacity(0.25),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white.withOpacity(0.35),
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget route;
  final Color startColor;
  final Color endColor;

  _NavItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
    required this.startColor,
    required this.endColor,
  });
}
