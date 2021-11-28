import { Injectable } from '@nestjs/common';

@Injectable()
export class AuthenticationService {
    authenticate(): boolean {
        return true;
    }
}
