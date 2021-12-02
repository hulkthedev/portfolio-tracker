import { NestFactory } from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import { AppModule } from './app.module';

async function bootstrap() {
    const helmet = require('helmet');
    const app = await NestFactory.create<NestExpressApplication>(AppModule);
    app.use(helmet());

    await app.listen(3000);
}

bootstrap();
