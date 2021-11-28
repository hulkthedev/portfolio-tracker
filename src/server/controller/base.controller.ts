import { Controller, Render, Get, Redirect } from '@nestjs/common';
import { AppService } from '../../app.service';

@Controller()
export class BaseController {

    readonly HTTP_CODE_OK = 200;
    readonly HTTP_CODE_REDIRECT = 302;

    /**
      * @param appService
     */
    constructor(protected appService: AppService) {}

    redirect(url: string): object {
        return {
            url: url,
            statusCode: this.HTTP_CODE_REDIRECT
        };
    }
}