package pkg.qd;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		Scanner scanner = null;
		while(true) {
			System.out.println("작업을 선택하세요.");
			String menu = "1.회원목록 보기   ";
			menu += "2.회비내역 보기   ";
			menu += "3.끝내기";
			System.out.println(menu);
			
			scanner = new Scanner(System.in);
			System.out.print("\n번호 입력 : ");
			int num = scanner.nextInt();
			
			System.out.println();
			if (num == 1) {
				MemberList memberList = new MemberList();
				memberList.mtdMemList();
			} else if (num == 2) {
				ClubFeeList clubFeeList = new ClubFeeList();
				clubFeeList.mtdMemList();
			} else if(num == 3) {
				break;
			}
			System.out.println();
		}

		scanner.close();
		System.out.println("End!");

	}

}
