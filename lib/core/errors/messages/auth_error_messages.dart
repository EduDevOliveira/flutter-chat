abstract final class AuthErrorMessages {
  static String fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return 'E-mail inválido.';

      case 'email-already-in-use':
        return 'Este e-mail já está em uso.';

      case 'invalid-credential':
        return 'E-mail ou senha inválidos.';

      case 'user-disabled':
        return 'Usuário desativado.';

      case 'weak-password':
        return 'A senha é muito fraca.';

      case 'network-request-failed':
        return 'Verifique sua conexão com a internet.';

      default:
        return 'Não foi possível realizar a operação.';
    }
  }
}