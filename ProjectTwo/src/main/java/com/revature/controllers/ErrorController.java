package com.revature.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ErrorController {
	
	@RequestMapping(value = "errors", method = RequestMethod.GET)
    public ModelAndView renderErrorPage(HttpServletRequest httpRequest) {
         
        ModelAndView errorPage = new ModelAndView("errorPage");
        String errorMsg = "";
        int errorCode;
        int httpErrorCode = getErrorCode(httpRequest);
 
        switch (httpErrorCode) {
            case 400: {
            	errorCode = 400;
                errorMsg = "Http Error Code: 400. Bad Request";
                break;
            }
            case 401: {
            	errorCode = 401;
                errorMsg = "Http Error Code: 401. Unauthorized";
                break;
            }
            case 404: {
            	errorCode = 404;
                errorMsg = "Http Error Code: 404. Resource not found";
                break;
            }
            case 500: {
            	errorCode = 500;
                errorMsg = "Http Error Code: 500. Internal Server Error";
                break;
            }
            default: {
            	errorCode = 404;
            	errorMsg = "An error occured";
            	break;
            }
        }
        errorPage.addObject("errorMsg", errorMsg);
        errorPage.addObject("errorCode", errorCode);
        return errorPage;
    }
     
    private int getErrorCode(HttpServletRequest httpRequest) {
    	Integer errorCode = (Integer) httpRequest.getAttribute("javax.servlet.error.status_code");
    	System.out.println("Error code is " +errorCode);
        return errorCode;
    }
}
