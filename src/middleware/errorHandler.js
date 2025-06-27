const logger = require('../utils/logger');

module.exports = (err, req, res, next) => {

  if (process.env.NODE_ENV !== 'test') {
    logger.error('Error: %O', err);
  }

  const status = err.status || 500;

  const message =
    status === 500 && process.env.NODE_ENV === 'production'
      ? 'Internal server error'
      : err.message || 'Something went wrong';

  res.status(status).json({ error: message });
};
