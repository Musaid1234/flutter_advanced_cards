// FILE: lib/widgets/card_components/card_layout_builder.dart
// Create this new file

import 'package:flutter/material.dart';
import 'card_image.dart';
import 'card_content.dart';

/// Helper class for building card layouts with images
class CardLayoutBuilder {
  
  /// Build layout with image if provided
  static Widget buildLayoutWithImage({
    required Widget contentWidget,
    EdgeInsetsGeometry? padding,
    
    // Image properties
    dynamic cardImage,
    ImagePosition imagePosition = ImagePosition.top,
    ImageRatio imageRatio = ImageRatio.half,
    double? customImageWidth,
    double? customImageHeight,
    double? imageBorderRadius,
    BoxFit imageFit = BoxFit.cover,
    
    // Overlay properties
    bool showLikeIcon = false,
    OverlayPosition likeIconPosition = OverlayPosition.topRight,
    IconData likeIcon = Icons.favorite,
    Color? likeIconColor,
    double likeIconSize = 24.0,
    bool isLiked = false,
    VoidCallback? onLikeTap,
    
    bool showBookmarkIcon = false,
    OverlayPosition bookmarkIconPosition = OverlayPosition.topLeft,
    IconData bookmarkIcon = Icons.bookmark,
    Color? bookmarkIconColor,
    double bookmarkIconSize = 24.0,
    bool isBookmarked = false,
    VoidCallback? onBookmarkTap,
    
    List<StatusChip>? statusChips,
  }) {
    // If no image, just return content with padding
    if (cardImage == null) {
      return Padding(
        padding: padding ?? EdgeInsets.all(16.0),
        child: contentWidget,
      );
    }
    
    // Create image widget
    CardImage imageWidget = CardImage(
      image: cardImage,
      position: imagePosition,
      ratio: imageRatio,
      customWidth: customImageWidth,
      customHeight: customImageHeight,
      imageBorderRadius: imageBorderRadius,
      fit: imageFit,
      
      // Overlay properties
      showLikeIcon: showLikeIcon,
      likeIconPosition: likeIconPosition,
      likeIcon: likeIcon,
      likeIconColor: likeIconColor,
      likeIconSize: likeIconSize,
      isLiked: isLiked,
      onLikeTap: onLikeTap,
      
      showBookmarkIcon: showBookmarkIcon,
      bookmarkIconPosition: bookmarkIconPosition,
      bookmarkIcon: bookmarkIcon,
      bookmarkIconColor: bookmarkIconColor,
      bookmarkIconSize: bookmarkIconSize,
      isBookmarked: isBookmarked,
      onBookmarkTap: onBookmarkTap,
      
      statusChips: statusChips,
    );
    
    // Build layout based on image position
    switch (imagePosition) {
      case ImagePosition.top:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageWidget,
            Padding(
              padding: padding ?? EdgeInsets.all(16.0),
              child: contentWidget,
            ),
          ],
        );
        
      case ImagePosition.left:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageWidget,
            SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: padding ?? EdgeInsets.all(16.0),
                child: contentWidget,
              ),
            ),
          ],
        );
        
      case ImagePosition.right:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: padding ?? EdgeInsets.all(16.0),
                child: contentWidget,
              ),
            ),
            SizedBox(width: 12),
            imageWidget,
          ],
        );
        
      case ImagePosition.background:
        return Stack(
          children: [
            imageWidget,
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                padding: padding ?? EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: contentWidget,
                ),
              ),
            ),
          ],
        );
    }
  }
  
  static Widget buildCardContent({
    Widget? child,
    EdgeInsetsGeometry? padding,
    
    String? title,
    double? titleFontSize,
    FontWeight? titleFontWeight,
    Color? titleColor,
    String? titleFontFamily,
    ContentAlignment titleAlignment = ContentAlignment.left,
    int? titleMaxLines,
    TextOverflow? titleOverflow,
    
    String? description,
    double? descriptionFontSize,
    FontWeight? descriptionFontWeight,
    Color? descriptionColor,
    String? descriptionFontFamily,
    ContentAlignment descriptionAlignment = ContentAlignment.left,
    int? descriptionMaxLines,
    TextOverflow? descriptionOverflow,
    
    double? rating,
    int maxRating = 5,
    double ratingStarSize = 16.0,
    Color? ratingFilledColor,
    Color? ratingEmptyColor,
    bool showRatingNumber = true,
    String? customRatingText,
    ValueChanged<double>? onRatingChanged,
    
    List<String>? chips,
    ContentChipPosition chipPosition = ContentChipPosition.afterTitle,
    Color? chipBackgroundColor,
    Color? chipTextColor,
    double? chipFontSize,
    FontWeight? chipFontWeight,
    double? chipBorderRadius,
    VoidCallback? onChipTap,
    List<ContentChip>? customChips,
    
    List<MetricItem>? metrics,
    int metricsColumns = 3,
    double metricsSpacing = 16.0,
    bool showMetricsDividers = false,
    Color? metricsBackgroundColor,
    
    List<IconTextPair>? iconTextPairs,
    
    String? price,
    double? priceFontSize,
    FontWeight? priceFontWeight,
    Color? priceColor,
    ContentAlignment priceAlignment = ContentAlignment.left,
    
    double contentSpacing = 8.0,
    
    dynamic cardImage,
    ImagePosition imagePosition = ImagePosition.top,
    ImageRatio imageRatio = ImageRatio.half,
    double? customImageWidth,
    double? customImageHeight,
    double? imageBorderRadius,
    BoxFit imageFit = BoxFit.cover,
    
    bool showLikeIcon = false,
    OverlayPosition likeIconPosition = OverlayPosition.topRight,
    IconData likeIcon = Icons.favorite,
    Color? likeIconColor,
    double likeIconSize = 24.0,
    bool isLiked = false,
    VoidCallback? onLikeTap,
    
    bool showBookmarkIcon = false,
    OverlayPosition bookmarkIconPosition = OverlayPosition.topLeft,
    IconData bookmarkIcon = Icons.bookmark,
    Color? bookmarkIconColor,
    double bookmarkIconSize = 24.0,
    bool isBookmarked = false,
    VoidCallback? onBookmarkTap,
    
    List<StatusChip>? statusChips,
  }) {
    Widget contentWidget;
    
    if (child != null) {
      contentWidget = child;
    } else {
      contentWidget = _buildStructuredContentPlaceholder();
    }
    
    return buildLayoutWithImage(
      contentWidget: contentWidget,
      padding: padding,
      cardImage: cardImage,
      imagePosition: imagePosition,
      imageRatio: imageRatio,
      customImageWidth: customImageWidth,
      customImageHeight: customImageHeight,
      imageBorderRadius: imageBorderRadius,
      imageFit: imageFit,
      showLikeIcon: showLikeIcon,
      likeIconPosition: likeIconPosition,
      likeIcon: likeIcon,
      likeIconColor: likeIconColor,
      likeIconSize: likeIconSize,
      isLiked: isLiked,
      onLikeTap: onLikeTap,
      showBookmarkIcon: showBookmarkIcon,
      bookmarkIconPosition: bookmarkIconPosition,
      bookmarkIcon: bookmarkIcon,
      bookmarkIconColor: bookmarkIconColor,
      bookmarkIconSize: bookmarkIconSize,
      isBookmarked: isBookmarked,
      onBookmarkTap: onBookmarkTap,
      statusChips: statusChips,
    );
  }
  
  static Widget _buildStructuredContentPlaceholder() {
    return SizedBox.shrink();
  }
}