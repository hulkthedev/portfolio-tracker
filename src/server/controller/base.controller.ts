import { Controller, Redirect } from '@nestjs/common';
import { AppService } from '../service/app.service';

@Controller()
export class BaseController {
    readonly HTTP_CODE_OK = 200;
    readonly HTTP_CODE_REDIRECT = 302;

    constructor(protected appService: AppService) {}

    @Redirect()
    redirect(url: string): object {
        return {
            url: url,
            statusCode: this.HTTP_CODE_REDIRECT
        };
    }
}