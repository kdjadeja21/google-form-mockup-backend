const responseHandler = require("../../utils/responseHandler");
const models = require("../../db/models");

const saveForm = async (req, res) => {
    try {
        const newForm = await models.form.create({
            name: req.body.form_name,
            slug: req.body.form_slug
        });

        for (let field of req.body.fields) {
            await models.form_fields.create({
                form_id: newForm.id,
                title: field.title,
                field_key: field.field_key,
                input_type: field.input_type,
                required: field.required,
                options: JSON.stringify(field.options)
            })
        }
        return res.json(responseHandler.send("Success", 200, "New Form Created!"));
    }
    catch (err) {
        return res.json(responseHandler.send("failed", 500, "", err.message));
    }
}

const saveResponse = async (req, res) => {
    try {
        await models.form_response.create({
            form_id: req.body.form_id,
            response: JSON.stringify(req.body.response)
        });

        return res.json(responseHandler.send("Success", 200, "Form response saved!"));
    }
    catch (err) {
        return res.json(responseHandler.send("failed", 500, "", err.message));
    }
}

const getForm = async (req, res) => {
    try {
        const formData = await models.form.findOne({
            where: { slug: req.body.slug, deleted: false },
            include: [{
                model: models.form_fields,
                required: false,
                where: { deleted: false },
                order: [
                    ['id', 'ASC']
                ],
            }]
        })

        if (formData) {
            for (let data of formData.form_fields) {
                data.options = JSON.parse(data.options);
            }
            return res.json(responseHandler.send("Success", 200, "Get Form!", formData));
        }
        return res.json(responseHandler.send("Failed", 404, "Form not found!"));

    }
    catch (err) {
        return res.json(responseHandler.send("failed", 500, "", err.message));
    }
}

const getForms = async (req, res) => {
    try {
        const formData = await models.form.findAll({
            where: { deleted: false },
            order: [
                ['created_at', 'DESC']
            ],
            include: [{
                model: models.form_fields,
                required: false,
                where: { deleted: false },
            },
            {
                model: models.form_response,
                required: false,
                where: { deleted: false },
            }]
        })

        return res.json(responseHandler.send("Success", 200, "Get all forms!", formData));
    }
    catch (err) {
        return res.json(responseHandler.send("failed", 500, "", err.message));
    }
}

module.exports = {
    saveForm,
    saveResponse,
    getForm,
    getForms
}