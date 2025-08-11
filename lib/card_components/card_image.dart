// FILE: lib/widgets/card_components/card_image.dart
import 'package:flutter/material.dart';

enum ImagePosition {
  top,        
  left,     
  right,     
  background,
}

enum ImageRatio {
  oneThird,  
  half,      
  twoThirds, 
  full,       
}

enum OverlayPosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class CardImage extends StatelessWidget{
  final dynamic image;

  final ImagePosition position;
  final ImageRatio ratio;
  final double? customWidth;
  final double? customHeight;
  final double? imageBorderRadius;
  final BorderRadiusGeometry? customImageBorderRadius;
  final BoxFit fit;
  final bool showLikeIcon;
  final OverlayPosition likeIconPosition;
  final IconData likeIcon;
  final Color? likeIconColor;
  final double likeIconSize;
  final bool isLiked;
  final VoidCallback? onLikeTap;
  final bool showBookmarkIcon;
  final OverlayPosition bookmarkIconPosition;
  final IconData bookmarkIcon;
  final Color ? bookmarkIconColor;
  final double bookmarkIconSize;
  final bool isBookmarked;
  final VoidCallback? onBookmarkTap;
  final List<StatusChip> ? statusChips;

  const CardImage({
    Key? key,
    required this.image,
    this.position = ImagePosition.top,
    this.ratio = ImageRatio.half,
    this.customWidth,
    this.customHeight,
    this.imageBorderRadius,
    this.customImageBorderRadius,
    this.fit = BoxFit.cover,
    
    // Like icon
    this.showLikeIcon = false,
    this.likeIconPosition = OverlayPosition.topRight,
    this.likeIcon = Icons.favorite,
    this.likeIconColor,
    this.likeIconSize = 24.0,
    this.isLiked = false,
    this.onLikeTap,
    
    // Bookmark icon  
    this.showBookmarkIcon = false,
    this.bookmarkIconPosition = OverlayPosition.topLeft,
    this.bookmarkIcon = Icons.bookmark,
    this.bookmarkIconColor,
    this.bookmarkIconSize = 24.0,
    this.isBookmarked = false,
    this.onBookmarkTap,
    
    this.statusChips,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size imageSize = _calculateImageSize(context);

    Widget imageWidget = _buildImageWidget(imageSize);

    if (showLikeIcon || showBookmarkIcon || statusChips != null) {
      imageWidget = _buildImageWithOverlays(imageWidget, imageSize);
    }

    return imageWidget;
  }

  Size _calculateImageSize(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double cardWidth = screenSize.width - 32;


    if (customWidth != null && customHeight != null) {
      return Size(customWidth!, customHeight!);
    }

    double width, height;

    switch (position) {
      case ImagePosition.top:
        width = cardWidth;
        height = _getRatioHeight(cardWidth);
        break;
      case ImagePosition.left:
      case ImagePosition.right:
        width = _getRatioWidth(cardWidth);
        height = customHeight ?? 120;
        break;
      case ImagePosition.background:
        width = cardWidth;
        height = customHeight ?? 200;
        break;
    }

    return Size(width, height);
  } 

  double _getRatioHeight(double width) {
    switch(ratio) {
      case ImageRatio.oneThird:
        return width * 0.33;
      case ImageRatio.half:
        return width * 0.5;
      case ImageRatio.twoThirds:
        return width * 0.66;
      case ImageRatio.full:
        return width * 0.75;
    }
  }

  double _getRatioWidth(double cardWidth) {
    switch (ratio) {
      case ImageRatio.oneThird:
        return cardWidth * 0.33;
      case ImageRatio.half:
        return cardWidth * 0.5;
      case ImageRatio.twoThirds:
        return cardWidth * 0.66;
      case ImageRatio.full:
        return cardWidth;
    }
  }

Widget _buildImageWidget(Size size) {
  BorderRadiusGeometry effectiveRadius = customImageBorderRadius ?? 
      BorderRadius.circular(imageBorderRadius ?? 8.0);

  Widget imageChild;
  
  BoxFit effectiveFit = position == ImagePosition.background ? BoxFit.cover : fit;

  if (image is String) {
    if (image.startsWith('http')) {
      imageChild = Image.network(
        image,
        width: size.width,
        height: size.height,
        fit: effectiveFit,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: size.width,
            height: size.height,
            color: Colors.grey[300],
            child: Icon(Icons.broken_image, color: Colors.grey[600]),
          );
        },
      );
    } else {
      imageChild = Image.asset(
        image,
        width: size.width,
        height: size.height,
        fit: effectiveFit,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: size.width,
            height: size.height,
            color: Colors.grey[300],
            child: Icon(Icons.broken_image, color: Colors.grey[600]),
          );
        },
      );
    }
  } else if (image is Widget) {
    imageChild = SizedBox(
      width: size.width,
      height: size.height,
      child: image,
    );
  } else {
    imageChild = Container(
      width: size.width,
      height: size.height,
      color: Colors.grey[300],
      child: Icon(Icons.image, color: Colors.grey[600]),
    );
  }

  return ClipRRect(
    borderRadius: effectiveRadius,
    child: imageChild,
  );
}

  Widget _buildImageWithOverlays(Widget imageWidget, Size imageSize) {
    return Stack(
      children: [
        imageWidget,
        
        if (showLikeIcon)
          _buildOverlayIcon(
            icon: isLiked ? likeIcon : Icons.favorite_border,
            color: isLiked 
                ? (likeIconColor ?? Colors.red)
                : (likeIconColor ?? Colors.white),
            size: likeIconSize,
            position: likeIconPosition,
            onTap: onLikeTap,
            imageSize: imageSize,
          ),
        
        if (showBookmarkIcon)
          _buildOverlayIcon(
            icon: isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: isBookmarked
                ? (bookmarkIconColor ?? Colors.blue)
                : (bookmarkIconColor ?? Colors.white),
            size: bookmarkIconSize,
            position: bookmarkIconPosition,
            onTap: onBookmarkTap,
            imageSize: imageSize,
          ),
        
        if (statusChips != null)
          ...statusChips!.map((chip) => _buildStatusChip(chip, imageSize)).toList(),
      ],
    );
  }

  Widget _buildOverlayIcon({
    required IconData icon,
    required Color color,
    required double size,
    required OverlayPosition position,
    required VoidCallback? onTap,
    required Size imageSize,
  }) {
    double top, bottom, left, right;
    const double padding = 8.0;
    
    switch (position) {
      case OverlayPosition.topLeft:
        top = padding;
        left = padding;
        bottom = double.nan;
        right = double.nan;
        break;
      case OverlayPosition.topRight:
        top = padding;
        right = padding;
        bottom = double.nan;
        left = double.nan;
        break;
      case OverlayPosition.bottomLeft:
        bottom = padding;
        left = padding;
        top = double.nan;
        right = double.nan;
        break;
      case OverlayPosition.bottomRight:
        bottom = padding;
        right = padding;
        top = double.nan;
        left = double.nan;
        break;
    }
    
    return Positioned(
      top: top.isNaN ? null : top,
      bottom: bottom.isNaN ? null : bottom,
      left: left.isNaN ? null : left,
      right: right.isNaN ? null : right,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            icon,
            color: color,
            size: size,
          ),
        ),
      ),
    );
  }

    Widget _buildStatusChip(StatusChip chip, Size imageSize) {
    return Positioned(
      top: chip.position.top,
      bottom: chip.position.bottom,
      left: chip.position.left,
      right: chip.position.right,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: chip.backgroundColor ?? Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(chip.borderRadius ?? 12),
        ),
        child: Text(
          chip.text,
          style: TextStyle(
            color: chip.textColor ?? Colors.white,
            fontSize: chip.fontSize ?? 12,
            fontWeight: chip.fontWeight ?? FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class StatusChip {
  final String text;
  
  final ChipPosition position;
  
  final Color? backgroundColor;
  
  final Color? textColor;
  
  final double? fontSize;
  
  final FontWeight? fontWeight;
  
  final double? borderRadius;

  const StatusChip({
    required this.text,
    required this.position,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
  });
}

class ChipPosition {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const ChipPosition({
    this.top,
    this.bottom,
    this.left,
    this.right,
  });
  
  static const ChipPosition topLeft = ChipPosition(top: 8, left: 8);
  static const ChipPosition topRight = ChipPosition(top: 8, right: 8);
  static const ChipPosition bottomLeft = ChipPosition(bottom: 8, left: 8);
  static const ChipPosition bottomRight = ChipPosition(bottom: 8, right: 8);
}