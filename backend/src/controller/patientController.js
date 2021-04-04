const patientService = require("../service/patientService")
const errorService = require("../service/errorsService");

module.exports = {
    async create(req, res) {

        const patient = req.body;
        patient.userId = req.userId;

        try {

            const exist = await patientService.findOne(patient.cpf, patient.userId);

            if (!exist) {
                return res.status(201).json(
                    await patientService.create(patient)
                );
            }
            return res.status(400).json({
                message: 'Paciente já cadastrado.'
            });

        } catch (e) {
            return errorService.sendErrors(req, res, e);
        }

    },

    async delete(req, res) {
        const id = req.params.id
        try {
            const exist = await patientService.findById(id);

            if (exist) {
                await patientService.findOneAndDelete(id);
                return res.status(204)
            }

            return res.status(404).json({
                message: 'Paciente não localizada.'
            })

        } catch (e) {
            return res.status(500).json({
                error: e
            })
        }

    },

    async update(req, res) {
        const patient = req.body;

        const id = req.params.id

        try {
            const exist = await patientService.findById(id)

            if (exist) {
                console.log(patient)
                const patientr = await patientService.findOneAndUpdate(patient);
                console.log(patientr);
                return res.status(204).send()
            }

            return res.status(404).json({
                message: 'Paciente não localizado.'
            })

        } catch (e) {
            return errorService.sendErrors(req, res, e);
        }

    },

    async findAll(req, res) {
        return res.json(await patientService.findAll(req.userId));
    },

    async findOne(req, res) {
        const id = req.params.id
        const patient = await patientService.findOne(id);
        if (patient) {
            return res.json(patient)
        } else {
            return res.status(404).send({
                message: 'Paciente não localizado.'
            });
        }

    }
}