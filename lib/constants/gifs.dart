enum AppGifs {
  runners('runners'),
  portal('portal');

  const AppGifs(this._name);
  final String _name;
  String get path => 'assets/gifs/$_name.gif';
}
