package com.skilldistillery.film.controllers;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.film.data.FilmDAO;
import com.skilldistillery.film.entities.Film;

@Controller 
public class FilmController {
	
	@Autowired
	private FilmDAO filmDao;
	
	@RequestMapping(path= {"/", "home.do"})
	public String goHome(Model model) throws SQLException {
		Film TEST = filmDao.findFilmById(1); //DEBUG
		model.addAttribute("Testfilm", TEST);
		return "home";
	}


}
