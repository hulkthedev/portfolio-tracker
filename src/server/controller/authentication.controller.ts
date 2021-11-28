import { Controller, Post } from '@nestjs/common';
import { BaseController } from "./base.controller";
import {AuthenticationService} from "../service/authentication.service";

@Controller('authenticate')
export class AuthenticationController extends BaseController {

    constructor(protected appService: AuthenticationService) {
        super();
    }

    @Post()
    authenticate() {
        let valid = this.appService.authenticate();
        return { valid: valid };
    }
}
