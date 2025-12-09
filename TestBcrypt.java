import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class TestBcrypt {
    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String hash = "$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HixWWgpMQGpqT9.Wr879i";
        String password = "admin123";
        System.out.println("Password matches: " + encoder.matches(password, hash));
    }
}
