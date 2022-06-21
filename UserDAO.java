/*
 * DAOクラス（管理者情報）
 * 作成日：2022年6月21日
 * 作成者：本多祐香子
 */
package dao;

import java.sql.*;
import java.util.*;
import bean.User;

public class UserDAO {

	/**
	 * JDBCドライバ内部のDriverクラスパス
	 */
	private static final String RDB_DRIVE = "com.mysql.jdbc.Driver";
	/**
	 * 接続するMySQLデータベースパス
	 */
	private static final String URL = "jdbc:mysql://localhost/uniformdb";
	/**
	 * データベースのユーザー名
	 */
	private static final String USER = "root";
	/**
	 * データベースのパスワード
	 */
	private static final String PASSWD = "root123";


	public static Connection getConnection() {
		try {
			Class.forName(RDB_DRIVE);
			Connection con = DriverManager.getConnection(URL, USER, PASSWD);
			return con;
		} catch (Exception e) {
			throw new IllegalStateException(e);
		}
	}

	public static void main(String[] args) throws Exception {

		Connection con = getConnection();
		System.out.println("con=" + con);
		con.close();

	}

	public User selectByUser(String userid) {

		// 検索結果の情報を格納するUserオブジェクトを生成
		User user = new User();

		// SQL文を生成
		String sql = "SELECT * FROM userinfo WHERE userid ='" + userid + "'";

		Connection con = null;
		Statement smt = null;

		try {
			con = UserDAO.getConnection();
			smt = con.createStatement();

			ResultSet rs = smt.executeQuery(sql);

			// 結果セットをUserオブジェクトに格納
			while (rs.next()) {
				user.setUserid(rs.getString("userid"));
				user.setPassword(rs.getString("password"));
				user.setAuthority(rs.getString("authority"));
			}

		} catch (Exception e) {
			throw new IllegalStateException(e);
		} finally {
			if (smt != null) {
				try {
					smt.close();
				} catch (SQLException ignore) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ignore) {
				}
			}
		}
		return user;
	}

	public User selectByUser(String userid, String password) {

		// 検索結果の情報を格納するUserオブジェクトを生成
		User user = new User();

		// SQL文を生成
		String sql = "SELECT * FROM userinfo WHERE userid='" + userid + "' AND password='" + password + "'";

		Connection con = null;
		Statement smt = null;

		try {
			con = UserDAO.getConnection();
			smt = con.createStatement();

			ResultSet rs = smt.executeQuery(sql);

			// 結果セットをUserオブジェクトに格納
			while (rs.next()) {
				user.setUserid(rs.getString("userid"));
				user.setPassword(rs.getString("password"));
				user.setAuthority(rs.getString("authority"));
			}

		} catch (Exception e) {
			throw new IllegalStateException(e);
		} finally {
			if (smt != null) {
				try {
					smt.close();
				} catch (SQLException ignore) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ignore) {
				}
			}
		}
		return user;
	}

}
