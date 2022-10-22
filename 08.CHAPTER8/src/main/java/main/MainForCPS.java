package main;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.AppCtx;
import spring.ChangePasswordService;
import spring.MemberNotFoundException;
import spring.WrongIdPasswordException;

public class MainForCPS {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext ctx = 
			new AnnotationConfigApplicationContext(AppCtx.class);
		
		ChangePasswordService cps = 
			ctx.getBean("changePwdSvc", ChangePasswordService.class);
		try {
			cps.changePassword("faker@hideon.bush", "1234", "1111");
			System.out.println("암호변경 완료");
		} catch (MemberNotFoundException e) {
			System.out.println("회원 데이터가 존재하지 않는다! 마!");
		} catch (WrongIdPasswordException e) {
			System.out.println("암호가 올바르지 않다! 마!");
		}
		
		ctx.close();
	}
	
}
