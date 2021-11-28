import { NestFactory } from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import { AppModule } from './app.module';
import { join } from 'path';

async function bootstrap() {
    const app = await NestFactory.create<NestExpressApplication>(AppModule);

    app.useStaticAssets(join(__dirname, '..', 'src/client/public'));
    app.setBaseViewsDir(join(__dirname, '..', 'src/client/views'));
    app.setViewEngine('hbs');

    // app.disable("x-powered-by");

    // app.use((req, res, next) => {
    //     res.append('Accept-Charset', 'utf-8');
    //     next();
    // });

    await app.listen(3000);
}

bootstrap();
