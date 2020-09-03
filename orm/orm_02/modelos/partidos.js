/* jshint indent: 2 */

module.exports = function (sequelize, DataTypes) {
  return sequelize.define(
    "partidos",
    {
      id: {
        autoIncrement: true,
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
      },
      fk_equipo_casa: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: {
            tableName: "liga_italiana",
          },
          key: "id",
        },
      },
      fk_equipo_fuera: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: {
            tableName: "liga_italiana",
          },
          key: "id",
        },
      },
      goles_casa: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      goles_fuera: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      created_at: {
        type: DataTypes.DATEONLY,
        allowNull: false,
        defaultValue: "datetime(now)",
      },
      updated_at: {
        type: DataTypes.DATEONLY,
        allowNull: false,
        defaultValue: "datetime(now)",
      },
    },
    {
      sequelize,
      tableName: "partidos",
      updatedAt: "updated_at",
      createdAt: "created_at",
    }
  );
};
