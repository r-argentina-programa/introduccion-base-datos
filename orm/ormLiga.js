// modelos autogenerados con npm run generar-modelos
const chalk = require("chalk");
const { Sequelize, DataTypes, Op } = require("sequelize");

const info = (...params) => {
  console.log(chalk.bold.bgBlue.white(...params));
};

const dividir = () => {
  console.log(chalk.bold.bgRedBright("=".repeat(80)));
};

// crea la instancia de la conexión a la base de datos
const sequelize = new Sequelize({
  dialect: "sqlite",
  storage: "./orm/data/orm_ejemplo_liga_italiana.db",
  logging: console.log,
  sync: false,
});

/**
 * @type import('sequelize/index').Model Jugador
 */
const Jugador = require("./modelos/jugadores")(sequelize, DataTypes);

/**
 * @type import('sequelize/index').Model Equipo
 */
const Equipo = require("./modelos/liga_italiana")(sequelize, DataTypes);

/**
 * @type import('sequelize/index').Model Partido
 */
const Partido = require("./modelos/partidos")(sequelize, DataTypes);

function definirAsociaciones() {
  info("Define asociaciones");

  console.log("un equipo tiene muchos jugadores");
  Equipo.hasMany(Jugador, {
    foreignKey: "fk_equipo",
  });

  console.log("un jugador pertenece a un equipo");
  Jugador.belongsTo(Equipo, {
    foreignKey: "fk_equipo",
  });

  console.log("un partido le pertenece a un equipo jugando en casa");
  Partido.belongsTo(Equipo, {
    as: "EquipoCasa",
    foreignKey: "fk_equipo_casa",
  });

  console.log("un partido le pertenece a un equipo jugando fuera");
  Partido.belongsTo(Equipo, {
    as: "EquipoFuera",
    foreignKey: "fk_equipo_fuera",
  });

  console.log("un equipo tiene muchos partidos jugando de local");
  Equipo.hasMany(Partido, {
    as: "PartidosLocal",
    foreignKey: "fk_equipo_casa",
  });

  console.log("un equipo tiene muchos partidos jugando de visitante");
  Equipo.hasMany(Partido, {
    as: "PartidosVisitante",
    foreignKey: "fk_equipo_fuera",
  });
}

function consultarTodosLosJugadores() {
  info("Consulta todos los jugadores");
  return Jugador.findAll();
}

function consultarEquiposDeLigaQueContengan(caracteres) {
  info(`Consulta equipos de liga que contengan: ${caracteres}`);
  return Equipo.findAll({
    where: {
      nombre: {
        [Op.like]: `%${caracteres}%`,
      },
    },
  });
}

function consultarEquipoConAsociacionDeJugadores(id) {
  info("Equipo con jugadores asociados");
  return Equipo.findByPk(id, { include: Jugador });
}

function consultarPartidoConAsociaciones(id) {
  info(`Consultar partido id ${id} con equipos asociados`);
  return Partido.findByPk(id, { include: ["EquipoCasa", "EquipoFuera"] });
}

function consultarEquipoConPartidosAsociados(id) {
  info(`Consultar equipo id ${id} con partidos asociados`);
  return Equipo.findByPk(id, {
    include: ["PartidosLocal", "PartidosVisitante"],
  });
}

function consultarTodosLosPartidosDeUnEquipo(id) {
  info(`Consultar todos los partidos del equipo ${id}, en casa o fuera`);
  return Partido.findAll({
    where: {
      [Op.or]: [{ fk_equipo_casa: id }, { fk_equipo_fuera: id }],
    },
  });
}

function insertarJugador(nombre, equipoId) {
  return Jugador.create({
    nombre,
    fk_equipo: equipoId,
  });
}

(async () => {
  definirAsociaciones();
  dividir();

  console.log((await consultarTodosLosJugadores()).map((r) => r.toJSON()));
  dividir();

  info(
    "Cantidad de equipos:",
    (await consultarEquiposDeLigaQueContengan(" FC")).length
  );
  dividir();

  console.log((await consultarEquipoConAsociacionDeJugadores(11)).toJSON());
  dividir();

  console.log((await consultarPartidoConAsociaciones(1)).toJSON());
  dividir();

  console.log((await consultarEquipoConPartidosAsociados(1)).toJSON());
  dividir();

  console.log(
    (await consultarTodosLosPartidosDeUnEquipo(1)).map((r) => r.toJSON())
  );
  dividir();

  console.log(
    (
      await insertarJugador(
        `Jugador ${Math.round(Math.random() * 99999999999999999)}`,
        2
      )
    ).toJSON()
  );
  dividir();
})();
