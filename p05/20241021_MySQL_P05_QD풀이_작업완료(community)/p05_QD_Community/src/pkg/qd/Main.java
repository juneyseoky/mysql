package pkg.qd;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		Scanner scanner = null;
		while(true) {
			System.out.println("작업을 선택하세요.(리팩토리1)");
			String menu = "1.회원목록 보기   ";
			menu += "2.회비내역 보기   ";
			menu += "3.끝내기";
			System.out.println(menu);
			
			scanner = new Scanner(System.in);
			System.out.print("\n번호 입력 : ");
			int num = scanner.nextInt();
			
			System.out.println();
			DBConn dbConn = null;
			if (num == 1) {
				// MemberList 객체 생성
				dbConn = new MemberList();
//				memberList.mtdMemList();
			} else if (num == 2) {
				// ClubFeeList 객체 생성
				dbConn = new ClubFeeList();
//				clubFeeList.mtdMemList();
			} else if(num == 3) {
				break;
			}
			// ClubFeeList 와 MemberList 의 mtdMemList를 호출
			// dbConn클래스에도 mtdMemList라는 빈 메서드가 존재하지만
			// 호출시 DBConn 클래스를 상속한 자식 클래스의 mtdMemList를 호출
			dbConn.mtdMemList();
			System.out.println();
		}

		scanner.close();
		System.out.println("End!");

	}

}
