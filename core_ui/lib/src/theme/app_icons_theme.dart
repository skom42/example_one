part of app_theme;

class AppIconsTheme {
  static const String _svgPath = 'assets/svg/';

  /// Path to the SVG files
  static const String _plusIconKey = '${_svgPath}plus.svg';
  static const String _messageKey = '${_svgPath}message.svg';
  static const String _downArrowKey = '${_svgPath}down_arrow.svg';
  static const String _notificationKey = '${_svgPath}notification.svg';
  static const String _trashBasketKey = '${_svgPath}trash_basket.svg';

  /// Getters for take SVG by key
  static AppIcon get plus => AppIcon(_plusIconKey);
  static AppIcon get trashBasket => AppIcon(_trashBasketKey);
  static AppIcon get message => AppIcon(_messageKey);
  static AppIcon get notification => AppIcon(_notificationKey);
  static AppIcon get downArrow => AppIcon(_downArrowKey);
}
