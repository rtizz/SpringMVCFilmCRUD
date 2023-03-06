package com.skilldistillery.film.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Component

public class FilmDaoJdbcImpl implements FilmDAO {

	private static final String URL = "jdbc:mysql://localhost:3306/sdvid?useSSL=false&useLegacyDatetimeCode=false&serverTimezone=US/Mountain";
	private static final String USER = "student";
	private static final String PASS = "student";
	private boolean hasReturn = false;

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("Error loading MySQL Driver");
			throw new RuntimeException("Unable to load MySQL Driver class");
		}
	}

	@Override
	public Film findFilmById(int filmId) throws SQLException {
		Film film = null;
		if (filmId <= 1000) {
			try {
				Connection conn = DriverManager.getConnection(URL, USER, PASS);
				String sql = "SELECT film.*, cat.name FROM film JOIN film_category ON film.id = film_category.film_id"
						+ " JOIN category cat ON film_category.category_id = cat.id WHERE film.id = ?";

				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setInt(1, filmId);
				ResultSet filmResult = stmt.executeQuery();
				if (filmResult.next()) {
					hasReturn = true;
					String title = filmResult.getString("title");
					String desc = filmResult.getString("description");
					int releaseYear = filmResult.getInt("release_year");
					int langauge = filmResult.getInt("language_id");
					int duration = filmResult.getInt("rental_duration");
					double rRate = filmResult.getDouble("rental_rate");
					int length = filmResult.getInt("length");
					double replace = filmResult.getDouble("replacement_cost");
					String rating = filmResult.getString("rating");
					String special = filmResult.getString("special_features");
					String category = filmResult.getString("name");

					List<Actor> actor = findActorsByFilmId(filmId);
					film = new Film(filmId, title, desc, releaseYear, langauge, duration, rRate, length, replace,
							rating, special, category);
					film.setActor(actor);
				}

				filmResult.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			try {
				Connection conn = DriverManager.getConnection(URL, USER, PASS);
				String sql = "SELECT * FROM film WHERE film.id = ?";

				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setInt(1, filmId);
				ResultSet filmResult = stmt.executeQuery();
				if (filmResult.next()) {
					hasReturn = true;
					String title = filmResult.getString("title");
					String desc = filmResult.getString("description");
					int releaseYear = filmResult.getInt("release_year");
					int langauge = filmResult.getInt("language_id");
					int duration = filmResult.getInt("rental_duration");
					double rRate = filmResult.getDouble("rental_rate");
					int length = filmResult.getInt("length");
					double replace = filmResult.getDouble("replacement_cost");
					String rating = filmResult.getString("rating");
					String special = filmResult.getString("special_features");
					String category = null;
					List<Actor> actor = findActorsByFilmId(filmId);
					film = new Film(filmId, title, desc, releaseYear, langauge, duration, rRate, length, replace,
							rating, special, category);
					film.setActor(actor);
				}

				filmResult.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return film;
	}

	@Override
	public List<Actor> findActorsByFilmId(int filmId) {
		List<Actor> actor = new ArrayList<>();
		Actor actObject;
		try {
			Connection conn = DriverManager.getConnection(URL, USER, PASS);
			String sql = "SELECT actor.id, actor.first_name, actor.last_name ";
			sql += " FROM actor JOIN film_actor ON actor.id = film_actor.actor_id JOIN film ON film.id = film_actor.film_id ";
			sql += " WHERE film.id = ? ";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			ResultSet findActor = stmt.executeQuery();
			while (findActor.next()) {
				int id = findActor.getInt("id");
				String firstName = findActor.getString("first_name");
				String lastName = findActor.getString("last_name");
				actObject = new Actor(id, firstName, lastName);
				actor.add(actObject);
			}

			findActor.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return actor;
	}

	@Override
	public List<Film> findFilmByKeywordSearch(String keyword) {
		List<Film> kwSearch = new ArrayList<>();
		List<Actor> kwActor;
		Film filmList;

		try {
			Connection conn = DriverManager.getConnection(URL, USER, PASS);
			String sql = "SELECT film.id, title, release_year, rating, description, cat.name FROM film ";
			sql += "JOIN film_category ON film.id = film_category.film_id";
			sql += " JOIN category cat ON film_category.category_id = cat.id";
			sql += " WHERE title LIKE ? OR description LIKE ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + keyword + "%");
			stmt.setString(2, "%" + keyword + "%");
			ResultSet searchResult = stmt.executeQuery();
			while (searchResult.next()) {
				hasReturn = true;
				int filmID = searchResult.getInt("id");
				String title = searchResult.getString("title");
				String description = searchResult.getString("description");
				Integer releaseYear = searchResult.getInt("release_year");
				String rating = searchResult.getString("rating");
				String category = searchResult.getString("name");
				filmList = new Film(filmID, title, releaseYear, rating, description, category);
				kwSearch.add(filmList);
				kwActor = findActorsByFilmId(filmList.getFilmId());
				filmList.setActor(kwActor);
			}
			if (!hasReturn) {
				System.out.println("Sorry, there are no results for that search. Please try another keyword.");
			}

			searchResult.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return kwSearch;
	}

//			String sql2 = "SELECT * FROM Film WHERE title LIKE ? OR description LIKE ? && id > 1000";
//			PreparedStatement stmt2 = conn.prepareStatement(sql2);
//			stmt2.setString(1, "%" + keyword + "%");
//			stmt2.setString(2, "%" + keyword + "%");
//			ResultSet searchResult2 = stmt2.executeQuery();
//			while (searchResult2.next()) {
//				hasReturn = true;
//				filmID = searchResult2.getInt("id");
//				title = searchResult2.getString("title");
//				description = searchResult2.getString("description");
//				releaseYear = searchResult2.getInt("release_year");
//				rating = searchResult2.getString("rating");
//				category = searchResult2.getString("name");
//				filmList2 = new Film(filmID, title, releaseYear, rating, description, category);
//				kwSearch.add(filmList2);
//				kwActor = findActorsByFilmId(filmList2.getFilmId());
//				filmList2.setActor(kwActor);
//				}
//
//			searchResult.close();
//			stmt.close();
//			conn.close();
//			}
////			if (!hasReturn) {
////				System.out.println("Sorry, there are no results for that search. Please try another keyword.");
////			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//		return kwSearch;
//	}

	@Override
	public Actor findActorById(int actorId) throws SQLException {
		Actor actor = null;
		Connection conn = DriverManager.getConnection(URL, USER, PASS);
		String sql = "SELECT id, first_name, last_name FROM actor WHERE id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, actorId);
		ResultSet actorResult = stmt.executeQuery();
		if (actorResult.next()) {
			actor = new Actor(actorResult.getInt("id"), actorResult.getString("first_name"),
					actorResult.getString("last_name"));

		}
		actorResult.close();
		stmt.close();
		conn.close();

		return actor;
	}

	@Override
	public Film updateFilm(Film film) {
		int filmID = film.getFilmId();
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			conn.setAutoCommit(false);
			String sql = "UPDATE film SET title= ?, description= ?, release_year= ?, language_id= ?,"
					+ " rental_duration=? , rental_rate= ?, length= ?, replacement_cost= ?, rating= ?, special_features= ?"
					+ " WHERE id= ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDesc());
			stmt.setInt(3, film.getReleaseYear());
			stmt.setInt(4, film.getLangId());
			stmt.setInt(5, film.getRentDur());
			stmt.setDouble(6, film.getRate());
			stmt.setInt(7, film.getLength());
			stmt.setDouble(8, film.getRepCost());
			stmt.setString(9, film.getRating());
			stmt.setString(10, film.getFeatures());
			stmt.setInt(11, filmID);
			int updateCount = stmt.executeUpdate();
			if (updateCount == 1) {
				conn.commit();
				stmt.close();
				conn.close();
			} else {
				System.out.println("did not commit");
				conn.commit();
//			stmt.close();
//			conn.close(); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return film;
	}

	@Override
	public Film createFilm(Film film) {

		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			conn.setAutoCommit(false);
			String sql = "INSERT INTO film (title, description, release_year,"
					+ " language_id, rental_duration, rental_rate, "
					+ "length, replacement_cost, rating, special_features) " + " VALUES (?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDesc());
			stmt.setInt(3, film.getReleaseYear());
			stmt.setInt(4, film.getLangId());
			stmt.setInt(5, film.getRentDur());
			stmt.setDouble(6, film.getRate());
			stmt.setInt(7, film.getLength());
			stmt.setDouble(8, film.getRepCost());
			stmt.setString(9, film.getRating());
			stmt.setString(10, film.getFeatures());
			try {
				int updateCount = stmt.executeUpdate();
				System.out.println(updateCount + "added to database");
				if (updateCount == 1) {
					ResultSet keys = stmt.getGeneratedKeys();
					if (keys.next()) {
						System.out.println("New Film ID" + keys.getInt(1));
						int filmId = keys.getInt(1);
						film.setFilmId(filmId);
					}

				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // COMMIT TRANSACTION
			conn.commit();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			throw new RuntimeException("Error inserting film " + film);
		}
		return film;
	}

	@Override
	public boolean deleteFilm(Integer filmid) {
		Connection conn = null;
		int id = filmid;
		try {
			conn = DriverManager.getConnection(URL, USER, PASS);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "DELETE FROM film WHERE id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			// COMMIT TRANSACTION
			try {
				int updateCount = stmt.executeUpdate();
				System.out.println(updateCount + "added to database");
				if (updateCount == 1) {
					conn.commit();
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // COMMIT TRANSACTION
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}
		return true;
	}

}
