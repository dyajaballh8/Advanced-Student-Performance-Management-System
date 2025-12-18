package ada.projectfinal;

import java.sql.*;

public class AttendanceDAO {

    // جلب أيام الحضور
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

    // جلب نسبة الغياب
    public double getAbsencePercentage(int studentId) {

        String sql = "SELECT TotalDays, AttendedDays FROM Attendance WHERE StudentID=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int totalDays = rs.getInt("TotalDays");
                int attended = rs.getInt("AttendedDays");

                if (totalDays == 0) return 0;

                int absentDays = totalDays - attended;
                return (absentDays * 100.0) / totalDays;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
