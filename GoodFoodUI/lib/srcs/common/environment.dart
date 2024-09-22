class Env {
  final EnvType envType;
  Env({
    required this.envType,
  });
  factory Env.user() {
    return Env(envType: EnvType.user);
  }
  factory Env.owner() {
    return Env(envType: EnvType.owner);
  }
}

enum EnvType {
  admin,
  user,
  owner,
}
