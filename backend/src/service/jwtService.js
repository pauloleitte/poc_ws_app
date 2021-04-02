require('dotenv').config()
var jwt = require('jsonwebtoken');

module.exports = {
  async generate(id) {
    return jwt.sign({
      id
    }, process.env.SECRET, {
      expiresIn: '1 day' // expires in 5min
    });
  },

  async validate(req, res, next) {
    var token = req.headers['x-access-token'];
    if (!token) {
      return res.status(401).send({
        message: 'No token provided.'
      });
    }
    jwt.verify(token, process.env.SECRET, function (err, decoded) {
      if (err) {
        return res.status(403).send({
          message: 'Failed to authenticate token.'
        });
      }
      req.userId = decoded.id;
      next();
    })
  }
}