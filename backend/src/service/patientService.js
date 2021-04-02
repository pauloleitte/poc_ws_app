const Patient = require("../model/Patient");
Patient.updateOptions({
    new: true,
    runValidators: true
})

module.exports = {

    async create(patient) {
        try {
            return await Patient.create({
                patient
            });
        } catch (e) {
            throw e;
        }
    },

    async findById(id) {
        return await Patient.findById(id)
    },

    async findOneAndDelete(id) {
        return await Patient.findOneAndDelete(id);
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

    async findAll() {
        return await Patient.find({});
    },

    async findOne(id) {
        return await Patient.findById(id)
    }

}