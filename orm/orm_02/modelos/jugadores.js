/* jshint indent: 2 */

module.exports = function (sequelize, DataTypes) {
  return sequelize.define(
    "jugadores",
    {
      id: {
        autoIncrement: true,
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
      },
      fk_equipo: {
        type: DataTypes.INTEGER,
        allowNull: true,
        references: {
          model: {
            tableName: "liga_italiana",
          },
          key: "id",
        },
      },
      nombre: {
        type: DataTypes.TEXT,
        allowNull: false,
      },
      created_at: {
        type: DataTypes.DATE,
        allowNull: false,
      },
      updated_at: {
        type: DataTypes.DATE,
        allowNull: false,
      },
    },
    {
      sequelize,
      tableName: "jugadores",
      createdAt: "created_at",
      updatedAt: "updated_at",
    }
  );
};
