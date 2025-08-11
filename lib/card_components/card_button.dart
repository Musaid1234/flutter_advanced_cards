// FILE: lib/widgets/card_components/card_button.dart
// Create this new file

import 'package:flutter/material.dart';

/// Enum for button styles
enum CardButtonStyle {
  elevated,    // Filled button with shadow
  outlined,    // Border button
  text,        // Text-only button
  icon,        // Icon-only button
  iconText,    // Icon + text button
}

/// Enum for button positioning
enum ButtonPosition {
  left,        // Align to left
  center,      // Center align
  right,       // Align to right
  fullWidth,   // Take full width
}

/// Advanced button widget for cards
class CardButton extends StatefulWidget {
  /// Button text
  final String? text;
  
  /// Button icon
  final IconData? icon;
  
  /// Icon position relative to text
  final bool iconOnRight;
  
  /// Button style
  final CardButtonStyle style;
  
  /// Button position
  final ButtonPosition position;
  
  /// Background color
  final Color? backgroundColor;
  
  /// Text color
  final Color? textColor;
  
  /// Border color (for outlined style)
  final Color? borderColor;
  
  /// Border width
  final double borderWidth;
  
  /// Font size
  final double? fontSize;
  
  /// Font weight
  final FontWeight? fontWeight;
  
  /// Button padding
  final EdgeInsetsGeometry? padding;
  
  /// Button border radius
  final double? borderRadius;
  
  /// Custom border radius
  final BorderRadiusGeometry? customBorderRadius;
  
  /// Button width (overrides position if provided)
  final double? width;
  
  /// Button height
  final double? height;
  
  /// Icon size
  final double iconSize;
  
  /// Spacing between icon and text
  final double iconTextSpacing;
  
  /// Button elevation (for elevated style)
  final double elevation;
  
  /// Elevation when pressed
  final double pressedElevation;
  
  /// Enable hover effects
  final bool enableHover;
  
  /// Hover color
  final Color? hoverColor;
  
  /// Loading state
  final bool isLoading;
  
  /// Loading indicator color
  final Color? loadingColor;
  
  /// Disabled state
  final bool isDisabled;
  
  /// Disabled color
  final Color? disabledColor;
  
  /// Callback when button is pressed
  final VoidCallback? onPressed;
  
  /// Callback when button is long pressed
  final VoidCallback? onLongPress;

  const CardButton({
    Key? key,
    this.text,
    this.icon,
    this.iconOnRight = false,
    this.style = CardButtonStyle.elevated,
    this.position = ButtonPosition.left,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderWidth = 1.5,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.borderRadius,
    this.customBorderRadius,
    this.width,
    this.height,
    this.iconSize = 20.0,
    this.iconTextSpacing = 8.0,
    this.elevation = 2.0,
    this.pressedElevation = 6.0,
    this.enableHover = true,
    this.hoverColor,
    this.isLoading = false,
    this.loadingColor,
    this.isDisabled = false,
    this.disabledColor,
    this.onPressed,
    this.onLongPress,
  }) : super(key: key);

  @override
  _CardButtonState createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isEffectivelyDisabled = widget.isDisabled || widget.isLoading;
    
    Widget buttonChild = _buildButtonContent();
    Widget button = _buildButtonContainer(buttonChild, isEffectivelyDisabled);
    
    return _wrapWithPositioning(button);
  }
  
  /// Build button content (text, icon, loading indicator)
  Widget _buildButtonContent() {
    if (widget.isLoading) {
      return SizedBox(
        width: widget.iconSize,
        height: widget.iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(
            widget.loadingColor ?? widget.textColor ?? Colors.white,
          ),
        ),
      );
    }
    
    List<Widget> children = [];
    
    // Add icon (left side)
    if (widget.icon != null && !widget.iconOnRight) {
      children.add(Icon(
        widget.icon!,
        size: widget.iconSize,
        color: _getEffectiveTextColor(),
      ));
      if (widget.text != null) {
        children.add(SizedBox(width: widget.iconTextSpacing));
      }
    }
    
    // Add text
    if (widget.text != null && widget.style != CardButtonStyle.icon) {
      children.add(Text(
        widget.text!,
        style: TextStyle(
          fontSize: widget.fontSize ?? 16.0,
          fontWeight: widget.fontWeight ?? FontWeight.w600,
          color: _getEffectiveTextColor(),
        ),
      ));
    }
    
    // Add icon (right side)
    if (widget.icon != null && widget.iconOnRight) {
      if (widget.text != null) {
        children.add(SizedBox(width: widget.iconTextSpacing));
      }
      children.add(Icon(
        widget.icon!,
        size: widget.iconSize,
        color: _getEffectiveTextColor(),
      ));
    }
    
    // For icon-only buttons
    if (widget.style == CardButtonStyle.icon && widget.icon != null) {
      return Icon(
        widget.icon!,
        size: widget.iconSize,
        color: _getEffectiveTextColor(),
      );
    }
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
  
  /// Build button container with styling
  Widget _buildButtonContainer(Widget child, bool isDisabled) {
    BorderRadiusGeometry effectiveRadius = widget.customBorderRadius ?? 
        BorderRadius.circular(widget.borderRadius ?? 8.0);
    
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: _getEffectiveWidth(),
            height: widget.height ?? (_getDefaultHeight()),
            padding: _getEffectivePadding(),
            decoration: _buildDecoration(isDisabled, effectiveRadius),
            child: MouseRegion(
              onEnter: widget.enableHover && !isDisabled ? (_) => _setHovered(true) : null,
              onExit: widget.enableHover && !isDisabled ? (_) => _setHovered(false) : null,
              child: GestureDetector(
                onTapDown: !isDisabled ? (_) => _setPressed(true) : null,
                onTapUp: !isDisabled ? (_) => _setPressed(false) : null,
                onTapCancel: !isDisabled ? () => _setPressed(false) : null,
                onTap: !isDisabled ? widget.onPressed : null,
                onLongPress: !isDisabled ? widget.onLongPress : null,
                child: Center(child: child),
              ),
            ),
          ),
        );
      },
      child: child,
    );
  }
  
  /// Wrap button with positioning
  Widget _wrapWithPositioning(Widget button) {
    switch (widget.position) {
      case ButtonPosition.left:
        return Align(alignment: Alignment.centerLeft, child: button);
      case ButtonPosition.center:
        return Center(child: button);
      case ButtonPosition.right:
        return Align(alignment: Alignment.centerRight, child: button);
      case ButtonPosition.fullWidth:
        return SizedBox(width: double.infinity, child: button);
    }
  }
  
  /// Build button decoration based on style
  BoxDecoration _buildDecoration(bool isDisabled, BorderRadiusGeometry radius) {
    Color backgroundColor = _getEffectiveBackgroundColor(isDisabled);
    
    switch (widget.style) {
      case CardButtonStyle.elevated:
        return BoxDecoration(
          color: backgroundColor,
          borderRadius: radius,
          boxShadow: isDisabled ? [] : [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: _isPressed ? widget.pressedElevation : widget.elevation,
              offset: Offset(0, _isPressed ? 1 : 2),
            ),
          ],
        );
        
      case CardButtonStyle.outlined:
        return BoxDecoration(
          color: _isHovered ? backgroundColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: radius,
          border: Border.all(
            color: isDisabled 
                ? (widget.disabledColor ?? Colors.grey[400]!)
                : (widget.borderColor ?? backgroundColor),
            width: widget.borderWidth,
          ),
        );
        
      case CardButtonStyle.text:
      case CardButtonStyle.icon:
      case CardButtonStyle.iconText:
        return BoxDecoration(
          color: _isHovered ? backgroundColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: radius,
        );
    }
  }
  
  /// Get effective background color
  Color _getEffectiveBackgroundColor(bool isDisabled) {
    if (isDisabled) {
      return widget.disabledColor ?? Colors.grey[400]!;
    }
    
    if (_isHovered && widget.hoverColor != null) {
      return widget.hoverColor!;
    }
    
    switch (widget.style) {
      case CardButtonStyle.elevated:
        return widget.backgroundColor ?? Colors.blue;
      case CardButtonStyle.outlined:
      case CardButtonStyle.text:
      case CardButtonStyle.icon:
      case CardButtonStyle.iconText:
        return widget.backgroundColor ?? Colors.blue;
    }
  }
  
  /// Get effective text color
  Color _getEffectiveTextColor() {
    if (widget.isDisabled) {
      return Colors.grey[600]!;
    }
    
    switch (widget.style) {
      case CardButtonStyle.elevated:
        return widget.textColor ?? Colors.white;
      case CardButtonStyle.outlined:
      case CardButtonStyle.text:
      case CardButtonStyle.icon:
      case CardButtonStyle.iconText:
        return widget.textColor ?? (widget.backgroundColor ?? Colors.blue);
    }
  }
  
  /// Get effective width
  double? _getEffectiveWidth() {
    if (widget.width != null) return widget.width;
    if (widget.position == ButtonPosition.fullWidth) return double.infinity;
    return null;
  }
  
  /// Get default height based on style
  double _getDefaultHeight() {
    switch (widget.style) {
      case CardButtonStyle.icon:
        return 40.0;
      case CardButtonStyle.elevated:
      case CardButtonStyle.outlined:
        return 44.0;
      case CardButtonStyle.text:
      case CardButtonStyle.iconText:
        return 36.0;
    }
  }
  
  /// Get effective padding
  EdgeInsetsGeometry _getEffectivePadding() {
    if (widget.padding != null) return widget.padding!;
    
    switch (widget.style) {
      case CardButtonStyle.icon:
        return EdgeInsets.all(8.0);
      case CardButtonStyle.elevated:
      case CardButtonStyle.outlined:
        return EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0);
      case CardButtonStyle.text:
      case CardButtonStyle.iconText:
        return EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    }
  }
  
  /// Set hover state
  void _setHovered(bool hovered) {
    if (mounted) {
      setState(() {
        _isHovered = hovered;
      });
    }
  }
  
  /// Set pressed state with animation
  void _setPressed(bool pressed) {
    if (mounted) {
      setState(() {
        _isPressed = pressed;
      });
      
      if (pressed) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }
}

/// Button group for multiple buttons
class CardButtonGroup extends StatelessWidget {
  /// List of buttons
  final List<CardButton> buttons;
  
  /// Spacing between buttons
  final double spacing;
  
  /// Direction of button layout
  final Axis direction;
  
  /// Main axis alignment
  final MainAxisAlignment mainAxisAlignment;
  
  /// Cross axis alignment
  final CrossAxisAlignment crossAxisAlignment;

  const CardButtonGroup({
    Key? key,
    required this.buttons,
    this.spacing = 8.0,
    this.direction = Axis.horizontal,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (direction == Axis.horizontal) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: _buildButtonsWithSpacing(),
      );
    } else {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: _buildButtonsWithSpacing(),
      );
    }
  }
  
  List<Widget> _buildButtonsWithSpacing() {
    List<Widget> children = [];
    for (int i = 0; i < buttons.length; i++) {
      children.add(buttons[i]);
      if (i < buttons.length - 1) {
        children.add(SizedBox(
          width: direction == Axis.horizontal ? spacing : 0,
          height: direction == Axis.vertical ? spacing : 0,
        ));
      }
    }
    return children;
  }
}