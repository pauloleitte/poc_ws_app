const Patient = require("../model/Patient");
module.exports = {

    async create(patient) {
        try {
            return await Patient.create(patient);
        } catch (e) {
            throw e;
        }
    },

    async findById(id) {
        return await Patient.findById(id)
    },

    async findOneAndDelete(id) {
        try {
            return await Patient.findOneAndDelete(id);
        } catch (e) {
            throw e;
        }
    },

    async findOneAndUpdate(patient) {
        try {
            return await Patient.findOneAndUpdate(patient._id, {
                patient
            });
        } catch (e) {
            throw e;
        }
    },

    async findAll(userId) {
        return await Patient.find({
            userId: userId
        });
    },

    async findOne(cpf, userId) {
        return await Patient.findOne({
            cpf: cpf,
            userId: userId,
        })
    }

}