enum AppImages {
  charsPageImage('characters-page-image'),
  epsPageImage('episodes-page-image'),
  locsPageImage('locations-page-image'),
  logo('logo-small');

  const AppImages(this._name);
  final String _name;
  String get path => 'assets/images/$_name.png';
}
