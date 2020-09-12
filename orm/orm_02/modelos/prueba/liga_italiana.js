/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('liga_italiana', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    posicion: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    nombre: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    jugados: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    ganados_total: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    empatados_total: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    perdidos_total: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    goles_favor_total: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    goles_contra_total: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    goles_diferencia_total: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    puntos_total: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    ganados_casa: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    empatados_casa: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    perdidos_casa: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    goles_favor_casa: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    goles_contra_casa: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    ganados_fuera: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    empatados_fuera: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    perdidos_fuera: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    goles_favor_fuera: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    goles_contra_fuera: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    created_at: {
      type: DataTypes.DATEONLY,
      allowNull: false,
      defaultValue: "datetime(now)"
    },
    updated_at: {
      type: DataTypes.DATEONLY,
      allowNull: false,
      defaultValue: "datetime(now)"
    }
  }, {
    sequelize,
    tableName: 'liga_italiana'
  });
};
