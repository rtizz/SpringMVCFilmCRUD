package com.skilldistillery.film.controllers;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.film.data.FilmDAO;
import com.skilldistillery.film.entities.Film;

@Controller 
public class FilmController {
	
	@Autowired
	private FilmDAO filmDao;
	
//	@RequestMapping(path= {"/", "home.do"})
//	public String goHome(Model model) throws SQLException {
//		Film TEST = filmDao.findFilmById(1); //DEBUG
//		model.addAttribute("Testfilm", TEST);
//		return "result";
//	}
	
	
	  @RequestMapping(path = "FilmEntry.do", method = RequestMethod.POST)
	  public ModelAndView filmEntry(Film film, RedirectAttributes redir) {
	    ModelAndView mv = new ModelAndView();
	    Film addFilm = filmDao.createFilm(film);
	    mv.addObject("film", addFilm);
	    
	    mv.setViewName("newfilmresult");
	    return mv;
	  }
		
	
	  @RequestMapping(path = "keyword.do", params = "keyword", method = RequestMethod.GET)
	  public ModelAndView getFilmByKeyword(String keyword) {
	    ModelAndView mv = new ModelAndView();
	    List<Film> search = filmDao.findFilmByKeywordSearch(keyword);
	    mv.addObject("keyword", search);
	    mv.setViewName("keywordresult");
	    return mv;
	  }

	  @RequestMapping(path = "GetFilmById.do", params = "filmid", method = RequestMethod.GET)
	  public ModelAndView getFilmById(Integer filmid) throws SQLException {
	    ModelAndView mv = new ModelAndView();
	    Film film = filmDao.findFilmById(filmid);
	    mv.addObject("filmdetails", film);
	    mv.setViewName("idresult");
	    return mv;
	  }
	  @RequestMapping(path = "filmDelete.do", params = "delete", method = RequestMethod.POST)
	  public ModelAndView deleteFilm(@RequestParam("delete") Integer filmid) throws SQLException {
	    ModelAndView mv = new ModelAndView();
	    boolean deleted;
	    String error = "Cannot Delete: Film has child pages";
	    String error2 = "Unable to delete film";
	    if (filmid > 1000) {
	    Film film = filmDao.findFilmById(filmid);
	    deleted = filmDao.deleteFilm(filmid);
	    if (deleted == true) {
	    	mv.addObject("filmtodelete", film);
	    	mv.addObject("truedeleted", deleted);
	    } else {
	    	mv.addObject("notdeleted", error2);
	    }
	    mv.setViewName("deletefilm");
	    return mv;
	    } else {
	    	deleted = false;
	    	mv.addObject("falsedeleted", deleted);
	    	mv.addObject("haschildren", error);
		    mv.setViewName("deletefilm");
		    return mv;
	    }
	  }
	  
	  @RequestMapping(path = "updateFilmForm.do")
	  public ModelAndView updateFilm(@RequestParam("update") Integer filmid) throws SQLException {
	    ModelAndView mv = new ModelAndView();
	    Film film = filmDao.findFilmById(filmid);
	    mv.addObject("filmtoupdate", film);
	    mv.setViewName("updatefilmform");
	    return mv;
	  }
	  
	  @RequestMapping(path = "filmUpdated.do")
	  public ModelAndView filmUpdated(Film film, RedirectAttributes reader) throws SQLException {
	    ModelAndView mv = new ModelAndView();
	    reader.addFlashAttribute("film", film); 
	    String failure= "Unable to update";
	    int filmId = film.getFilmId();
	    filmDao.updateFilm(film);
	    mv.addObject("updatedfilmid", filmId);
	    mv.addObject("updatedfilm", film);
	    mv.setViewName("filmupdated");
	    return mv;
//	    } else {
//	    	mv.addObject("updatefailed", failure);
//		    mv.setViewName("filmupdated");
//		    return mv;
//	    }
	  }


}
