package pis.util;

public class Singleton {
	private static Singleton singleton;
	private String title;

	private Singleton() {
		title = "Patient Information System";
	}

	public static Singleton getInstance() {
		if (singleton == null) {
			singleton = new Singleton();
		}

		return singleton;
	}

	public String getTitle() {
		return title;
	}
}
