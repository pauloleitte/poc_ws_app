class Patient {
  String id;
  String nome;
  int idade;
  String cpf;
  String dataNasc;
  String sexo;
  String cep;
  String endereco;
  int numero;
  String bairro;
  String cidade;
  String estado;
  String celular;
  String email;
  String altura;
  int peso;
  String tipoSanguineo;
  String imageAvatar;

  Patient({
    this.id,
    this.nome,
    this.idade,
    this.cpf,
    this.dataNasc,
    this.sexo,
    this.cep,
    this.endereco,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
    this.celular,
    this.email,
    this.altura,
    this.peso,
    this.tipoSanguineo,
    this.imageAvatar,
  });

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    idade = json['idade'];
    cpf = json['cpf'];
    sexo = json['sexo'];
    dataNasc = json['data_nasc'];
    cep = json['cep'];
    endereco = json['endereco'];
    numero = json['numero'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    estado = json['estado'];
    celular = json['celular'];
    email = json['email'];
    altura = json['altura'];
    peso = json['peso'];
    tipoSanguineo = json['tipo_sanguineo'];
    imageAvatar = json['image_avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['idade'] = this.idade;
    data['cpf'] = this.cpf;
    data['data_nasc'] = this.dataNasc;
    data['sexo'] = this.sexo;
    data['cep'] = this.cep;
    data['endereco'] = this.endereco;
    data['numero'] = this.numero;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['celular'] = this.celular;
    data['email'] = this.email;
    data['altura'] = this.altura;
    data['peso'] = this.peso;
    data['tipo_sanguineo'] = this.tipoSanguineo;
    data['image_avatar'] = this.imageAvatar;
    return data;
  }
}
