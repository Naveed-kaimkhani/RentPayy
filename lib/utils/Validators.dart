class Validators{
  static String? validateEmail(String? email) {
    if (email!.isNotEmpty) {
      if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
        return null;
      }
    } else {
      return 'Email is required';
    }
    return 'Invalid email';
  }
}