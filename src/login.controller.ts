import { Controller, Get, Post } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class LoginController {
    constructor(private readonly appService: AppService) {}

    @Get("/login")
    login(): string {
        return this.appService.login();
    }
}
