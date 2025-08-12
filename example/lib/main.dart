import 'package:flutter/material.dart';
import 'package:flutter_advanced_cards/flutter_advanced_cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Cards Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CardGalleryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CardGalleryScreen extends StatefulWidget {
  const CardGalleryScreen({super.key});

  @override
  State<CardGalleryScreen> createState() => _CardGalleryScreenState();
}

class _CardGalleryScreenState extends State<CardGalleryScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Cards Gallery'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                _buildTab('Basic', 0),
                _buildTab('E-commerce', 1),
                _buildTab('Social', 2),
                _buildTab('Analytics', 3),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: selectedTab,
        children: const [
          BasicCardsTab(),
          EcommerceCardsTab(),
          SocialCardsTab(),
          AnalyticsCardsTab(),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selectedTab == index ? Colors.blue : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: selectedTab == index ? FontWeight.bold : FontWeight.normal,
              color: selectedTab == index ? Colors.blue : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}

class BasicCardsTab extends StatelessWidget {
  const BasicCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Basic Cards', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        
        // Simple Card
        const AdvancedCard(
          title: 'Simple Card',
          description: 'This is a basic card with title and description.',
        ),
        
        // Card with Image
        AdvancedCard(
          title: 'Card with Image',
          description: 'This card includes a top-positioned image.',
          cardImage: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
          imagePosition: ImagePosition.top,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Card tapped!')),
            );
          },
        ),
        
        // Card with Button
        AdvancedCard(
          title: 'Interactive Card',
          description: 'This card has an action button.',
          buttonText: 'Click Me',
          onButtonPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Button pressed!')),
            );
          },
        ),
        
        // Card with Rating
        const AdvancedCard(
          title: 'Rated Content',
          description: 'This card displays a rating system.',
          rating: 4.5,
          buttonText: 'View Details',
        ),
      ],
    );
  }
}

class EcommerceCardsTab extends StatelessWidget {
  const EcommerceCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('E-commerce Cards', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        
        // Product Card
        AdvancedCard(
          fullWidth: true,
          cardImage: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800',
          imagePosition: ImagePosition.top,
          showLikeIcon: true,
          showBookmarkIcon: true,
          title: 'Wireless Headphones',
          description: 'Premium noise-cancelling wireless headphones with 30-hour battery life.',
          rating: 4.8,
          customChips: [
            ContentChip(
              text: 'Best Seller',
              backgroundColor: Colors.orange[100],
              textColor: Colors.orange[700],
            ),
            ContentChip(
              text: 'Free Shipping',
              backgroundColor: Colors.green[100],
              textColor: Colors.green[700],
            ),
          ],
          price: '\$299.99',
          buttonText: 'Add to Cart',
          buttonIcon: Icons.shopping_cart,
          onButtonPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Added to cart!')),
            );
          },
        ),
        
        // Course Card
        AdvancedCard(
          fullWidth: true,
          height: 280,
          borderRadius: 20,
          cardImage: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800',
          imagePosition: ImagePosition.background,
          statusChips: [
            StatusChip(
              text: 'Live Workshop',
              position: ChipPosition.topRight,
              backgroundColor: Colors.red[600],
            ),
          ],
          title: 'Master Flutter Development',
          titleColor: Colors.white,
          titleFontSize: 24,
          titleFontWeight: FontWeight.w800,
          description: 'Learn Flutter from industry experts with hands-on projects',
          descriptionColor: Colors.white.withOpacity(0.9),
          customChips: [
            ContentChip(
              text: '⚡ Beginner Friendly',
              backgroundColor: Colors.white.withOpacity(0.25),
              textColor: Colors.white,
            ),
            ContentChip(
              text: '🎓 Certificate',
              backgroundColor: Colors.white.withOpacity(0.25),
              textColor: Colors.white,
            ),
          ],
          chipPosition: ContentChipPosition.afterTitle,
          price: '\$89',
          priceFontSize: 28,
          priceColor: Colors.white,
          buttonText: 'Enroll Now',
          buttonIcon: Icons.play_arrow,
          buttonBackgroundColor: Colors.white,
          buttonTextColor: Colors.purple[800],
          onButtonPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Enrollment started!')),
            );
          },
        ),
      ],
    );
  }
}

class SocialCardsTab extends StatelessWidget {
  const SocialCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Social Cards', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        
        // Profile Card
        AdvancedCard(
          fullWidth: true,
          cardImage: 'https://images.unsplash.com/photo-1487058792275-0ad4aaf24ca7?w=800',
          imagePosition: ImagePosition.top,
          imageRatio: ImageRatio.oneThird,
          showBookmarkIcon: true,
          title: 'Sarah Chen',
          customChips: [
            ContentChip(
              text: 'Pro',
              backgroundColor: Colors.purple[600],
              textColor: Colors.white,
            ),
          ],
          chipPosition: ContentChipPosition.rightOfTitle,
          description: 'Senior UX Designer at Google • 8 years experience',
          iconTextPairs: const [
            IconTextPair(
              icon: Icons.work_outline,
              text: 'Google',
            ),
            IconTextPair(
              icon: Icons.location_on_outlined,
              text: 'San Francisco',
            ),
            IconTextPair(
              icon: Icons.email_outlined,
              text: 'sarah@google.com',
            ),
          ],
          buttons: [
            CardButton(
              text: 'Connect',
              style: CardButtonStyle.elevated,
              backgroundColor: Colors.purple[600],
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Connection request sent!')),
                );
              },
            ),
            CardButton(
              text: 'Portfolio',
              style: CardButtonStyle.outlined,
              borderColor: Colors.purple[600],
              textColor: Colors.purple[600],
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Opening portfolio...')),
                );
              },
            ),
          ],
          buttonDirection: Axis.horizontal,
        ),
        
        // Post Card
        AdvancedCard(
          title: 'Amazing sunset at the beach! 🌅',
          description: 'Had an incredible evening watching the sunset. Nature never fails to amaze me.',
          cardImage: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
          iconTextPairs: const [
            IconTextPair(icon: Icons.favorite_border, text: '124'),
            IconTextPair(icon: Icons.comment_outlined, text: '23'),
            IconTextPair(icon: Icons.share_outlined, text: '12'),
          ],
          buttons: [
            CardButton(
              text: 'Like',
              icon: Icons.favorite_border,
              style: CardButtonStyle.text,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Post liked!')),
                );
              },
            ),
            CardButton(
              text: 'Comment',
              icon: Icons.comment_outlined,
              style: CardButtonStyle.text,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Comment added!')),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class AnalyticsCardsTab extends StatelessWidget {
  const AnalyticsCardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Analytics Cards', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 16),
        
        // Revenue Card
        AdvancedCard(
          backgroundColor: Colors.green[50],
          borderColor: Colors.green[100],
          borderWidth: 1,
          title: 'Weekly Revenue',
          customChips: [
            ContentChip(
              text: '+12.5%',
              backgroundColor: Colors.green[100],
              textColor: Colors.green[700],
              prefixIcon: Icons.trending_up,
            ),
          ],
          metrics: [
            MetricItem(
              label: 'This Week',
              value: '\$24.8K',
              valueColor: Colors.green[700],
              valueFontWeight: FontWeight.w800,
            ),
            MetricItem(
              label: 'Last Week',
              value: '\$22.1K',
              valueColor: Colors.grey[600],
            ),
            MetricItem(
              label: 'Growth',
              value: '+\$2.7K',
              valueColor: Colors.green[600],
            ),
          ],
          metricsColumns: 1,
        ),
        
        // User Stats Card
        AdvancedCard(
          backgroundColor: Colors.blue[50],
          borderColor: Colors.blue[100],
          borderWidth: 1,
          title: 'User Analytics',
          description: 'Monthly active users and engagement metrics',
          metrics: [
            MetricItem(
              label: 'Active Users',
              value: '2.4M',
              valueColor: Colors.blue[700],
            ),
            MetricItem(
              label: 'New Signups',
              value: '12.5K',
              valueColor: Colors.blue[700],
            ),
            MetricItem(
              label: 'Retention',
              value: '94.2%',
              valueColor: Colors.green[600],
            ),
          ],
          metricsColumns: 3,
          showMetricsDividers: true,
        ),
        
        // Performance Card
        AdvancedCard(
          title: 'App Performance',
          customChips: [
            ContentChip(
              text: 'Excellent',
              backgroundColor: Colors.green[100],
              textColor: Colors.green[700],
            ),
          ],
          iconTextPairs: const [
            IconTextPair(
              icon: Icons.speed,
              text: 'Load Time: 1.2s',
            ),
            IconTextPair(
              icon: Icons.memory,
              text: 'Memory: 45MB',
            ),
            IconTextPair(
              icon: Icons.battery_full,
              text: 'Battery: Optimized',
            ),
          ],
          rating: 4.9,
          customRatingText: '4.9/5.0 Performance Score',
        ),
      ],
    );
  }
}