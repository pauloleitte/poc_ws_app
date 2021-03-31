class Patient {
  String nome;
  int idade;
  String cpf;
  String rg;
  String dataNasc;
  String sexo;
  String signo;
  String mae;
  String pai;
  String email;
  String senha;
  String cep;
  String endereco;
  int numero;
  String bairro;
  String cidade;
  String estado;
  String telefoneFixo;
  String celular;
  String altura;
  int peso;
  String tipoSanguineo;
  String cor;
  String imageAvatar;

  Patient({
    this.nome,
    this.idade,
    this.cpf,
    this.rg,
    this.dataNasc,
    this.sexo,
    this.signo,
    this.mae,
    this.pai,
    this.email,
    this.senha,
    this.cep,
    this.endereco,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
    this.telefoneFixo,
    this.celular,
    this.altura,
    this.peso,
    this.tipoSanguineo,
    this.cor,
    this.imageAvatar,
  });

  Patient.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    idade = json['idade'];
    cpf = json['cpf'];
    rg = json['rg'];
    dataNasc = json['data_nasc'];
    sexo = json['sexo'];
    signo = json['signo'];
    mae = json['mae'];
    pai = json['pai'];
    email = json['email'];
    senha = json['senha'];
    cep = json['cep'];
    endereco = json['endereco'];
    numero = json['numero'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    estado = json['estado'];
    telefoneFixo = json['telefone_fixo'];
    celular = json['celular'];
    altura = json['altura'];
    peso = json['peso'];
    tipoSanguineo = json['tipo_sanguineo'];
    cor = json['cor'];
    imageAvatar = json['image_avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['idade'] = this.idade;
    data['cpf'] = this.cpf;
    data['rg'] = this.rg;
    data['data_nasc'] = this.dataNasc;
    data['sexo'] = this.sexo;
    data['signo'] = this.signo;
    data['mae'] = this.mae;
    data['pai'] = this.pai;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['cep'] = this.cep;
    data['endereco'] = this.endereco;
    data['numero'] = this.numero;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['telefone_fixo'] = this.telefoneFixo;
    data['celular'] = this.celular;
    data['altura'] = this.altura;
    data['peso'] = this.peso;
    data['tipo_sanguineo'] = this.tipoSanguineo;
    data['cor'] = this.cor;
    data['image_avatar'] = this.imageAvatar;
    return data;
  }
}
