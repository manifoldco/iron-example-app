const IronWorker = require('iron_worker');
const Logger = require('logdna');

const logger = Logger.setupDefaultLogger(process.env.KEY, {});

// Task
logger.log('Starting job…');
logger.log(`--BEGIN IRONWORKER PAYLOAD--`);
logger.log(IronWorker.params());
logger.log(`--END IRONWORKER PAYLOAD--`);
logger.log('Finished! 🎉');
