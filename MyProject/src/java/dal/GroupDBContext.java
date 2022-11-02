/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Group;
import model.Session;

/**
 *
 * @author Admin
 */
public class GroupDBContext extends DBContext<Group> {

    public Group fliter(int gid, int lid, int subid) {

        try {
            String sql = "SELECT DISTINCT ses.sesid\n"
                    + "                     FROM [Session] ses\n"
                    + "                     LEFT JOIN [Group] g ON g.gid = ses.gid\n"
                    + "                     INNER JOIN [Student_Group] stdg ON stdg.gid = g.gid\n"
                    + "                     INNER JOIN Student s ON stdg.stdid = s.stdid\n"
                    + "                     INNER JOIN Lecturer l ON l.lid = ses.lid\n"
                    + "                     INNER JOIN [Subject] sub ON sub.subid = g.subid\n"
                    + "                     WHERE g.gid = ? and l.lid = ? and sub.subid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setInt(2, lid);
            stm.setInt(3, subid);
            ResultSet rs = stm.executeQuery();
            ArrayList<Session> sessions = new ArrayList<>();
            while (rs.next()) {
                SessionDBContext sesDB = new SessionDBContext();
                Session ses = sesDB.get(rs.getInt("sesid"));
                sessions.add(ses);
            }
            Group group = new Group();
            group.setId(gid);
            group.setSessions(sessions);
            StudentDBContext stddb = new StudentDBContext();
            group.setStudents(stddb.getlist(gid));
            return group;
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Group get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Group> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
