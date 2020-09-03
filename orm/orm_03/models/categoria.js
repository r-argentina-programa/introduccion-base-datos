const { Model } = require("sequelize");

module.exports = class Categoria extends Model {
  /**
   *
   * @param {import('sequelize'.Sequelize)} sequelize
   * @param {import('sequelize'.DataTypes} DataTypes
   */
  static inicializar(sequelize, DataTypes) {
    Categoria.init(
      {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true,
        },
        nombre: {
          type: DataTypes.STRING,
          allowNull: false,
        },
      },
      {
        sequelize,
        modelName: "Categoria",
        createdAt: "creado_en",
        updatedAt: "modificado_en",
        tableName: "categorias",
      }
    );
  }
};
