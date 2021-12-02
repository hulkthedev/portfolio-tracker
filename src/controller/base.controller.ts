import { Controller, Redirect } from '@nestjs/common';

@Controller()
export class BaseController {
    readonly HTTP_CODE_OK = 200;
    readonly HTTP_CODE_REDIRECT = 302;

    @Redirect()
    redirect(url: string): object {
        return {
            url: url,
            statusCode: this.HTTP_CODE_REDIRECT
        };
    }
}
