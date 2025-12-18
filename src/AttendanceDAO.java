package ada.projectfinal;

import java.sql.*;

public class AttendanceDAO {

    public int getAttendedDays(int studentId) {

        String sql = "SELECT AttendedDays FROM Attendance WHERE StudentID=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            if (rs.next())
                return rs.getInt("AttendedDays");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
