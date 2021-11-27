import { Test, TestingModule } from '@nestjs/testing';
import { AppController } from './app.controller';
import { LoginController } from "./login.controller";
import { AppService } from './app.service';

describe('AppController', () => {
    let app: TestingModule;

    beforeAll(async () => {
        app = await Test.createTestingModule({
            controllers: [AppController, LoginController],
            providers: [AppService],
        }).compile();
    });

    describe('getHello', () => {
        it('should return "Hello World!"', () => {
            const appController = app.get<AppController>(AppController);
            expect(appController.getHello()).toBe('Hello World!');
        });
    });

    describe('login', () => {
        it('should return "Login"', () => {
            const loginController = app.get<LoginController>(LoginController);
            expect(loginController.login()).toBe('Login');
        });
    });
});
