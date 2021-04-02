const User = require("../model/User");
const bcryptService = require("../service/BcryptService");
const jwtService = require("../service/JwtService");

module.exports = {

    async signup(req, res) {
        const {
            name,
            email,
            password
        } = req.body;
        const user = await User.findOne({
            email: email
        })
        if (user) {
            return res.status(400).json({
                message: 'Usuário já se encontra cadastrado.'
            })
        }
        await User.create({
            name: name,
            email: email,
            password: await bcryptService.encrypt(password)
        })
        return res.status(201).json({
            message: 'Usuário cadastrado com sucesso.'
        })
    },
    async login(req, res) {
        const {
            email,
            password
        } = req.body;
        const user = await User.findOne({
            email: email
        })
        if (user) {
            if (await bcryptService.compare(password, user.password)) {
                var token = await jwtService.generate(user.id)
                return res.status(200).json({
                    auth: true,
                    token: token,
                    user: user.name
                });
            }
        }
        return res.status(400).json({
            message: 'E-mail ou Senha Inválidos.'
        })
    }

}