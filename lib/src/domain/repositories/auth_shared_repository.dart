abstract class AuthSharedRepository {
  Future saveLogin(String login);

  Future<String?> getLogin();

  Future removeLogin();
}
