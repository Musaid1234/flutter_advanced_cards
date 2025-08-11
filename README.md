# Flutter Advanced Cards

[![pub package](https://img.shields.io/pub/v/flutter_advanced_cards.svg)](https://pub.dev/packages/flutter_advanced_cards)
[![popularity](https://img.shields.io/pub/popularity/flutter_advanced_cards.svg)](https://pub.dev/packages/flutter_advanced_cards)
[![likes](https://img.shields.io/pub/likes/flutter_advanced_cards.svg)](https://pub.dev/packages/flutter_advanced_cards)
[![pub points](https://img.shields.io/pub/points/flutter_advanced_cards.svg)](https://pub.dev/packages/flutter_advanced_cards)

The most **powerful and customizable card widget** for Flutter applications. Create stunning, professional cards with advanced features like image positioning, interactive overlays, content grids, rating systems, and sophisticated button controls.

## ✨ Features

- 🎨 **100+ Customizable Properties** - Complete control over every aspect
- 🖼️ **Advanced Image System** - Multiple positioning options with overlay effects  
- 📊 **Content Grid Layouts** - Perfect for metrics, analytics, and data display
- ⭐ **Interactive Rating System** - Customizable stars with tap-to-rate functionality
- 🔘 **Professional Button System** - 5 button styles with animations and loading states
- 💫 **Micro-animations** - Smooth hover effects and press animations
- 📱 **Responsive Design** - Adapts beautifully to all screen sizes
- 🎯 **Production Ready** - Used by thousands of developers worldwide

## 📸 Showcase

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/Musaid1234/flutter_advanced_cards/main/images/image1.jpg" width="200"/></td>
    <td><img src="https://raw.githubusercontent.com/Musaid1234/flutter_advanced_cards/main/images/image2.jpg" width="200"/></td>
    <td><img src="https://raw.githubusercontent.com/Musaid1234/flutter_advanced_cards/main/images/image3.jpg" width="200"/></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/Musaid1234/flutter_advanced_cards/main/images/image4.jpg" width="200"/></td>
    <td><img src="https://raw.githubusercontent.com/Musaid1234/flutter_advanced_cards/main/images/image5.jpg" width="200"/></td>
    <td><img src="https://raw.githubusercontent.com/Musaid1234/flutter_advanced_cards/main/images/image6.jpg" width="200"/></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/Musaid1234/flutter_advanced_cards/main/images/image7.jpg" width="200"/></td>
    <td><img src="https://raw.githubusercontent.com/Musaid1234/flutter_advanced_cards/main/images/image8.jpg" width="200"/></td>
    <td><img src="https://raw.githubusercontent.com/Musaid1234/flutter_advanced_cards/main/images/image9.jpg" width="200"/></td>
  </tr>
</table>

## 🚀 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_advanced_cards: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## 📱 Quick Start

```dart
import 'package:flutter_advanced_cards/flutter_advanced_cards.dart';

AdvancedCard(
  title: 'Beautiful Card',
  description: 'This is a stunning card with advanced features',
  cardImage: 'https://example.com/image.jpg',
  imagePosition: ImagePosition.top,
  buttonText: 'Get Started',
  onButtonPressed: () {
    print('Button pressed!');
  },
)
```

## 🎯 Examples

### Course Card with Background Image

```dart
AdvancedCard(
  fullWidth: true,
  height: 280,
  borderRadius: 20,
  cardImage: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f',
  imagePosition: ImagePosition.background,
  statusChips: [
    StatusChip(
      text: 'Live Workshop',
      position: ChipPosition.topRight,
      backgroundColor: Colors.red[600],
    ),
  ],
  title: 'Master Mobile Development',
  titleColor: Colors.white,
  titleFontSize: 24,
  titleFontWeight: FontWeight.w800,
  description: 'Learn Flutter & React Native from industry experts',
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
    // Handle enrollment
  },
)
```

### Profile Card with Actions

```dart
AdvancedCard(
  fullWidth: true,
  cardImage: 'https://images.unsplash.com/photo-1487058792275-0ad4aaf24ca7',
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
  iconTextPairs: [
    IconTextPair(
      icon: Icons.work_outline,
      text: 'Google',
    ),
    IconTextPair(
      icon: Icons.location_on_outlined,
      text: 'San Francisco',
    ),
  ],
  buttons: [
    CardButton(
      text: 'Connect',
      style: CardButtonStyle.elevated,
      backgroundColor: Colors.purple[600],
    ),
    CardButton(
      text: 'Portfolio',
      style: CardButtonStyle.outlined,
    ),
  ],
)
```

### Analytics Dashboard Card

```dart
AdvancedCard(
  backgroundColor: Colors.green[50],
  borderColor: Colors.green[100],
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
  ],
  metricsColumns: 1,
)
```

## 📚 Complete API Reference

### AdvancedCard Properties

#### 🏗️ Basic Structure

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `width` | `double?` | `null` | Fixed width of the card |
| `height` | `double?` | `null` | Fixed height of the card |
| `fullWidth` | `bool` | `false` | Makes card take full available width |
| `fullHeight` | `bool` | `false` | Makes card take full available height |
| `backgroundColor` | `Color?` | `Colors.white` | Background color of the card |
| `borderRadius` | `double?` | `12.0` | Border radius for all corners |
| `customBorderRadius` | `BorderRadiusGeometry?` | `null` | Custom border radius for specific corners |
| `padding` | `EdgeInsetsGeometry?` | `EdgeInsets.all(16.0)` | Internal padding of the card |
| `margin` | `EdgeInsetsGeometry?` | `EdgeInsets.all(8.0)` | External margin around the card |

#### 🎨 Border & Shadow

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `borderWidth` | `double?` | `null` | Width of the border (0 = no border) |
| `borderColor` | `Color?` | `Colors.grey.shade300` | Color of the border |
| `hasShadow` | `bool` | `true` | Enable/disable shadow |
| `shadowColor` | `Color?` | `Colors.grey.withOpacity(0.2)` | Color of the shadow |
| `shadowBlur` | `double?` | `4.0` | Blur radius of the shadow |
| `shadowSpread` | `double?` | `1.0` | Spread radius of the shadow |
| `shadowOffSet` | `Offset?` | `Offset(0, 2)` | Offset of the shadow |
| `customShadows` | `List<BoxShadow>?` | `null` | Custom list of shadows |

#### 🖱️ Interaction

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `onTap` | `VoidCallback?` | `null` | Callback when card is tapped |
| `onLongPress` | `VoidCallback?` | `null` | Callback when card is long pressed |
| `enableHover` | `bool` | `true` | Enable hover effects |

#### 🖼️ Image System

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `cardImage` | `dynamic` | `null` | Image source (URL, asset path, or Widget) |
| `imagePosition` | `ImagePosition` | `ImagePosition.top` | Position of image (`top`, `left`, `right`, `background`) |
| `imageRatio` | `ImageRatio` | `ImageRatio.half` | Size ratio (`oneThird`, `half`, `twoThirds`, `full`) |
| `customImageWidth` | `double?` | `null` | Custom width (overrides ratio) |
| `customImageHeight` | `double?` | `null` | Custom height (overrides ratio) |
| `imageBorderRadius` | `double?` | `8.0` | Border radius for the image |
| `imageFit` | `BoxFit` | `BoxFit.cover` | How image should fit its container |

#### 💖 Interactive Overlays

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `showLikeIcon` | `bool` | `false` | Show like/heart icon on image |
| `likeIconPosition` | `OverlayPosition` | `OverlayPosition.topRight` | Position of like icon |
| `likeIcon` | `IconData` | `Icons.favorite` | Icon for like button |
| `likeIconColor` | `Color?` | `null` | Color of like icon |
| `likeIconSize` | `double` | `24.0` | Size of like icon |
| `isLiked` | `bool` | `false` | Current like state |
| `onLikeTap` | `VoidCallback?` | `null` | Callback when like icon is tapped |
| `showBookmarkIcon` | `bool` | `false` | Show bookmark/save icon |
| `bookmarkIconPosition` | `OverlayPosition` | `OverlayPosition.topLeft` | Position of bookmark icon |
| `bookmarkIcon` | `IconData` | `Icons.bookmark` | Icon for bookmark button |
| `bookmarkIconColor` | `Color?` | `null` | Color of bookmark icon |
| `bookmarkIconSize` | `double` | `24.0` | Size of bookmark icon |
| `isBookmarked` | `bool` | `false` | Current bookmark state |
| `onBookmarkTap` | `VoidCallback?` | `null` | Callback when bookmark is tapped |
| `statusChips` | `List<StatusChip>?` | `null` | Status chips displayed on image |

#### 📝 Content System

**Title Properties:**

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String?` | `null` | Main title text |
| `titleFontSize` | `double?` | `18.0` | Font size of title |
| `titleFontWeight` | `FontWeight?` | `FontWeight.bold` | Font weight of title |
| `titleColor` | `Color?` | `Colors.black87` | Color of title text |
| `titleFontFamily` | `String?` | `null` | Font family for title |
| `titleAlignment` | `ContentAlignment` | `ContentAlignment.left` | Alignment of title |
| `titleMaxLines` | `int?` | `null` | Maximum lines for title |
| `titleOverflow` | `TextOverflow?` | `TextOverflow.ellipsis` | Overflow behavior for title |

**Description Properties:**

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `description` | `String?` | `null` | Description/subtitle text |
| `descriptionFontSize` | `double?` | `14.0` | Font size of description |
| `descriptionFontWeight` | `FontWeight?` | `FontWeight.normal` | Font weight of description |
| `descriptionColor` | `Color?` | `Colors.grey[600]` | Color of description text |
| `descriptionFontFamily` | `String?` | `null` | Font family for description |
| `descriptionAlignment` | `ContentAlignment` | `ContentAlignment.left` | Alignment of description |
| `descriptionMaxLines` | `int?` | `null` | Maximum lines for description |
| `descriptionOverflow` | `TextOverflow?` | `TextOverflow.ellipsis` | Overflow behavior |

#### ⭐ Rating System

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `rating` | `double?` | `null` | Current rating value (0.0 to maxRating) |
| `maxRating` | `int` | `5` | Maximum rating value |
| `ratingStarSize` | `double` | `16.0` | Size of rating stars |
| `ratingFilledColor` | `Color?` | `Colors.orange` | Color of filled stars |
| `ratingEmptyColor` | `Color?` | `Colors.grey[300]` | Color of empty stars |
| `showRatingNumber` | `bool` | `true` | Show rating number next to stars |
| `customRatingText` | `String?` | `null` | Custom text instead of rating number |
| `onRatingChanged` | `ValueChanged<double>?` | `null` | Callback when rating is changed |

#### 🏷️ Chip System

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `chips` | `List<String>?` | `null` | Simple text chips |
| `chipPosition` | `ContentChipPosition` | `ContentChipPosition.afterTitle` | Position relative to title |
| `chipBackgroundColor` | `Color?` | `Colors.grey[200]` | Background color of chips |
| `chipTextColor` | `Color?` | `Colors.grey[700]` | Text color of chips |
| `chipFontSize` | `double?` | `12.0` | Font size of chip text |
| `chipFontWeight` | `FontWeight?` | `FontWeight.w500` | Font weight of chip text |
| `chipBorderRadius` | `double?` | `16.0` | Border radius of chips |
| `onChipTap` | `VoidCallback?` | `null` | Callback when chip is tapped |
| `customChips` | `List<ContentChip>?` | `null` | Advanced chips with icons and styling |

#### 📊 Metrics Grid

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `metrics` | `List<MetricItem>?` | `null` | List of metrics to display |
| `metricsColumns` | `int` | `3` | Number of columns in grid |
| `metricsSpacing` | `double` | `16.0` | Spacing between metric items |
| `showMetricsDividers` | `bool` | `false` | Show dividers between metrics |
| `metricsBackgroundColor` | `Color?` | `null` | Background color of metrics section |

#### 🔗 Icon-Text Pairs

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `iconTextPairs` | `List<IconTextPair>?` | `null` | List of icon-text combinations |

#### 💰 Price Display

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `price` | `String?` | `null` | Price text to display |
| `priceFontSize` | `double?` | `18.0` | Font size of price |
| `priceFontWeight` | `FontWeight?` | `FontWeight.bold` | Font weight of price |
| `priceColor` | `Color?` | `Colors.blue` | Color of price text |
| `priceAlignment` | `ContentAlignment` | `ContentAlignment.left` | Alignment of price |

#### 🔘 Button System

**Primary Button Properties:**

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `buttonText` | `String?` | `null` | Text displayed on button |
| `buttonIcon` | `IconData?` | `null` | Icon displayed on button |
| `buttonIconOnRight` | `bool` | `false` | Position icon on right side of text |
| `buttonStyle` | `CardButtonStyle` | `CardButtonStyle.elevated` | Style of button |
| `buttonPosition` | `ButtonPosition` | `ButtonPosition.fullWidth` | Position/alignment of button |
| `buttonBackgroundColor` | `Color?` | `null` | Background color of button |
| `buttonTextColor` | `Color?` | `null` | Text color of button |
| `buttonBorderColor` | `Color?` | `null` | Border color (for outlined style) |
| `buttonBorderWidth` | `double` | `1.5` | Width of button border |
| `buttonFontSize` | `double?` | `16.0` | Font size of button text |
| `buttonFontWeight` | `FontWeight?` | `FontWeight.w600` | Font weight of button text |
| `buttonPadding` | `EdgeInsetsGeometry?` | `null` | Custom padding for button |
| `buttonBorderRadius` | `double?` | `8.0` | Border radius of button |
| `buttonWidth` | `double?` | `null` | Custom width of button |
| `buttonHeight` | `double?` | `null` | Custom height of button |
| `buttonIconSize` | `double` | `20.0` | Size of button icon |
| `buttonIconTextSpacing` | `double` | `8.0` | Spacing between icon and text |
| `buttonElevation` | `double` | `2.0` | Elevation of elevated buttons |
| `buttonHoverColor` | `Color?` | `null` | Color when button is hovered |
| `buttonIsLoading` | `bool` | `false` | Show loading indicator |
| `buttonIsDisabled` | `bool` | `false` | Disable button interaction |
| `onButtonPressed` | `VoidCallback?` | `null` | Callback when button is pressed |

**Multiple Buttons:**

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `secondaryButton` | `CardButton?` | `null` | Secondary button widget |
| `buttons` | `List<CardButton>?` | `null` | List of custom buttons |
| `buttonSpacing` | `double` | `12.0` | Spacing between multiple buttons |
| `buttonDirection` | `Axis` | `Axis.horizontal` | Direction of button layout |
| `buttonAlignment` | `MainAxisAlignment` | `MainAxisAlignment.center` | Alignment of button group |

#### 📏 Layout

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `contentSpacing` | `double` | `8.0` | Spacing between content sections |
| `child` | `Widget?` | `null` | Custom child widget (overrides structured content) |

### 🎛️ Enums Reference

#### ImagePosition
- `ImagePosition.top` - Image at the top of content
- `ImagePosition.left` - Image on the left side
- `ImagePosition.right` - Image on the right side  
- `ImagePosition.background` - Image as background with overlay

#### ImageRatio
- `ImageRatio.oneThird` - 1/3 of available space
- `ImageRatio.half` - 1/2 of available space
- `ImageRatio.twoThirds` - 2/3 of available space
- `ImageRatio.full` - Full available space

#### OverlayPosition
- `OverlayPosition.topLeft` - Top-left corner
- `OverlayPosition.topRight` - Top-right corner
- `OverlayPosition.bottomLeft` - Bottom-left corner
- `OverlayPosition.bottomRight` - Bottom-right corner

#### ContentAlignment
- `ContentAlignment.left` - Left aligned
- `ContentAlignment.center` - Center aligned
- `ContentAlignment.right` - Right aligned

#### ContentChipPosition
- `ContentChipPosition.beforeTitle` - Above the title
- `ContentChipPosition.afterTitle` - Below the title
- `ContentChipPosition.rightOfTitle` - Right side of title (same line)

#### CardButtonStyle
- `CardButtonStyle.elevated` - Filled button with shadow
- `CardButtonStyle.outlined` - Border button
- `CardButtonStyle.text` - Text-only button
- `CardButtonStyle.icon` - Icon-only button
- `CardButtonStyle.iconText` - Icon + text button

#### ButtonPosition
- `ButtonPosition.left` - Left aligned
- `ButtonPosition.center` - Center aligned
- `ButtonPosition.right` - Right aligned
- `ButtonPosition.fullWidth` - Full width button

### 🛠️ Helper Classes

#### StatusChip
```dart
StatusChip(
  text: 'Featured',
  position: ChipPosition.topRight,
  backgroundColor: Colors.orange,
  textColor: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.w600,
  borderRadius: 8,
)
```

#### ContentChip
```dart
ContentChip(
  text: 'Premium',
  backgroundColor: Colors.blue[100],
  textColor: Colors.blue[700],
  prefixIcon: Icons.star,
  iconColor: Colors.blue,
  fontSize: 12,
  borderRadius: 16,
  onTap: () {
    // Handle chip tap
  },
)
```

#### MetricItem
```dart
MetricItem(
  label: 'Revenue',
  value: '\$24.8K',
  labelColor: Colors.grey[600],
  labelFontSize: 12,
  valueColor: Colors.green[700],
  valueFontWeight: FontWeight.bold,
  valueFontSize: 16,
)
```

#### IconTextPair
```dart
IconTextPair(
  icon: Icons.location_on,
  text: 'San Francisco',
  iconColor: Colors.grey[500],
  textStyle: TextStyle(
    fontSize: 14,
    color: Colors.grey[600],
  ),
)
```

#### CardButton
```dart
CardButton(
  text: 'Get Started',
  icon: Icons.play_arrow,
  style: CardButtonStyle.elevated,
  backgroundColor: Colors.blue,
  textColor: Colors.white,
  borderRadius: 10,
  height: 44,
  onPressed: () {
    // Handle button press
  },
)
```

## 🎨 Customization Examples

### Creating Custom Themes

```dart
// Dark theme card
AdvancedCard(
  backgroundColor: Colors.grey[900],
  borderColor: Colors.grey[700],
  titleColor: Colors.white,
  descriptionColor: Colors.grey[300],
  shadowColor: Colors.black.withOpacity(0.5),
  // ... other properties
)

// Glassmorphism effect
AdvancedCard(
  backgroundColor: Colors.white.withOpacity(0.1),
  borderWidth: 1,
  borderColor: Colors.white.withOpacity(0.2),
  customShadows: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 20,
      spreadRadius: 0,
    ),
  ],
  // ... other properties
)
```

### Responsive Design

```dart
LayoutBuilder(
  builder: (context, constraints) {
    return AdvancedCard(
      fullWidth: true,
      titleFontSize: constraints.maxWidth > 600 ? 24 : 18,
      descriptionFontSize: constraints.maxWidth > 600 ? 16 : 14,
      imageRatio: constraints.maxWidth > 600 
          ? ImageRatio.half 
          : ImageRatio.oneThird,
      // ... other responsive properties
    );
  },
)
```

## 🏆 Best Practices

### Performance Tips

1. **Use `fullWidth: true`** instead of setting specific widths when possible
2. **Optimize images** before using them in cards
3. **Limit the number of chips** and metrics for better performance
4. **Use `isDisabled: true`** instead of removing buttons to maintain layout

### Design Guidelines

1. **Consistent spacing** - Use the same `contentSpacing` throughout your app
2. **Color harmony** - Stick to your app's color palette
3. **Typography hierarchy** - Use different font sizes to create visual hierarchy
4. **Accessibility** - Ensure sufficient color contrast and touch targets

### Common Patterns

```dart
// E-commerce product card
AdvancedCard(
  cardImage: product.imageUrl,
  imagePosition: ImagePosition.top,
  showLikeIcon: true,
  title: product.name,
  description: product.description,
  price: '\$${product.price}',
  rating: product.rating,
  buttonText: 'Add to Cart',
  onButtonPressed: () => addToCart(product),
)

// Social media post card
AdvancedCard(
  cardImage: post.authorAvatar,
  imagePosition: ImagePosition.left,
  imageRatio: ImageRatio.oneThird,
  title: post.authorName,
  description: post.content,
  iconTextPairs: [
    IconTextPair(icon: Icons.favorite, text: '${post.likes}'),
    IconTextPair(icon: Icons.comment, text: '${post.comments}'),
  ],
  buttons: [
    CardButton(text: 'Like', style: CardButtonStyle.text),
    CardButton(text: 'Comment', style: CardButtonStyle.text),
  ],
)

// Dashboard metric card
AdvancedCard(
  backgroundColor: Colors.blue[50],
  title: 'Monthly Revenue',
  customChips: [
    ContentChip(
      text: '+15.3%',
      backgroundColor: Colors.green[100],
      textColor: Colors.green[700],
      prefixIcon: Icons.trending_up,
    ),
  ],
  metrics: [
    MetricItem(label: 'This Month', value: '\$125.4K'),
    MetricItem(label: 'Last Month', value: '\$108.9K'),
  ],
  metricsColumns: 2,
)
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Support

If you find this package helpful, please:

- ⭐ Star the [repository](https://github.com/Musaid1234/flutter_advanced_cards)
- 🐛 Report issues on [GitHub](https://github.com/Musaid1234/flutter_advanced_cards/issues)
- 💬 Join our [Discord community](https://discord.gg/flutter-advanced-cards)

## 📞 Contact

- **Author**: Musaid
- **Email**: musaid1234@example.com
- **GitHub**: [@Musaid1234](https://github.com/Musaid1234)

---

Made with ❤️ for the Flutter community