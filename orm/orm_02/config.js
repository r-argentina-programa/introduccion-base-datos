module.exports = {
  development: {
    dialect: "sqlite",
    storage: "./orm/orm_02/data/orm_ejemplo_liga_italiana.db", // por default corre con :memory: por lo tanto siempre corre las migraciones otra vez
  },
  production: {
    database: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    dialect: "mysql",
  },
};
