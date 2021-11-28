import { Controller, Render, Get, Redirect } from '@nestjs/common';
import { BaseController } from "./base.controller";

@Controller("/")
export class PagesController extends BaseController {
    @Get()
    @Redirect()
    root() {
        /**
         * @todo add logic
         */
        let loggedIn = false;
        if (loggedIn) {
            return this.redirect('overview');
        }

        // return { url: 'login', statusCode: 302 };
        return this.redirect('login');
    }

    @Get('login')
    @Render('page/login')
    login() {
        let output = this.appService.login();
        return { message: output };
    }
}
