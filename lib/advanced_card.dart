import 'package:flutter/material.dart';
import 'card_components/card_image.dart';
import 'card_components/card_content.dart';
import 'card_components/card_content_builder.dart';
import 'card_components/card_layout_builder.dart';
import 'card_components/card_button.dart';

class AdvancedCard extends StatelessWidget {
    // Basic structure
    final double? width;
    final double? height;
    final bool fullWidth;
    final bool fullHeight;
    final Color? backgroundColor;
    final double? borderRadius;
    final BorderRadiusGeometry? customBorderRadius;
    final EdgeInsetsGeometry? padding;
    final EdgeInsetsGeometry? margin;
    // Border
    final double? borderWidth;
    final Color? borderColor;
    // Shadow
    final bool hasShadow;
    final Color? shadowColor;
    final double? shadowBlur;
    final double? shadowSpread;
    final Offset? shadowOffSet;
    final List<BoxShadow>? customShadows;
    // Interaction
    final VoidCallback? onTap;
    final VoidCallback? onLongPress;
    final bool enableHover;

    // image properties
    final dynamic cardImage;
    final ImagePosition imagePosition;
    final ImageRatio imageRatio;
    final double? customImageWidth;
    final double? customImageHeight;
    final double? imageBorderRadius;
    final BoxFit imageFit;

    // Overlay properties
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
    final Color? bookmarkIconColor;
    final double bookmarkIconSize;
    final bool isBookmarked;
    final VoidCallback? onBookmarkTap;
    final List<StatusChip>? statusChips;

    // Card title
    final String? title;
    /// Title styling
    final double? titleFontSize;
    final FontWeight? titleFontWeight;
    final Color? titleColor;
    final String? titleFontFamily;
    final ContentAlignment titleAlignment;
    final int? titleMaxLines;
    final TextOverflow? titleOverflow;
    /// Card description/subtitle
    final String? description;
    /// Description styling
    final double? descriptionFontSize;
    final FontWeight? descriptionFontWeight;
    final Color? descriptionColor;
    final String? descriptionFontFamily;
    final ContentAlignment descriptionAlignment;
    final int? descriptionMaxLines;
    final TextOverflow? descriptionOverflow;
      /// Rating system
    final double? rating;
    final int maxRating;
    final double ratingStarSize;
    final Color? ratingFilledColor;
    final Color? ratingEmptyColor;
    final bool showRatingNumber;
    final String? customRatingText;
    final ValueChanged<double>? onRatingChanged;
    /// Content chips
    final List<String>? chips;
    final ContentChipPosition chipPosition;
    final Color? chipBackgroundColor;
    final Color? chipTextColor;
    final double? chipFontSize;
    final FontWeight? chipFontWeight;
    final double? chipBorderRadius;
    final VoidCallback? onChipTap;
    /// Custom content chips (more advanced)
    final List<ContentChip>? customChips;
    /// Metrics grid
    final List<MetricItem>? metrics;
    final int metricsColumns;
    final double metricsSpacing;
    final bool showMetricsDividers;
    final Color? metricsBackgroundColor;
    /// Icon-text pairs (like bed, bath, parking icons)
    final List<IconTextPair>? iconTextPairs;
    /// Price display
    final String? price;
    final double? priceFontSize;
    final FontWeight? priceFontWeight;
    final Color? priceColor;
    final ContentAlignment priceAlignment;
    final double contentSpacing;
    // button
    final String? buttonText;
    final IconData? buttonIcon;
    final bool buttonIconOnRight;
    final CardButtonStyle buttonStyle;
    final ButtonPosition buttonPosition;
    final Color? buttonBackgroundColor;
    final Color? buttonTextColor;
    final Color? buttonBorderColor;
    final double buttonBorderWidth;
    final double? buttonFontSize;
    final FontWeight? buttonFontWeight;
    final EdgeInsetsGeometry? buttonPadding;
    final double? buttonBorderRadius;
    final double? buttonWidth;
    final double? buttonHeight;
    final double buttonIconSize;
    final double buttonIconTextSpacing;
    final double buttonElevation;
    final Color? buttonHoverColor;
    final bool buttonIsLoading;
    final bool buttonIsDisabled;
    final VoidCallback? onButtonPressed;
    final CardButton? secondaryButton;
    final List<CardButton>? buttons;
    final double buttonSpacing;
    final Axis buttonDirection;
    final MainAxisAlignment buttonAlignment;

    /// The main content inside the card
    final Widget? child;

    const AdvancedCard({
        super.key,

        this.width,
        this.height,
        this.fullWidth = false,
        this.fullHeight = false,
        this.backgroundColor,
        this.borderRadius,
        this.customBorderRadius,
        this.padding,
        this.margin,

        this.borderWidth,
        this.borderColor,

        this.hasShadow = true,
        this.shadowColor,
        this.shadowBlur,
        this.shadowSpread,
        this.shadowOffSet,
        this.customShadows,

        this.onTap,
        this.onLongPress,
        this.enableHover = true,

        this.cardImage,
        this.imagePosition = ImagePosition.top,
        this.imageRatio = ImageRatio.half,
        this.customImageWidth,
        this.customImageHeight,
        this.imageBorderRadius,
        this.imageFit = BoxFit.cover,

        this.showLikeIcon = false,
        this.likeIconPosition = OverlayPosition.topRight,
        this.likeIcon = Icons.favorite,
        this.likeIconColor,
        this.likeIconSize = 24.0,
        this.isLiked = false,
        this.onLikeTap,
        
        this.showBookmarkIcon = false,
        this.bookmarkIconPosition = OverlayPosition.topLeft,
        this.bookmarkIcon = Icons.bookmark,
        this.bookmarkIconColor,
        this.bookmarkIconSize = 24.0,
        this.isBookmarked = false,
        this.onBookmarkTap,
        
        this.statusChips,

        this.title,
        this.titleFontSize,
        this.titleFontWeight,
        this.titleColor,
        this.titleFontFamily,
        this.titleAlignment = ContentAlignment.left,
        this.titleMaxLines,
        this.titleOverflow,

        this.description,
        this.descriptionFontSize,
        this.descriptionFontWeight,
        this.descriptionColor,
        this.descriptionFontFamily,
        this.descriptionAlignment = ContentAlignment.left,
        this.descriptionMaxLines,
        this.descriptionOverflow,

        this.rating,
        this.maxRating = 5,
        this.ratingStarSize = 16.0,
        this.ratingFilledColor,
        this.ratingEmptyColor,
        this.showRatingNumber = true,
        this.customRatingText,
        this.onRatingChanged,

        this.chips,
        this.chipPosition = ContentChipPosition.afterTitle,
        this.chipBackgroundColor,
        this.chipTextColor,
        this.chipFontSize,
        this.chipFontWeight,
        this.chipBorderRadius,
        this.onChipTap,
        this.customChips,
        
        this.metrics,
        this.metricsColumns = 3,
        this.metricsSpacing = 16.0,
        this.showMetricsDividers = false,
        this.metricsBackgroundColor,
        
        this.iconTextPairs,
        
        this.price,
        this.priceFontSize,
        this.priceFontWeight,
        this.priceColor,
        this.priceAlignment = ContentAlignment.left,
        
        this.contentSpacing = 8.0,

        this.buttonText,
        this.buttonIcon,
        this.buttonIconOnRight = false,
        this.buttonStyle = CardButtonStyle.elevated,
        this.buttonPosition = ButtonPosition.fullWidth,
        this.buttonBackgroundColor,
        this.buttonTextColor,
        this.buttonBorderColor,
        this.buttonBorderWidth = 1.5,
        this.buttonFontSize,
        this.buttonFontWeight,
        this.buttonPadding,
        this.buttonBorderRadius,
        this.buttonWidth,
        this.buttonHeight,
        this.buttonIconSize = 20.0,
        this.buttonIconTextSpacing = 8.0,
        this.buttonElevation = 2.0,
        this.buttonHoverColor,
        this.buttonIsLoading = false,
        this.buttonIsDisabled = false,
        this.onButtonPressed,
        this.secondaryButton,
        this.buttons,
        this.buttonSpacing = 12.0,
        this.buttonDirection = Axis.horizontal,
        this.buttonAlignment = MainAxisAlignment.center,

        this.child
    });
    
      @override
      Widget build(BuildContext context) {

        BorderRadiusGeometry effectiveBorderRadius = customBorderRadius ?? 
            BorderRadius.circular(borderRadius ?? 12.0);  

        List<BoxShadow> effectiveShadows = _buildShadows(); 

        Widget cardContent = _buildCardContent(); 

        Widget cardContainer = Container(
            width: fullWidth ? double.infinity : width,
            height: fullHeight ? double.infinity : height,
            margin: margin ?? EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: backgroundColor ?? Colors.white,
                borderRadius: effectiveBorderRadius,
                border: borderWidth != null && borderWidth! > 0 
                    ? Border.all(
                        color: borderColor ?? Colors.grey.shade300,
                        width: borderWidth!,
                    )
                    : null,
                boxShadow: hasShadow ? effectiveShadows : null,
            ),
            child: ClipRRect(
                borderRadius: effectiveBorderRadius,
                child: cardContent,
            ),
        ); 

        if (onTap != null || onLongPress != null) {
            return Material(
                color: Colors.transparent,
                child:  InkWell(
                    onTap: onTap,
                    onLongPress: onLongPress,
                    borderRadius: effectiveBorderRadius is BorderRadius 
                    ? effectiveBorderRadius 
                    : null,
                    splashColor: (shadowColor ?? Colors.grey).withOpacity(0.1),
                    highlightColor: (shadowColor ?? Colors.grey).withOpacity(0.05),
                    hoverColor: enableHover 
                        ? Colors.grey.withOpacity(0.05)
                        : null,
                    child: cardContainer,
                ),
            );
        }

        return cardContainer;
    }

Widget _buildCardContent() {
        if (child != null) {
             return CardLayoutBuilder.buildLayoutWithImage(
                contentWidget: _addButtonToContent(child!),
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
        
        Widget contentWidget = CardContentBuilder.buildStructuredContent(
            title: title,
            titleFontSize: titleFontSize,
            titleFontWeight: titleFontWeight,
            titleColor: titleColor,
            titleFontFamily: titleFontFamily,
            titleAlignment: titleAlignment,
            titleMaxLines: titleMaxLines,
            titleOverflow: titleOverflow,
            description: description,
            descriptionFontSize: descriptionFontSize,
            descriptionFontWeight: descriptionFontWeight,
            descriptionColor: descriptionColor,
            descriptionFontFamily: descriptionFontFamily,
            descriptionAlignment: descriptionAlignment,
            descriptionMaxLines: descriptionMaxLines,
            descriptionOverflow: descriptionOverflow,
            rating: rating,
            maxRating: maxRating,
            ratingStarSize: ratingStarSize,
            ratingFilledColor: ratingFilledColor,
            ratingEmptyColor: ratingEmptyColor,
            showRatingNumber: showRatingNumber,
            customRatingText: customRatingText,
            onRatingChanged: onRatingChanged,
            chips: chips,
            chipPosition: chipPosition,
            chipBackgroundColor: chipBackgroundColor,
            chipTextColor: chipTextColor,
            chipFontSize: chipFontSize,
            chipFontWeight: chipFontWeight,
            chipBorderRadius: chipBorderRadius,
            onChipTap: onChipTap,
            customChips: customChips,
            metrics: metrics,
            metricsColumns: metricsColumns,
            metricsSpacing: metricsSpacing,
            showMetricsDividers: showMetricsDividers,
            iconTextPairs: iconTextPairs,
            price: price,
            priceFontSize: priceFontSize,
            priceFontWeight: priceFontWeight,
            priceColor: priceColor,
            priceAlignment: priceAlignment,
            contentSpacing: contentSpacing,
        );

    Widget contentWithButton = _addButtonToContent(contentWidget);

        
        return CardLayoutBuilder.buildLayoutWithImage(
            contentWidget: contentWithButton,
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

    Widget _addButtonToContent(Widget content) {
        if (_hasAnyButton()) {
            return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    content,
                    SizedBox(height: contentSpacing),
                    _buildButtonSection(),
                ],
            );
        }
        return content;
    }

    bool _hasAnyButton() {
        return buttonText != null || 
               buttonIcon != null || 
               secondaryButton != null || 
               (buttons != null && buttons!.isNotEmpty);
    }

       Widget _buildButtonSection() {
        if (buttons != null && buttons!.isNotEmpty) {
            return CardButtonGroup(
                buttons: buttons!,
                spacing: buttonSpacing,
                direction: buttonDirection,
                mainAxisAlignment: buttonAlignment,
            );
        }

        List<CardButton> buttonList = [];

        if (buttonText != null || buttonIcon != null) {
            buttonList.add(CardButton(
                text: buttonText,
                icon: buttonIcon,
                iconOnRight: buttonIconOnRight,
                style: buttonStyle,
                position: buttonPosition,
                backgroundColor: buttonBackgroundColor,
                textColor: buttonTextColor,
                borderColor: buttonBorderColor,
                borderWidth: buttonBorderWidth,
                fontSize: buttonFontSize,
                fontWeight: buttonFontWeight,
                padding: buttonPadding,
                borderRadius: buttonBorderRadius,
                width: buttonWidth,
                height: buttonHeight,
                iconSize: buttonIconSize,
                iconTextSpacing: buttonIconTextSpacing,
                elevation: buttonElevation,
                hoverColor: buttonHoverColor,
                isLoading: buttonIsLoading,
                isDisabled: buttonIsDisabled,
                onPressed: onButtonPressed,
            ));
        }

        if (secondaryButton != null) {
            buttonList.add(secondaryButton!);
        }

        if (buttonList.isEmpty) return const SizedBox.shrink();

        if (buttonList.length == 1) {
            return buttonList.first;
        }

        return CardButtonGroup(
            buttons: buttonList,
            spacing: buttonSpacing,
            direction: buttonDirection,
            mainAxisAlignment: buttonAlignment,
        );
    }

    List<BoxShadow> _buildShadows() {
        if (customShadows != null) {
            return customShadows!;
        }

        return [
            BoxShadow(
                color: shadowColor ?? Colors.grey.withOpacity(0.2),
                spreadRadius: shadowSpread ?? 1.0,
                blurRadius: shadowBlur ?? 4.0,
                offset: shadowOffSet ?? Offset(0, 2)
            )
        ];
    }
}