package main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.AppCtx;
import spring.ChangePasswordService;
import spring.DuplicateMemberException;
import spring.MemberInfoPrinter;
import spring.MemberListPrinter;
import spring.MemberNotFoundException;
import spring.MemberRegisterService;
import spring.RegisterRequest;
import spring.WrongIdPasswordException;

public class Main {

	private static AnnotationConfigApplicationContext ctx = null;
	
	public static void main(String[] args) throws IOException {
		ctx = new AnnotationConfigApplicationContext(AppCtx.class);
		
		BufferedReader reader = 
				new BufferedReader(new InputStreamReader(System.in));
		while (true) {
			System.out.println("명령어를 입력해봐라! 마!:");
			String command = reader.readLine();
			if (command.equalsIgnoreCase("exit")) {
				System.out.println("종료한다! 마!");
				break;
			}
			if (command.startsWith("new ")) {
				processNewCommand(command.split(" "));
				continue;
			} else if (command.startsWith("change ")) {
				processChangeCommand(command.split(" "));
				continue;
			} else if (command.equals("list")) {
				processListCommand();
				continue;
			} else if (command.startsWith("info ")) {
				processInfoCommand(command.split(" "));
				continue;
			} else {
				printHelp();
			}
		}
		ctx.close();
	}
	
	private static void processNewCommand(String[] arg) {
		if (arg.length != 5) {
			printHelp();
			return;
		}
		MemberRegisterService regSvc = 
				ctx.getBean("memberRegSvc", MemberRegisterService.class);
		RegisterRequest req = new RegisterRequest();
		req.setEmail(arg[1]);
		req.setName(arg[2]);
		req.setPassword(arg[3]);
		req.setConfirmPassword(arg[4]);
		
		if (!req.isPasswordEqualToConfirmPassword()) {
			System.out.println("암호랑 확인이 일지하지 않는다! 마!\n");
			return;
		}
		try {
			regSvc.regist(req);
			System.out.println("등록했다! 마!\n");
		} catch (DuplicateMemberException e) {
			System.out.println("이미 존재하는 이메일이다! 마!\n");
		}
	}
	
	private static void processChangeCommand(String[] arg) {
		if(arg.length != 4) {
			printHelp();
			return;
		}
		ChangePasswordService changePwdSvc = 
				ctx.getBean("changePwdSvc", ChangePasswordService.class);
		try {
			changePwdSvc.changePassword(arg[1], arg[2], arg[3]);
			System.out.println("암호를 변경했다! 마!\n");
		} catch (MemberNotFoundException e) {
			System.out.println("존재하지 않는 이메일이다! 마!\n");
		} catch (WrongIdPasswordException e) {
			System.out.println("이메일과 암호가 일치하지 않는다! 마!");
		}
	}
	
	private static void processListCommand() {
		MemberListPrinter listPrinter = 
			ctx.getBean("listPrinter", MemberListPrinter.class);
		listPrinter.printAll();
	}
	
	private static void processInfoCommand(String[] arg) {
		if(arg.length != 2) {
			printHelp();
			return;
		}
		MemberInfoPrinter infoPrinter = 
				ctx.getBean("infoPrinter", MemberInfoPrinter.class);
		infoPrinter.printMemberInfo(arg[1]);
	}
	
	private static void printHelp() {
		System.out.println();
		System.out.println("잘못된 명령어다! 마! 아래 명령어 사용법을 확인해라!");
		System.out.println("명령어 사용법이다! 마!:");
		System.out.println("new 이메일 이름 암호 암호확인 이다! 마!");
		System.out.println("change 이메일 현재비번 변경비번 이다! 마!");
		System.out.println("list 다 마!");
		System.out.println("info 이메일 이다! 마!");
		System.out.println();
	}
	
}
