package com.irisartstudio.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUser {
	
    @NotEmpty(message="username is required")
    private String userName;
    
    @NotEmpty(message="password is required")
    @Size(min=8, max=128, message="password must be between 8 and 128 characters")
    private String password;
    
    public LoginUser() {}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}