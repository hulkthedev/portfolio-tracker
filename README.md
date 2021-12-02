# portfolio-tracker

[![Version](https://img.shields.io/badge/Version-0.0.1-blue)](https://github.com/hulkthedev/portfolio-tracker)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

NestJS based Portfolio Tracker "Backend" 

##### requirements
- docker
- docker-compose

##### build
```bash
chmod +x build/build.sh
./build/build.sh

# build without startup
./build/build.sh --silent
```

##### app control
```bash
./build/app.sh start
./build/app.sh stop
```

##### tests
```bash
./build/test.sh
```

##### usage
```bash
localhost:3000
```