import 'package:flutter/material.dart';


class DialogItem{
  final String itemType;

  TextEditingController controller;
  TextInputType keyboardType;
  TextInputAction inputAction;

  String inputDecorationLabelText;
  IconData inputDecorationIconData;
  Color inputDecorationIconColor;

  IconData raisedButtonIconData;
  Color raisedButtonIconColor;

  double raisedButtonElevation;
  double raisedButtonBorderRadius;
  Color raisedButtonColor;
  Color raisedButtonDisabledColor;
  Color raisedButtonSplashColor;
  String raisedButtonLabelText;
  Color raisedButtonLabelTextColor;
  Function raisedButtonOnPressed;

  DialogItem.buildTextFieldWithInputDecorationLabel({
    this.itemType = DialogItemTags.TEXT_FIELD_WITH_INPUT_DECORATION_LABEL,
    this.controller,
    this.keyboardType,
    this.inputAction,
    this.inputDecorationLabelText,
  });
  DialogItem.buildTextFieldWithInputDecorationIcon({
    this.itemType = DialogItemTags.TEXT_FIELD_WITH_INPUT_DECORATION_ICON,
    this.controller,
    this.keyboardType,
    this.inputAction,
    this.inputDecorationLabelText,
    this.inputDecorationIconData,
    this.inputDecorationIconColor

  });

  DialogItem.buildDateTextFieldWithInputDecorationLabel({
    this.itemType = DialogItemTags.DATE_TEXT_FIELD_WITH_INPUT_DECORATION_LABEL,
    this.controller,
    this.inputDecorationLabelText,
    
  });
  DialogItem.buildDateTextFieldWithInputDecorationIcon({
    this.itemType = DialogItemTags.DATE_TEXT_FIELD_WITH_INPUT_DECORATION_ICON,
    this.controller,
    this.inputDecorationLabelText,
    this.inputDecorationIconData,
    this.inputDecorationIconColor,
  });

  DialogItem.buildIconRaisedButton({
    this.itemType = DialogItemTags.ICON_RAISED_BUTTON,
    this.raisedButtonLabelText,
    this.raisedButtonLabelTextColor,
    this.raisedButtonColor,
    this.raisedButtonDisabledColor,
    this.raisedButtonSplashColor,
    this.raisedButtonBorderRadius,
    this.raisedButtonOnPressed,
    this.raisedButtonIconData,
    this.raisedButtonIconColor,
    this.raisedButtonElevation,
  });

  DialogItem.buildRaisedButton({
    this.itemType = DialogItemTags.RAISED_BUTTON,
    this.raisedButtonLabelText,
    this.raisedButtonLabelTextColor,
    this.raisedButtonColor,
    this.raisedButtonDisabledColor,
    this.raisedButtonSplashColor,
    this.raisedButtonBorderRadius,
    this.raisedButtonOnPressed,
  });
}


class DialogItemTags{
  static const String TEXT_FIELD_WITH_INPUT_DECORATION_ICON = "TEXT_FIELD_WITH_INPUT_DECORATION_ICON";
  static const String TEXT_FIELD_WITH_INPUT_DECORATION_LABEL = "TEXT_FIELD_WITH_INPUT_DECORATION_LABEL";
  static const String DATE_TEXT_FIELD_WITH_INPUT_DECORATION_LABEL = "DATE_TEXT_FIELD_WITH_INPUT_DECORATION_LABEL";
  static const String DATE_TEXT_FIELD_WITH_INPUT_DECORATION_ICON = "DATE_TEXT_FIELD_WITH_INPUT_DECORATION_ICON";
  static const String ICON_RAISED_BUTTON = "ICON_RAISED_BUTTON";
  static const String RAISED_BUTTON = "RAISED_BUTTON";
}


