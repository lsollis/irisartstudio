package com.irisartstudio;

import javax.annotation.Resource;

import org.springframework.boot.CommandLineRunner;
import com.irisartstudio.services.FileService;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class IrisartstudioApplication implements CommandLineRunner {
	
	@Resource
	FileService fileService;

	public static void main(String[] args) {
		SpringApplication.run(IrisartstudioApplication.class, args);
	}
	
	// implemented from commandlinerunner
	@Override
	public void run(String...arg) throws Exception {
		this.fileService.init();
	}

}
