/* Importando Bibliotecas */
var restify = require("restify");
var mysql = require("mysql");
var corsMiddleware = require("restify-cors-middleware");

/* Criando objeto com as credenciais de conexão com o BD */
var con = {
    host: "localhost",
    user: "root",
    password: "",
    database: "ec021_av2_frete"
    // database: "ec021"
};

/* ----- Criando as funções do CRUD ----- */

/* CRUD - LISTAR TIPO FRETE ---------------------------------------------------- */
function listarTipoFrete(req, res, next) {
    /* Definindo o formato da response */
    res.setHeader("content-type", "application/json");
    res.charSet("UTF-8");
  
    /* Abrindo a conexão com o BD */
    var connection = mysql.createConnection(con);
    connection.connect();
  
    /* Escrevendo query que será executada */
    var strQuery = "SELECT tipo_id, descricao, valor_minimo FROM tipo_frete;";
  
    /** Exibindo query no console */
    console.log(strQuery);
  
    /** Executando query e processando resultados */
    connection.query(strQuery, function(err, rows, fields) {
        
        if (!err) { // Se não houver erros
            /* Retornamos as linhas */
            res.json(rows); 
        }else { // Caso contrário
            /* Retornamos dados sobre o erro */
            res.json(err); 
        }
        
    });
  
    /* Encerrando conexão com o banco */
    connection.end();
  
    /* Encerrando método da REST API */
    next();
}

/* CRUD - BUSCAR FRETE POR TIPO ---------------------------------------------------- */
function buscarFretePorTipo(req, res, next) {
  //Definindo o formato da response
  res.setHeader("content-type", "application/json");
  res.charSet("UTF-8");

  /* Recebendo ID como parâmetro na URL */
  var tipo_id = req.query.tipo_id;

  /** Abrindo a conexão com o BD */
  var connection = mysql.createConnection(con);
  connection.connect();

  /* Escrevendo query que será executada */
  var strQuery =
    "SELECT frete_id, motorista, data_saida, origem, tipo_id FROM frete" +
    " WHERE tipo_id = " +
    tipo_id +
    ";";

  /* Exibindo query no console */
  console.log(strQuery);

  /* Executando query e processando resultados */
  connection.query(strQuery, function(err, rows, fields) {
    if (!err) {
      //Se não houver erros
      res.json(rows); //Retornamos as linhas
    } else {
      //Caso contrário
      res.json(err); //Retornamos dados sobre o erro
    }
  });

  /* Encerrando conexão com o BD */
  connection.end();

  /* Encerrando método da REST API */
  next();
}

/* ----- FIM FUNÇÕES CRUD ----- */

/* Configurando servidor */
var server = restify.createServer({ name: "Prova - Frete" });

/* ????? Utilizando o bodyParser para converter o body da request em um jSON */
server.use(restify.plugins.bodyParser());

/* Utilizando o queryParser para permitir que métodos GET passem parâmetros na URL */
server.use(restify.plugins.queryParser());

/* ??? Incluindo configuração do CORS */
const cors = corsMiddleware({
    origins: ["*"],
    allowHeaders: ["API-Token"],
    exposeHeaders: ["API-Token-Expiry"]
});

server.pre(cors.preflight); /* ??? */
server.use(cors.actual);

/* Definindo endpoints (rotas) da aplicação. */
var toddyPoint = "/frete"; // padronizar as URI's

server.get(toddyPoint + "/listar", listarTipoFrete);
server.get(toddyPoint + "/buscar", buscarFretePorTipo);

/* Definindo porta em que subiremos o servidor */
var port = process.env.PORT || 5000;

/* Subindo o servidor */
server.listen(port, function() {
  console.log("%s rodando", server.name);
});