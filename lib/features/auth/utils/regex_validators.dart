extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension BangladeshiMobileValidator on String {
  bool isValidBangladeshiMobile() {
    return RegExp(r'(^(\+88|0088)?(01){1}[3456789]{1}(\d){8})$').hasMatch(this);
  }
}
