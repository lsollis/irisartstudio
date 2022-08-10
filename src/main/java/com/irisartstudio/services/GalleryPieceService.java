package com.irisartstudio.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.irisartstudio.models.GalleryPiece;
import com.irisartstudio.repositories.GalleryPieceRepository;

@Service
public class GalleryPieceService {
	
	@Autowired
	private GalleryPieceRepository galleryPieceRepository;
	
	public List<GalleryPiece> getAllGalleryPieces() {
		return galleryPieceRepository.findAll();
	}
	
	public void uploadGalleryPiece(String title, String size, String media, Date createdOn, String imageUrl) {
		
		GalleryPiece newGalleryPiece = new GalleryPiece(title, size, media, createdOn, imageUrl);
		this.galleryPieceRepository.save(newGalleryPiece);
		
	}
	
	public GalleryPiece createGalleryPiece(GalleryPiece galleryPiece) {
		return galleryPieceRepository.save(galleryPiece);
	}
	
	 public GalleryPiece findById(Long id) {
	     Optional<GalleryPiece> optionalGalleryPiece = galleryPieceRepository.findById(id);
	     if(optionalGalleryPiece.isPresent()) {
	         return optionalGalleryPiece.get();
	     }
	     
	     return null;
	 }
	
	 public GalleryPiece updateGalleryPiece(GalleryPiece galleryPiece) {
		return galleryPieceRepository.save(galleryPiece);
	 }
	 public void deleteGalleryPiece(Long id) {
		Optional<GalleryPiece> optionalGalleryPiece = galleryPieceRepository.findById(id);
		if (optionalGalleryPiece.isPresent()) {
			galleryPieceRepository.deleteById(id);
		}
	}

}
