import { Controller, Res, Get, Redirect } from '@nestjs/common';
import { BaseController } from "./base.controller";
import { Response } from 'express';

@Controller('/')
export class PagesController extends BaseController {

    @Get()
    @Redirect()
    root() {
        let loggedIn = false;

        /**
         * logic
         */

        if (loggedIn) {
            return this.redirect('overview');
        }

        return this.redirect('login');
    }

    @Get('login')
    login(@Res() response: Response): void {
        return response.render('page/login', {
            title: 'Login',
            layout: 'layout/login'
        });
    }
}
