import { Controller, Post } from '@nestjs/common';
import { BaseController } from "./base.controller";

@Controller("authenticate")
export class AuthenticationController  extends BaseController {
    @Post()
    authenticate() {
        /**
         * add logic and return type
         */
    }
}
