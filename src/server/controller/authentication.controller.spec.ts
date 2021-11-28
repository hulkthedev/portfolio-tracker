import { Test, TestingModule } from '@nestjs/testing';
import { AuthenticationController } from './authentication.controller';
import { AuthenticationService } from '../service/authentication.service';

describe('AuthenticationController', () => {
    let app: TestingModule;

    beforeAll(async () => {
        app = await Test.createTestingModule({
            controllers: [AuthenticationController],
            providers: [AuthenticationService],
        }).compile();
    });

    describe('authenticate', () => {
        it('should return true', () => {
            const authenticationController = app.get<AuthenticationController>(AuthenticationController);
            expect(authenticationController.authenticate()).toBe({"valid": true});
        });
    });
});
