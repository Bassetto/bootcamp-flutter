class UsuarioModel {
  double id;
  String nome;
  String email;
  String senha;
  TipoUsuario tipo;

  UsuarioModel(this.id, this.nome, this.email, this.senha, this.tipo);
}

enum TipoUsuario {
  CANDIDATO,
  COACH,
  PROFESSOR,
  VENDEDOR,
  ADMIN
}