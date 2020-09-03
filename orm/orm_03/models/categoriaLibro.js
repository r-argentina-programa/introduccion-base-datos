const { Model } = require("sequelize");

module.exports = class CategoriaLibro extends Model {
  /**
   *
   * @param {import('sequelize').Sequelize)} sequelize
   * @param {import('sequelize/types')} DataTypes
   */
  static inicializar(sequelize, DataTypes) {
    CategoriaLibro.init(
      {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true,
        },
        fk_categoria: {
          type: DataTypes.INTEGER,
          allowNull: false,
        },
        fk_libro: {
          type: DataTypes.INTEGER,
          allowNull: false,
        },
      },
      {
        sequelize,
        modelName: "CategoriaLibro",
        createdAt: "creado_en",
        updatedAt: "modificado_en",
        tableName: "categorias_libros",
      }
    );
  }
};
