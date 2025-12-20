package ada.projectfinal;
import java.util.ArrayList;
import java.util.List;

public class AlertManager {
    private int studentId;
    private int totalDays=80;
    private int attendedDays;
    private List<String> alerts=new ArrayList<>();

    public AlertManager(int studentId, int totalDays) {
        this.studentId = studentId;
        this.totalDays = 70;
        this.attendedDays = 0;
    }
    
    public void addAttendance(int days) {
        if (days < 0) return;

        attendedDays += days;

        if (attendedDays > totalDays){
           this.attendedDays = totalDays;
        }
    }
    
    public int getAbsentDays(int attendedDays) {
        return totalDays - attendedDays;
    }
    
    public double getAttendancePercentage(int attendedDays) {
        if (totalDays == 0) return 0;
        return (attendedDays * 100.0) / totalDays;
    }
    
    public boolean AttendanceAlert(int attendedDays) {
        return getAttendancePercentage(attendedDays) < 75;
    }
    
    public String getAttendanceReport(int attendedDays) {
        String report =
                "Total Days: " + totalDays +
                "\nAttended Days: " + attendedDays +
                "\nAbsent Days: " + getAbsentDays(attendedDays) +
                "\nAttendance: " + String.format("%.2f", getAttendancePercentage(attendedDays)) + "%";

        if (AttendanceAlert(attendedDays)) {
            report += "\nWARNING: Attendance below 75%";
        }

        return report;
    }

    public int getStudentId() {
        return studentId;
       }
    }
