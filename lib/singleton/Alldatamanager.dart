import 'package:kitchen_app/res/config/routes/routs_name.dart';
import 'package:kitchen_app/res/utils/helper/color_sheet.dart';
import 'package:kitchen_app/res/utils/helper/image_and_icon.dart';
import 'package:kitchen_app/res/utils/helper/text_theme.dart';

class AllDataManager {
  AllDataManager._data();
  static final AllDataManager instance = AllDataManager._data();

  //=============imageses package==========================
  final _img = Get_images();
  Get_images get getimg => _img;

  //================= icons Package========================

  final _icons = Get_icons();
  Get_icons get geticons => _icons;

  //========== colors Package==============================

  final _color = Get_colors();
  Get_colors get getcolor => _color;

  ///=============Routs Package============================

  final _routs = Routesname();
  Routesname get getrouts => _routs;

  /// =================TextTheme===========================

  final _texttheme = GetTextTheme();
  GetTextTheme get gettexttheme => _texttheme;
}
