import { Module } from '@nestjs/common';
import { AuthenticationService } from './server/service/authentication.service';
import { PagesController } from "./server/controller/pages.controller";
import { AuthenticationController } from "./server/controller/authentication.controller";

@Module({
    imports: [],
    controllers: [PagesController, AuthenticationController],
    providers: [AuthenticationService],
})

export class AppModule {}
