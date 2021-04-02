const patientService = require("../service/patientService")

module.exports = {

    async create(req, res) {
        const patient = req.body;
        try {
            const patientCreate = await patientService.create(patient);
            return res.status(201).json({
                id: patientCreate._id
            });
        } catch (e) {
            return res.status(500).json({
                error: e
            })
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
                await patientService.findOneAndUpdate(patient);
                return res.status(204).send()
            }

            return res.status(404).json({
                message: 'Paciente não localizado.'
            })

        } catch (e) {
            return res.status(500).json({
                error: e
            })
        }

    },

    async findAll(req, res) {
        return res.json(await patientService.findAll());
    },

    async findOne(req, res) {
        const id = req.params.id
        return res.json(await patientService.findOne(id))
    }
}