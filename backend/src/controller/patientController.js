const Patient = require('../model/Patient')
const _ = require('lodash')

Patient.methods(['get', 'post', 'put', 'delete'])
Patient.updateOptions({
    new: true,
    runValidators: true
})

Patient.after('post', sendErrorsOrNext).after('put', sendErrorsOrNext)

function sendErrorsOrNext(req, res, next) {
    const bundle = res.locals.bundle

    if (bundle.errors) {
        var errors = parseErrors(bundle.errors)
        res.status(500).json({
            errors
        })
    } else {
        next()
    }
}

function parseErrors(nodeRestfulErrors) {
    const errors = []
    _.forIn(nodeRestfulErrors, error => errors.push(error.message))
    return errors
}

Patient.route('count', function (req, res, next) {
    Patient.count(function (error, value) {
        if (error) {
            res.status(500).json({
                errors: [error]
            })
        } else {
            res.json({
                value
            })
        }
    })
})

module.exports = Patient