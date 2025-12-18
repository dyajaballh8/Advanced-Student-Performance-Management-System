package ada.projectfinal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public List<Student> getAllStudents() {

        List<Student> students = new ArrayList<>();

        String sql =
            "SELECT s.StudentID, s.Name, u.Password, s.Major, s.GPA, s.TotalHours, s.FacultyName " +
            "FROM Students s JOIN Users u ON s.StudentID = u.UserID";

        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Student s = new Student(
                        rs.getInt("StudentID"),
                        rs.getString("Name"),
                        rs.getString("Password"),
                        rs.getString("Major"),
                        rs.getDouble("GPA"),
                        rs.getInt("TotalHours"),
                        rs.getString("FacultyName")
                );
                students.add(s);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
}
