// instalación: https://sequelize.org/master/manual/getting-started.html

const { Sequelize, Model, DataTypes } = require("sequelize");

// crea la instancia de la conexión a la base de datos
const sequelize = new Sequelize({
  dialect: "sqlite",
  storage: ":memory:",
  logging: console.log,
});

class Club extends Model {}

Club.init(
  {
    // definiendo una columna con varias opciones
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true, // definimos que esta es la primary key (lo que identifica a este club)
      autoIncrement: true, // definimos que queremos que se autoincremente con cada nuevo registro
    },
    nombre: {
      type: DataTypes.STRING,
      // mostrar por qué es importante el intelisense (inferir allowNull tipeando "null")
      // mostrar referencia a la documentación (cmd + click en allowNull)
      allowNull: false, // no aceptamos valores nulos
    },
    // "shorthand" para columnas sin opciones adicionales
    fundado: DataTypes.DATE,
  },
  {
    sequelize, // la instancia de la conexión a la base de datos
    modelName: "Club", // el nombre del modelo, mediante inflexión crea/lee la tabla `clubs`.
    // Sequelize crea created_at, updated_at automáticamnete, nosotros los queremos en espanñol.
    createdAt: "creado_en",
    updatedAt: "modificado_en",
    tableName: "clubes", // no queremos utilizar inflexión, podemos definirlo manualmente
  }
);

(async () => {
  // sequelize.sync crea todas las tablas que no existen actualmente en base a los modelos definidos
  // alternativa: Club.sync();
  // también se pueden pasar los parámetros {alter: true} ó {force: true}
  // para alterar si hay diferencia de columas/datos ó recrear la tabla siempre, respectivamente.
  // alter: y force: no deben usarse nunca en producción, la alteración de tablas debe hacerse con el concepto de Migraciones.
  // si se desea recrear tablas en modo desarrollo es recomendable usar Safety Checks, ej.:
  // sequelize.sync({ force: true, match: /_test$/ }); // sólo corre si el nombre de la base de datos termina en _test

  await sequelize.sync();

  // Construye un objeto de tipo Club (no lo guarda en la base de datos aún!)
  // build es de los pocos métodos de SQLite que no es asíncrono -- porque no se comunica con la base de datos
  const independiente = Club.build({
    nombre: "Independiente",
    fundado: new Date(1905, 1, 1),
  });

  // ahora si lo guarda en la base de datos
  await independiente.save();
  console.log(independiente.toJSON());

  // Construye y graba el método de 1 sola vez
  const racing = await Club.create({
    nombre: "Racing Club",
    fundado: new Date(1903, 3, 25),
  });
  console.log(racing.toJSON());

  // Actualiza un registro
  independiente.nombre = "Club Atlético Independiente";
  await independiente.save(); // atención: el método no es `update` (se usa para otro caso)
  console.log(independiente.toJSON());

  // Elimina un registro de la base de datos
  racing.destroy();

  // el objeto en si sigue existiendo:
  console.log(racing.toJSON());

  // pero si consultamos la base de datos...
  const racingDb = await Club.findByPk(2);
  console.log("Cuánto vale Racing?", racingDb);

  // traigamos todos los registros para estar seguros
  const todosLosClubes = await Club.findAll();
  console.log(`Hay ${todosLosClubes.length} club`);
  console.log(todosLosClubes.map((club) => club.toJSON()));
})();
