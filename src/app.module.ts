import { Module } from '@nestjs/common';
import { AuthenticationService } from './service/authentication.service';
import { AuthenticationController } from "./controller/authentication.controller";

@Module({
    imports: [],
    controllers: [AuthenticationController],
    providers: [AuthenticationService],
})

export class AppModule {}
