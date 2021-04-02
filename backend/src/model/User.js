const {
    Schema,
    model
} = require('mongoose');

const restful = require('node-restful')

const UserSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true  
    },
}, {
    timestamps: true
});

module.exports = restful.model('User', UserSchema)