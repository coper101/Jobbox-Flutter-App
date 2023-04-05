enum AppIcons { list, pen, user }

extension AppIconExtension on AppIcons {
  String get path {
    switch (this) {
      case AppIcons.list:
        return 'assets/icons/rectangle_list_regular.svg';
      case AppIcons.pen:
        return 'assets/icons/pen_solid.svg';
      case AppIcons.user:
        return 'assets/icons/user_solid.svg';
    }
  }
}
