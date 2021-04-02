const mongoose = require("mongoose");
const aws = require("aws-sdk");
const fs = require("fs");
const path = require("path");
const {
    promisify
} = require("util");

const s3 = new aws.S3();

const PatientSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    naturalness: {
        type: String,
        required: true
    },
    maritalStatus: {
        type: String,
        required: true
    },
    birthDate: {
        type: String,
        required: true,
    },
    genre: {
        type: String,
        required: true,
    },
    profession: {
        type: String,
        required: false,
    },
    cpf: {
        type: String,
        required: false,
    },
    rg: {
        type: String,
        required: false,
    },
    email: {
        type: String,
        required: true
    },
    cellphone: {
        type: String,
        required: true
    },
    telephone: {
        type: String,
        required: true
    },
    cep: {
        type: String,
        required: true,
    },
    address: {
        type: String,
        required: true
    },
    district: {
        type: String,
        required: true
    },
    city: {
        type: String,
        required: true
    },
    state: {
        type: String,
        required: true
    },
    size: Number,
    key: String,
    url: String,
}, {
    timestamps: true
});

PatientSchema.pre("save", function () {
    if (!this.url) {
        this.url = `${process.env.APP_URL}/files/${this.key}`;
    }
});

PatientSchema.pre("remove", function () {
    if (process.env.STORAGE_TYPE === "s3") {
        return s3
            .deleteObject({
                Bucket: process.env.BUCKET_NAME,
                Key: this.key,
            })
            .promise()
            .then((response) => {
                console.log(response.status);
            })
            .catch((response) => {
                console.log(response.status);
            });
    } else {
        return promisify(fs.unlink)(
            path.resolve(__dirname, "..", "..", "tmp", "uploads", this.key)
        );
    }
});

module.exports = mongoose.model("Patient", PatientSchema);