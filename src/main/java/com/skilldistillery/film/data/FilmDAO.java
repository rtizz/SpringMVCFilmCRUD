package com.skilldistillery.film.data;

import java.sql.SQLException;
import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public interface FilmDAO {

	  public Film findFilmById(int filmId) throws SQLException;
	  public List<Actor> findActorsByFilmId(int filmId);
	  public List<Film> findFilmByKeywordSearch(String keyword);
	  public Actor findActorById(int actorId) throws SQLException;
	  
	//  public boolean saveFilm(Film film);
	//  public Film createFilm(Film film);
	//  public boolean deleteFilm(Film film);
}
