part of 'extensions.dart';

extension StringExtension on String {
  bool isDigit(int index) =>
      this.codeUnitAt(index) >= 48 &&
      this.codeUnitAt(index) <=
          57; //apakah huruf yang ke index kode ascii nya antara 48 dan 47 atau tidak
}
