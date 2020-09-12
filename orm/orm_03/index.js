const { Sequelize, DataTypes } = require("sequelize");
const Libro = require("./models/libro");
const Categoria = require("./models/categoria");
const CategoriaLibro = require("./models/categoriaLibro");

// crea la instancia de la conexión a la base de datos
const sequelize = new Sequelize({
  dialect: "sqlite",
  storage: ":memory:",
  logging: console.log,
});

async function inicializar() {
  Libro.inicializar(sequelize, DataTypes);
  Categoria.inicializar(sequelize, DataTypes);
  CategoriaLibro.inicializar(sequelize, DataTypes);

  Categoria.belongsToMany(Libro, {
    through: CategoriaLibro,
    as: "libros",
    foreignKey: "fk_categoria",
    uniqueKey: "id",
  });

  Libro.belongsToMany(Categoria, {
    through: CategoriaLibro,
    as: "categorias",
    foreignKey: "fk_libro",
    uniqueKey: "id",
  });

  // esto sincroniza los modelos con la base de datos (crea las tablas si hace falta, incluyendo foreign keys)
  await sequelize.sync({ force: true });
}

async function crearLibrosConCategoriasNuevas() {
  const libro = await Libro.create(
    {
      titulo: "Libro 1",
      categorias: [
        {
          nombre: "Categoria 1",
        },
        {
          nombre: "Categoria 2",
        },
      ],
    },
    { include: { model: Categoria, as: "categorias" } }
  );

  console.log(libro.toJSON());
}

async function crearLibrosConCategoriasExistentes() {
  const transaction = await sequelize.transaction();

  const libro = (
    await Libro.create(
      {
        titulo: "Libro 2",
      },
      { transaction }
    )
  ).toJSON();

  const categoriasLibros = await CategoriaLibro.bulkCreate(
    [
      {
        fk_libro: libro.id,
        fk_categoria: 1,
      },
      {
        fk_libro: libro.id,
        fk_categoria: 2,
      },
    ],
    { transaction }
  );

  await transaction.commit();

  console.log(libro);
  categoriasLibros.map((categoriaLibro) =>
    console.log(categoriaLibro.toJSON())
  );
}

async function consultarLibrosConAsociaciones() {
  const libros = await Libro.findAll({
    include: { model: Categoria, as: "categorias" },
    order: [["titulo", "DESC"]],
  });

  libros.map((libro) => console.log(libro.toJSON()));
}

inicializar().then(async () => {
  await crearLibrosConCategoriasNuevas();
  await crearLibrosConCategoriasExistentes();
  await consultarLibrosConAsociaciones();
});
