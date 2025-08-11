// FILE: lib/widgets/card_components/card_content_builder.dart

import 'package:flutter/material.dart';
import 'card_content.dart';

class CardContentBuilder {
  
  static Widget buildStructuredContent({
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
  }) {
    List<Widget> contentChildren = [];
    
    if (chipPosition == ContentChipPosition.beforeTitle && (chips != null || customChips != null)) {
      contentChildren.add(_buildChipsSection(
        chips: chips,
        customChips: customChips,
        chipBackgroundColor: chipBackgroundColor,
        chipTextColor: chipTextColor,
        chipFontSize: chipFontSize,
        chipFontWeight: chipFontWeight,
        chipBorderRadius: chipBorderRadius,
        onChipTap: onChipTap,
      ));
      contentChildren.add(SizedBox(height: contentSpacing));
    }
    
    if (title != null) {
      if (chipPosition == ContentChipPosition.rightOfTitle && (chips != null || customChips != null)) {
        contentChildren.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildTitle(
                text: title,
                fontSize: titleFontSize,
                fontWeight: titleFontWeight,
                color: titleColor,
                fontFamily: titleFontFamily,
                alignment: titleAlignment,
                maxLines: titleMaxLines,
                overflow: titleOverflow,
              )),
              SizedBox(width: 8),
              _buildChipsSection(
                chips: chips,
                customChips: customChips,
                chipBackgroundColor: chipBackgroundColor,
                chipTextColor: chipTextColor,
                chipFontSize: chipFontSize,
                chipFontWeight: chipFontWeight,
                chipBorderRadius: chipBorderRadius,
                onChipTap: onChipTap,
              ),
            ],
          ),
        );
      } else {
        contentChildren.add(_buildTitle(
          text: title,
          fontSize: titleFontSize,
          fontWeight: titleFontWeight,
          color: titleColor,
          fontFamily: titleFontFamily,
          alignment: titleAlignment,
          maxLines: titleMaxLines,
          overflow: titleOverflow,
        ));
      }
      contentChildren.add(SizedBox(height: contentSpacing));
    }
    
    if (chipPosition == ContentChipPosition.afterTitle && (chips != null || customChips != null)) {
      contentChildren.add(_buildChipsSection(
        chips: chips,
        customChips: customChips,
        chipBackgroundColor: chipBackgroundColor,
        chipTextColor: chipTextColor,
        chipFontSize: chipFontSize,
        chipFontWeight: chipFontWeight,
        chipBorderRadius: chipBorderRadius,
        onChipTap: onChipTap,
      ));
      contentChildren.add(SizedBox(height: contentSpacing));
    }
    
    if (description != null) {
      contentChildren.add(_buildDescription(
        text: description,
        fontSize: descriptionFontSize,
        fontWeight: descriptionFontWeight,
        color: descriptionColor,
        fontFamily: descriptionFontFamily,
        alignment: descriptionAlignment,
        maxLines: descriptionMaxLines,
        overflow: descriptionOverflow,
      ));
      contentChildren.add(SizedBox(height: contentSpacing));
    }
    
    if (rating != null) {
      contentChildren.add(_buildRating(
        rating: rating,
        maxRating: maxRating,
        ratingStarSize: ratingStarSize,
        ratingFilledColor: ratingFilledColor,
        ratingEmptyColor: ratingEmptyColor,
        showRatingNumber: showRatingNumber,
        customRatingText: customRatingText,
        onRatingChanged: onRatingChanged,
      ));
      contentChildren.add(SizedBox(height: contentSpacing));
    }
    
    if (iconTextPairs != null && iconTextPairs.isNotEmpty) {
      contentChildren.add(_buildIconTextPairs(iconTextPairs));
      contentChildren.add(SizedBox(height: contentSpacing));
    }
    
    if (metrics != null && metrics.isNotEmpty) {
      contentChildren.add(_buildMetricsGrid(
        metrics: metrics,
        metricsColumns: metricsColumns,
        metricsSpacing: metricsSpacing,
        showMetricsDividers: showMetricsDividers,
        metricsBackgroundColor: metricsBackgroundColor,
      ));
      contentChildren.add(SizedBox(height: contentSpacing));
    }
    
    if (price != null) {
      contentChildren.add(_buildPrice(
        price: price,
        priceFontSize: priceFontSize,
        priceFontWeight: priceFontWeight,
        priceColor: priceColor,
        priceAlignment: priceAlignment,
      ));
    }
    
    // Remove trailing spacing if exists
    if (contentChildren.isNotEmpty && contentChildren.last is SizedBox) {
      contentChildren.removeLast();
    }
    
    return contentChildren.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: contentChildren,
          )
        : SizedBox.shrink();
  }
  
  static Widget _buildTitle({
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    String? fontFamily,
    ContentAlignment alignment = ContentAlignment.left,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return CardTitle(
      text: text,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      alignment: alignment,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
  
  static Widget _buildDescription({
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    String? fontFamily,
    ContentAlignment alignment = ContentAlignment.left,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return CardDescription(
      text: text,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      alignment: alignment,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
  
  static Widget _buildRating({
    required double rating,
    int maxRating = 5,
    double ratingStarSize = 16.0,
    Color? ratingFilledColor,
    Color? ratingEmptyColor,
    bool showRatingNumber = true,
    String? customRatingText,
    ValueChanged<double>? onRatingChanged,
  }) {
    return CardRating(
      rating: rating,
      maxRating: maxRating,
      starSize: ratingStarSize,
      filledColor: ratingFilledColor,
      emptyColor: ratingEmptyColor,
      showRatingNumber: showRatingNumber,
      customText: customRatingText,
      onRatingChanged: onRatingChanged,
    );
  }
  
  static Widget _buildChipsSection({
    List<String>? chips,
    List<ContentChip>? customChips,
    Color? chipBackgroundColor,
    Color? chipTextColor,
    double? chipFontSize,
    FontWeight? chipFontWeight,
    double? chipBorderRadius,
    VoidCallback? onChipTap,
  }) {
    List<Widget> chipWidgets = [];
    
    if (chips != null) {
      chipWidgets.addAll(
        chips.map((chipText) => ContentChip(
          text: chipText,
          backgroundColor: chipBackgroundColor,
          textColor: chipTextColor,
          fontSize: chipFontSize,
          fontWeight: chipFontWeight,
          borderRadius: chipBorderRadius,
          onTap: onChipTap,
        )).toList(),
      );
    }
    
    if (customChips != null) {
      chipWidgets.addAll(customChips);
    }
    
    if (chipWidgets.isEmpty) return SizedBox.shrink();
    
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: chipWidgets,
    );
  }
  
  static Widget _buildIconTextPairs(List<IconTextPair> iconTextPairs) {
    return Wrap(
      spacing: 16.0,
      runSpacing: 8.0,
      children: iconTextPairs,
    );
  }
  
  static Widget _buildMetricsGrid({
    required List<MetricItem> metrics,
    int metricsColumns = 3,
    double metricsSpacing = 16.0,
    bool showMetricsDividers = false,
    Color? metricsBackgroundColor,
  }) {
    return CardMetricsGrid(
      metrics: metrics,
      columns: metricsColumns,
      spacing: metricsSpacing,
      showDividers: showMetricsDividers,
      backgroundColor: metricsBackgroundColor,
    );
  }
  
  static Widget _buildPrice({
    required String price,
    double? priceFontSize,
    FontWeight? priceFontWeight,
    Color? priceColor,
    ContentAlignment priceAlignment = ContentAlignment.left,
  }) {
    return Text(
      price,
      textAlign: _getTextAlignForPrice(priceAlignment),
      style: TextStyle(
        fontSize: priceFontSize ?? 18.0,
        fontWeight: priceFontWeight ?? FontWeight.bold,
        color: priceColor ?? Colors.blue,
      ),
    );
  }
  
  static TextAlign _getTextAlignForPrice(ContentAlignment priceAlignment) {
    switch (priceAlignment) {
      case ContentAlignment.left:
        return TextAlign.left;
      case ContentAlignment.center:
        return TextAlign.center;
      case ContentAlignment.right:
        return TextAlign.right;
    }
  }
}