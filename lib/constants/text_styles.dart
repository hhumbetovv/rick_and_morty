import 'package:flutter/material.dart';

sealed class TextStyles {
  static const TextStyle selectionStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 1.16,
  );

  static const TextStyle loadMoreStyle = TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.14,
  );

  static const TextStyle labelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const TextStyle cardNameStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle cardDescriptionStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle cardEpisodeStyle = TextStyle(
    color: Colors.grey,
    fontSize: 14,
    height: 1.35,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle goBackButtonStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    height: 1.16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle nameStyle = TextStyle(
    color: Colors.black,
    fontSize: 32,
    height: 1.56,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle containerTitleStyle = TextStyle(
    color: Colors.grey,
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w500,
  );

  static TextStyle infoTitleStyle = TextStyle(
    color: Colors.blueGrey[900],
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle infoValueStyle = TextStyle(
    color: Colors.blueGrey,
    fontSize: 14,
    height: 1.42,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle infoDateStyle = TextStyle(
    color: Colors.grey,
    fontSize: 10,
    height: 1.6,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
  );
}
