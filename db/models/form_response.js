module.exports = function (sequelize, DataTypes) {
    const form_response = sequelize.define('form_response', {
        id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        form_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'form',
                key: 'id'
            }
        },
        response: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        deleted: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
            defaultValue: false
        },
    }, {
        tableName: 'form_response',
    });

    form_response.associate = (models) => {
        form_response.belongsTo(models.form, {
            foreignKey: 'form_id',
            targetKey: 'id'
        });
    }

    return form_response;
};
