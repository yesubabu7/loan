package yesu.entities;

import java.util.List;
import java.util.Random;

import yesu.models.Privileges;
import yesu.models.UserPrivileges;

public class AuthUtils {

	Privileges privilegsObj;
	UserPrivileges UserPrivelegsObj;

	public static String getUserKey() {
		return null;
	}

	public static String getUserType() {
		return null;
	}

	public static List<String> getUserPrivilegePatterns() {
		return null;
	}

	public static String generateKey() {

		int leftLimit = 48; // numeral '0'
		int rightLimit = 122; // letter 'z'
		int targetStringLength = 10;
		Random random = new Random();

		String generatedString = random.ints(leftLimit, rightLimit + 1)
				.filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97)).limit(targetStringLength)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();

		System.out.println(generatedString);
		return generatedString;
	}

}
