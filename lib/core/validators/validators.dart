abstract final class Validators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo obrigatório.';
    }

    return null;
  }

  static String? email(String? value) {
    final requiredValidation = required(value);

    if (requiredValidation != null) {
      return requiredValidation;
    }

    const pattern =
        r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$';

    if (!RegExp(pattern).hasMatch(value!.trim())) {
      return 'Informe um e-mail válido.';
    }

    return null;
  }

  static String? password(
    String? value, {
    int minLength = 6,
  }) {
    final requiredValidation = required(value);

    if (requiredValidation != null) {
      return requiredValidation;
    }

    if (value!.length < minLength) {
      return 'A senha deve conter pelo menos $minLength caracteres.';
    }

    return null;
  }

  static String? repeatPassword(
    String? value,
    String password,
  ) {
    final passwordValidation = Validators.password(value);

    if (passwordValidation != null) {
      return passwordValidation;
    }

    if (value != password) {
      return 'As senhas não coincidem.';
    }

    return null;
  }
}