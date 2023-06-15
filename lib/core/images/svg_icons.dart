import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcons {
  const SvgIcons({Color? color, double? width, double? height})
      : _color = color,
        _width = width,
        _height = height;

  final Color? _color;
  final double? _width;
  final double? _height;

  static const _rootPath = 'assets/icons/';

  static const _filePaths = {
    'add': '${_rootPath}add.svg',
    'arrow_back': '${_rootPath}arrow_back.svg',
    'check': '${_rootPath}check.svg',
    'close': '${_rootPath}close.svg',
    'delete': '${_rootPath}delete.svg',
    'info_outline': '${_rootPath}info_outline.svg',
    'visibility': '${_rootPath}visibility.svg',
    'visibility_off': '${_rootPath}visibility_off.svg',
  };

  SvgPicture get add => SvgPicture.asset(
        _filePaths['add']!,
        color: _color,
        width: _width,
        height: _height,
      );

  SvgPicture get arrowBack => SvgPicture.asset(
        _filePaths['arrow_back']!,
        color: _color,
        width: _width,
        height: _height,
      );

  SvgPicture get check => SvgPicture.asset(
        _filePaths['check']!,
        color: _color,
        width: _width,
        height: _height,
      );

  SvgPicture get close => SvgPicture.asset(
        _filePaths['close']!,
        color: _color,
        width: _width,
        height: _height,
      );

  SvgPicture get delete => SvgPicture.asset(
        _filePaths['delete']!,
        color: _color,
        width: _width,
        height: _height,
      );

  SvgPicture get infoOutline => SvgPicture.asset(
        _filePaths['info_outline']!,
        color: _color,
        width: _width,
        height: _height,
      );

  SvgPicture get visibility => SvgPicture.asset(
        _filePaths['visibility']!,
        color: _color,
        width: _width,
        height: _height,
      );

  SvgPicture get visibilityOff => SvgPicture.asset(
        _filePaths['visibility_off']!,
        color: _color,
        width: _width,
        height: _height,
      );
}
