import { Controller, Post, Get } from '@nestjs/common';
import { BaseController } from "./base.controller";
import {AuthenticationService} from "../service/authentication.service";

@Controller('authenticate')
export class AuthenticationController extends BaseController {

    constructor(protected appService: AuthenticationService) {
        super();
    }

    @Get()
    authenticate() {
        let valid = this.appService.authenticate();
        return {
            'valid': valid,
            'redirect': true,
            'timestamp': 5565464456
        };
    }
}
