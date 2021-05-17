
module.exports = function (sequelize, DataTypes) {
    const form = sequelize.define('form', {
        id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        slug: {
            type: DataTypes.STRING(64),
            allowNull: false
        },
        deleted: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
            defaultValue: false
        },
        created_at: {
            type: DataTypes.DATE,
            allowNull: false,
            defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
        },
        updated_at: {
            type: DataTypes.DATE,
            allowNull: false,
            defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
        },
    }, {
        tableName: 'form',
    });

    form.associate = function (models) {
        models.form.hasMany(models.form_fields, {
            foreignKey: 'form_id',
            targetKey: 'id'
        });
        models.form.hasMany(models.form_response, {
            foreignKey: 'form_id',
            targetKey: 'id'
        });
    }

    return form;
};
