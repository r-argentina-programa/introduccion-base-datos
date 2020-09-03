const { Model } = require("sequelize");

module.exports = class Libro extends Model {
  /**
   *
   * @param {import('sequelize'.Sequelize)} sequelize
   * @param {import('sequelize'.DataTypes} DataTypes
   */
  static inicializar(sequelize, DataTypes) {
    Libro.init(
      {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true,
        },
        titulo: {
          type: DataTypes.STRING,
          allowNull: false,
        },
      },
      {
        sequelize,
        modelName: "Libro",
        createdAt: "creado_en",
        updatedAt: "modificado_en",
        tableName: "libros",
      }
    );
  }
};
