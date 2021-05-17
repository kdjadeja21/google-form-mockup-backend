module.exports = function (sequelize, DataTypes) {
    const form_fields = sequelize.define('form_fields', {
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
        title: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        field_key: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        input_type: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        required: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
            defaultValue: false
        },
        options: {
            type: DataTypes.STRING(255),
            allowNull: false
        },
        deleted: {
            type: DataTypes.BOOLEAN,
            allowNull: false,
            defaultValue: false
        },
    }, {
        tableName: 'form_fields',
    });

    form_fields.associate = (models) => {
        form_fields.belongsTo(models.form, {
            foreignKey: 'form_id',
            targetKey: 'id'
        });
    }

    // form_fields.associate = function (models) {
    //     form_fields.hasOne(models.form, { foreignKey: 'id', sourceKey: 'form_id' });

    // }

    return form_fields;
};
