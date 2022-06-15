package com.study.jstl;
public class ELDTO { 
    private String name; 
    private String movie; 
     
    public ELDTO() { 
        super(); 
        // TODO Auto-generated constructor stub 
    } 

   public ELDTO(String name, String movie) { 
        super(); 
        this.name = name; 
        this.movie = movie; 
    } 

    public String getName() { 
        System.out.println("getName() call"); 
        return name; 
    } 

    public void setName(String name) { 
        System.out.println("setName() call"); 
        this.name = name; 
    } 

    public String getMovie() { 
        System.out.println("getMovie() call"); 
        return movie; 
    } 

    public void setMovie(String movie) { 
        System.out.println("setMovie() call"); 
        this.movie = movie; 
    } 
     
} 