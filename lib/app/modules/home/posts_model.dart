
import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
    int? id;
    String? sigla;
    String? nome;
    Regiao? regiao;

    Posts({
        this.id,
        this.sigla,
        this.nome,
        this.regiao,
    });

    factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        id: json["id"],
        sigla: json["sigla"],
        nome: json["nome"],
        regiao: json["regiao"] == null ? null : Regiao.fromJson(json["regiao"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sigla": sigla,
        "nome": nome,
        "regiao": regiao?.toJson(),
    };
}

class Regiao {
    int? id;
    String? sigla;
    String? nome;

    Regiao({
        this.id,
        this.sigla,
        this.nome,
    });

    factory Regiao.fromJson(Map<String, dynamic> json) => Regiao(
        id: json["id"],
        sigla: json["sigla"],
        nome: json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sigla": sigla,
        "nome": nome,
    };
}
