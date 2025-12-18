package ada.projectfinal;

import java.util.List;
import java.util.Scanner;

public class ProjectFinal {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        StudentDAO studentDAO = new StudentDAO();
        AttendanceDAO attendanceDAO = new AttendanceDAO();
        EnrollmentDAO enrollmentDAO = new EnrollmentDAO();

        System.out.print("Enter Name: ");
        String name = sc.nextLine();

        System.out.print("Enter Password: ");
        String pass = sc.nextLine();

        Student current = null;

        for (Student s : studentDAO.getAllStudents()) {
            if (s.getName().equals(name) && s.getPassword().equals(pass)) {
                current = s;
                break;
            }
        }

        if (current == null) {
            System.out.println("Login Failed");
            return;
        }

        System.out.println("Login Successful");
        current.DisplayInfo();

        int attended = attendanceDAO.getAttendedDays(current.getStudentId());
        AlertManager alert = new AlertManager();

        List<Enrollment> enrollments =
                enrollmentDAO.getEnrollmentsByStudent(current.getStudentId());

        current.calculateGPAFromDB(enrollments);

        System.out.println("Attendance %: " +
                alert.getAttendancePercentage(attended));
    }
}
