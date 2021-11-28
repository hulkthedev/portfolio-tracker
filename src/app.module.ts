import { Module } from '@nestjs/common';
import { AppService } from './server/service/app.service';
import { PagesController } from "./server/controller/pages.controller";
import { AuthenticationController } from "./server/controller/authentication.controller";

@Module({
    imports: [],
    controllers: [PagesController, AuthenticationController],
    providers: [AppService],
})

export class AppModule {}
