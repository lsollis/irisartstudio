package com.irisartstudio.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.irisartstudio.models.GalleryPiece;
import com.irisartstudio.models.Image;
import com.irisartstudio.repositories.ImageRepository;

@Service
public class ImageService {

	@Autowired
	private ImageRepository imageRepository;
	
	public List<Image> getAllImages() {
		return imageRepository.findAll();
	}
	
	public Image createImage(Image image) {
		return imageRepository.save(image);
	}
	
	 public Image findById(Long id) {
	     Optional<Image> optionalImage = imageRepository.findById(id);
	     if(optionalImage.isPresent()) {
	         return optionalImage.get();
	     }
	     return null;
	 }
	 
	 //public Optional<Image> findByGalleryPiece(GalleryPiece galleryPiece) {
		 //return imageRepository.findByGalleryPiece(galleryPiece);
	 //}
	
	 public Image updateImage(Image image) {
		return imageRepository.save(image);
	 }
	 
	 public void deleteImage(Long id) {
		Optional<Image> optionalImage = imageRepository.findById(id);
		if (optionalImage.isPresent()) {
			imageRepository.deleteById(id);
		}
	}
	 
}