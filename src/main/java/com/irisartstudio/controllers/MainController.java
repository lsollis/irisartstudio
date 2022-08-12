package com.irisartstudio.controllers;

import java.text.SimpleDateFormat;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.irisartstudio.models.GalleryPiece;
import com.irisartstudio.models.LoginUser;
import com.irisartstudio.models.User;
import com.irisartstudio.services.FileService;
import com.irisartstudio.services.GalleryPieceService;
import com.irisartstudio.services.ImageService;
import com.irisartstudio.services.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private GalleryPieceService galleryPieceService;
	
	@Autowired
	private FileService fileService;
	
	//private static String IMG_FOLDER = "src/main/resources/static/img/";
	SimpleDateFormat outputFormatter = new SimpleDateFormat("MM/dd/yyyy");
	
	@GetMapping("/")
	public String homePage() {
		return "redirect:/landing";
	}
	
	@GetMapping("/landing")
	public String landingPage(Model model) {
		
		model.addAttribute("galleryPieces", galleryPieceService.getAllGalleryPieces());
		
		return "landing.jsp";
	}
	
	@GetMapping("/about")
	public String bio() {
		return "about.jsp";
	}
	
	@GetMapping("/login")
	public String home(Model model) {
		
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}
	
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
        User user = userService.register(newUser, result);
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "login.jsp";
        }
        
        // Store ID from the DB in session,
        session.setAttribute("userId", user.getId());
        // in other words, log them in
    
        return "redirect:/dashboard";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
        User user = userService.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "login.jsp";
        }
    
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
    
        return "redirect:/dashboard";
    }
    
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/logout";
    	}
    	
    	// get userId from session to cast to Long; session.getAttribute("userId") returns an object
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", userService.findById(userId));
    	model.addAttribute("galleryPieces", galleryPieceService.getAllGalleryPieces());
    	
    	return "dashboard.jsp";
    	
    }
    
    @GetMapping("/gallery")
    public String gallery(Model model) {

    	// get userId from session to cast to Long; session.getAttribute("userId") returns an object
    	model.addAttribute("galleryPieces", galleryPieceService.getAllGalleryPieces());
    	
    	return "gallery.jsp";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	// log out user
    	session.setAttribute("userId", null);
    	// redirect to login page
    	return "redirect:/";
    }
    
    @GetMapping("/gallery/new")
    public String newBook(Model model, HttpSession session, @ModelAttribute("galleryPiece") GalleryPiece galleryPiece) {
    	
    	User user = userService.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	
    	return "newGalleryPiece.jsp";
    }
    
    @PostMapping("/gallery/create")
    public String createGalleryPiece(
    		@Valid @ModelAttribute("galleryPiece") GalleryPiece galleryPiece,
    		BindingResult result,
    		//RedirectAttributes redirectAttributes,
    		Model model,
    		@RequestParam("file") MultipartFile file) {
    	
    	if(result.hasErrors()) {
    		model.addAttribute("galleryPiece", galleryPiece);
    		return "newGalleryPiece.jsp";
    	}

		this.fileService.save(file);
    	galleryPiece.setImageUrl("uploads/" + file.getOriginalFilename());
    	
    	galleryPiece.setSimpleDate(outputFormatter.format(galleryPiece.getCreatedOn()));
    	System.out.println("Simple date: " + galleryPiece.getSimpleDate());
    	
    	this.galleryPieceService.createGalleryPiece(galleryPiece);
    	
    	//redirectAttributes.addFlashAttribute("message", "gallery piece added");
    	
    	return "redirect:/dashboard";
    }
    
    @GetMapping("/gallery/edit/{id}")
    public String editGalleryPiece(Model model, @PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	GalleryPiece galleryPiece = galleryPieceService.findById(id);
    	model.addAttribute("galleryPiece", galleryPiece);
    	
    	return "editGalleryPiece.jsp";
    }
    
    @PutMapping("/gallery/edit/{id}")
    public String updateGalleryPiece(
    		@Valid @ModelAttribute("galleryPiece") GalleryPiece galleryPiece, 
    		BindingResult result,
    		Model model,
    		@RequestParam("file") MultipartFile file) {
    	System.out.println("gallery piece to save to DB: " + galleryPiece.getId());
    	
    	if(result.hasErrors()) {
    		return "editGalleryPiece.jsp";
    	}
    	
    	if( !file.isEmpty()) {
    		this.fileService.save(file);
        	galleryPiece.setImageUrl("uploads/" + file.getOriginalFilename());
        	System.out.println("New URL: " + galleryPiece.getImageUrl());
    	}
    	
    	galleryPiece.setSimpleDate(outputFormatter.format(galleryPiece.getCreatedOn()));
    	
    	galleryPieceService.updateGalleryPiece(galleryPiece);
    	return "redirect:/dashboard";
    }
    
    @DeleteMapping("/gallery/delete/{id}")
    public String destroy(@PathVariable("id") Long id) {
        galleryPieceService.deleteGalleryPiece(id);
        return "redirect:/dashboard";
    }
	
}
