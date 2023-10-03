local shell_handler = require('runner.handlers.helpers').shell_handler
require('runner').set_handler('cpp', shell_handler('sh build.sh', true))
