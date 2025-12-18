package ada.projectfinal;

import java.util.List;

public class Student extends User {

    private int studentId;
    private String name;
    private String major;
    private double gpa;
    private int totalHours;
    private String facultyName;

    public Student() {}

    public Student(int studentId, String name, String password,
                   String major, double gpa, int totalHours,
                   int enroll, int courses, String facultyName) {

        super(password);
        this.studentId = studentId;
        this.name = name;
        this.major = major;
        this.gpa = gpa;
        this.totalHours = totalHours;
        this.facultyName = facultyName;
    }

    // ===== Getters =====
    public int getStudentId() {
        return studentId;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public double getGpa() {
        return gpa;
    }

    // ===== GPA FROM DB =====
    public void calculateGPAFromDB(List<Enrollment> enrollments) {

        double totalPoints = 0;
        int hours = 0;

        for (Enrollment e : enrollments) {
            totalPoints += e.getScore() * e.getCourse().getCreditHours();
            hours += e.getCourse().getCreditHours();
        }

        if (hours > 0) {
            this.gpa = (totalPoints / hours) / 25; // تحويل من 100 لـ 4
        }

        System.out.println("Calculated GPA: " + gpa);
    }

    @Override
    public void Login(String password, String username) {}

    @Override
    public void Logout() {
        System.out.println("Logged out successfully");
    }

    @Override
    public void DisplayInfo() {
        System.out.println("Student Info:");
        System.out.println("ID: " + studentId);
        System.out.println("Name: " + name);
        System.out.println("Major: " + major);
        System.out.println("GPA: " + gpa);
        System.out.println("Total Hours: " + totalHours);
        System.out.println("Faculty: " + facultyName);
    }
}
