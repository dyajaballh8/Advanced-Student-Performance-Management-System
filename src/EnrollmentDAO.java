package ada.projectfinal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EnrollmentDAO {

    public List<Enrollment> getEnrollmentsByStudent(int studentId) {

        List<Enrollment> list = new ArrayList<>();

        String sql =
            "SELECT e.Score, e.Semester, e.Year, " +
            "c.CourseID, c.CourseCode, c.CourseName, c.CreditHours, " +
            "s.StudentID, s.Name, u.Password, s.Major, s.GPA, s.TotalHours, s.FacultyName " +
            "FROM Enrollments e " +
            "JOIN Courses c ON e.CourseID = c.CourseID " +
            "JOIN Students s ON e.StudentID = s.StudentID " +
            "JOIN Users u ON s.StudentID = u.UserID " +
            "WHERE s.StudentID=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Student student = new Student(
                        rs.getInt("StudentID"),
                        rs.getString("Name"),
                        rs.getString("Password"),
                        rs.getString("Major"),
                        rs.getDouble("GPA"),
                        rs.getInt("TotalHours"),
                        rs.getString("FacultyName")
                );

                Course course = new Course(
                        rs.getInt("CourseID"),
                        rs.getString("CourseCode"),
                        rs.getString("CourseName"),
                        rs.getInt("CreditHours")
                );

                Enrollment e = new Enrollment(
                        student,
                        course,
                        rs.getDouble("Score"),
                        rs.getString("Semester"),
                        rs.getInt("Year")
                );

                list.add(e);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
