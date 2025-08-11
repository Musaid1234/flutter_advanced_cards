import 'package:flutter/material.dart';

enum ContentAlignment {
  left,
  center,
  right,
}

enum ContentChipPosition  {
  beforeTitle,  // Chips appear above the title
  afterTitle,   // Chips appear below the title
  rightOfTitle, // Chips appear to the right of title (same line)
}

class CardTitle extends StatelessWidget {
  final String text;
  final double? fontSize;
  /// Font weight
  final FontWeight? fontWeight;
  /// Text color
  final Color? color;
  /// Font family
  final String? fontFamily;
  /// Text alignment
  final ContentAlignment alignment;
  /// Maximum number of lines
  final int? maxLines;
  /// Text overflow behavior
  final TextOverflow? overflow;
  /// Letter spacing
  final double? letterSpacing;
  /// Line height
  final double? height;

  const CardTitle({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.alignment = ContentAlignment.left,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: _getTextAlign(),
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 18.0,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Colors.black87,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        height: height,
      ),
    );
  }

  TextAlign _getTextAlign() {
    switch (alignment) {
      case ContentAlignment.left:
        return TextAlign.left;
      case ContentAlignment.center:
        return TextAlign.center;
      case ContentAlignment.right:
        return TextAlign.right;
    }
  }
}

class CardDescription extends StatelessWidget {
  final String text;
  /// Font size
  final double? fontSize;
  /// Font weight
  final FontWeight? fontWeight;
  /// Text color
  final Color? color;
  /// Font family
  final String? fontFamily;
  /// Text alignment
  final ContentAlignment alignment;
  /// Maximum number of lines
  final int? maxLines;
  /// Text overflow behavior
  final TextOverflow? overflow;
  /// Letter spacing
  final double? letterSpacing;
  /// Line height
  final double? height;

  const CardDescription({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.alignment = ContentAlignment.left,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Text(
        text,
        textAlign: _getTextAlign(),
        maxLines: maxLines,
        overflow: overflow ?? TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize ?? 14.0,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? Colors.grey[600],
          fontFamily: fontFamily,
          letterSpacing: letterSpacing,
          height: height,
        ),
    );
  }

    TextAlign _getTextAlign() {
      switch (alignment) {
        case ContentAlignment.left:
          return TextAlign.left;
        case ContentAlignment.center:
          return TextAlign.center;
        case ContentAlignment.right:
          return TextAlign.right;
      }
    }
}

class CardRating extends StatelessWidget {
    /// Rating value (0.0 to 5.0)
  final double rating;
  /// Maximum rating (default 5)
  final int maxRating;
  /// Size of each star
  final double starSize;
  /// Color of filled stars
  final Color? filledColor;
  /// Color of empty stars
  final Color? emptyColor;
  /// Show rating number next to stars
  final bool showRatingNumber;
  /// Custom text to show after rating
  final String? customText;
  /// Text style for rating number/custom text
  final TextStyle? textStyle;
  /// Spacing between stars
  final double spacing;
  /// Callback when a star is tapped (for interactive ratings)
  final ValueChanged<double>? onRatingChanged;

  const CardRating({
    Key? key,
    required this.rating,
    this.maxRating = 5,
    this.starSize = 16.0,
    this.filledColor,
    this.emptyColor,
    this.showRatingNumber = true,
    this.customText,
    this.textStyle,
    this.spacing = 2.0,
    this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(maxRating, (index) {
          return GestureDetector(
            onTap: onRatingChanged != null 
                ? () => onRatingChanged!(index + 1.0)
                : null,
            child: Padding(
              padding: EdgeInsets.only(right: spacing),
              child: Icon(
                _getStarIcon(index),
                size: starSize,
                color: _getStarColor(index),
              ),
            ),
          );
        }),
        
        if (showRatingNumber || customText != null) ...[
          SizedBox(width: 6),
          Text(
            customText ?? rating.toStringAsFixed(1),
            style: textStyle ?? TextStyle(
              fontSize: starSize * 0.75,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }

    IconData _getStarIcon(int index) {
    double starValue = index + 1.0;
    if (rating >= starValue) {
      return Icons.star; 
    } else if (rating >= starValue - 0.5) {
      return Icons.star_half; 
    } else {
      return Icons.star_border; 
    }
  }
  
  Color _getStarColor(int index) {
    double starValue = index + 1.0;
    if (rating >= starValue - 0.5) {
      return filledColor ?? Colors.orange;
    } else {
      return emptyColor ?? Colors.grey[300]!;
    }
  }
}

class ContentChip extends StatelessWidget {
  /// Text to display in the chip
  final String text;
  
  /// Background color
  final Color? backgroundColor;
  
  /// Text color
  final Color? textColor;
  
  /// Font size
  final double? fontSize;
  
  /// Font weight
  final FontWeight? fontWeight;
  
  /// Padding inside the chip
  final EdgeInsetsGeometry? padding;
  
  /// Border radius
  final double? borderRadius;
  
  /// Border color
  final Color? borderColor;
  
  /// Border width
  final double? borderWidth;
  
  /// Icon to show before text
  final IconData? prefixIcon;
  
  /// Icon to show after text
  final IconData? suffixIcon;
  
  /// Icon size
  final double? iconSize;
  
  /// Icon color
  final Color? iconColor;
  
  /// Callback when chip is tapped
  final VoidCallback? onTap;

  const ContentChip({
    Key? key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.prefixIcon,
    this.suffixIcon,
    this.iconSize,
    this.iconColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget chipContent = Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(borderRadius ?? 16),
        border: borderWidth != null && borderWidth! > 0
            ? Border.all(
                color: borderColor ?? Colors.grey[400]!,
                width: borderWidth!,
              )
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Prefix icon
          if (prefixIcon != null) ...[
            Icon(
              prefixIcon!,
              size: iconSize ?? 14,
              color: iconColor ?? textColor ?? Colors.grey[700],
            ),
            SizedBox(width: 4),
          ],
          
          // Text
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize ?? 12,
              fontWeight: fontWeight ?? FontWeight.w500,
              color: textColor ?? Colors.grey[700],
            ),
          ),
          
          // Suffix icon
          if (suffixIcon != null) ...[
            SizedBox(width: 4),
            Icon(
              suffixIcon!,
              size: iconSize ?? 14,
              color: iconColor ?? textColor ?? Colors.grey[700],
            ),
          ],
        ],
      ),
    );
    
    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: chipContent,
      );
    }
    
    return chipContent;
  }
}

class CardMetricsGrid extends StatelessWidget {
  /// List of metric items to display
  final List<MetricItem> metrics;
  /// Number of columns in the grid
  final int columns;
  /// Spacing between grid items
  final double spacing;
  /// Whether to show dividers between items
  final bool showDividers;
  /// Divider color
  final Color? dividerColor;
  /// Background color for the grid
  final Color? backgroundColor;
  /// Padding around the grid
  final EdgeInsetsGeometry? padding;
  /// Border radius for the grid container
  final double? borderRadius;

  const CardMetricsGrid({
    Key? key,
    required this.metrics,
    this.columns = 3,
    this.spacing = 16.0,
    this.showDividers = false,
    this.dividerColor,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: backgroundColor != null
          ? BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            )
          : null,
      child: _buildGrid(),
    );
  }
  
  Widget _buildGrid() {
    List<Widget> rows = [];
    
    for (int i = 0; i < metrics.length; i += columns) {
      List<Widget> rowChildren = [];
      
      for (int j = 0; j < columns && i + j < metrics.length; j++) {
        if (j > 0 && showDividers) {
          rowChildren.add(Container(
            width: 1,
            height: 40,
            color: dividerColor ?? Colors.grey[300],
          ));
        }
        
        rowChildren.add(
          Expanded(
            child: _buildMetricItem(metrics[i + j]),
          ),
        );
      }
      
      rows.add(Row(children: rowChildren));
      
      if (i + columns < metrics.length) {
        rows.add(SizedBox(height: spacing));
      }
    }
    
    return Column(children: rows);
  }
  
  Widget _buildMetricItem(MetricItem metric) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          metric.label,
          style: TextStyle(
            fontSize: metric.labelFontSize ?? 12,
            color: metric.labelColor ?? Colors.grey[600],
            fontWeight: metric.labelFontWeight ?? FontWeight.normal,
          ),
        ),
        SizedBox(height: 4),
        Text(
          metric.value,
          style: TextStyle(
            fontSize: metric.valueFontSize ?? 16,
            color: metric.valueColor ?? Colors.black87,
            fontWeight: metric.valueFontWeight ?? FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class MetricItem {
  /// Label text (e.g., "Asset Value")
  final String label;
  
  /// Value text (e.g., "₹5.42Cr")
  final String value;
  
  /// Label text styling
  final double? labelFontSize;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  
  /// Value text styling
  final double? valueFontSize;
  final Color? valueColor;
  final FontWeight? valueFontWeight;

  const MetricItem({
    required this.label,
    required this.value,
    this.labelFontSize,
    this.labelColor,
    this.labelFontWeight,
    this.valueFontSize,
    this.valueColor,
    this.valueFontWeight,
  });
}

/// Class for creating icon + text combinations
class IconTextPair extends StatelessWidget {
  /// Icon to display
  final IconData icon;
  
  /// Text to display
  final String text;
  
  /// Icon size
  final double? iconSize;
  
  /// Icon color
  final Color? iconColor;
  
  /// Text style
  final TextStyle? textStyle;
  
  /// Spacing between icon and text
  final double spacing;
  
  /// Whether icon should be on the right side
  final bool iconOnRight;

  const IconTextPair({
    Key? key,
    required this.icon,
    required this.text,
    this.iconSize,
    this.iconColor,
    this.textStyle,
    this.spacing = 4.0,
    this.iconOnRight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Icon(
      icon,
      size: iconSize ?? 16,
      color: iconColor ?? Colors.grey[600],
    );
    
    Widget textWidget = Text(
      text,
      style: textStyle ?? TextStyle(
        fontSize: 14,
        color: Colors.grey[700],
      ),
    );
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: iconOnRight
          ? [
              textWidget,
              SizedBox(width: spacing),
              iconWidget,
            ]
          : [
              iconWidget,
              SizedBox(width: spacing),
              textWidget,
            ],
    );
  }
}
