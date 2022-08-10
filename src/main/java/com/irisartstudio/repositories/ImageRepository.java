package com.irisartstudio.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.irisartstudio.models.GalleryPiece;
import com.irisartstudio.models.Image;

public interface ImageRepository extends CrudRepository<Image, Long> {

	//Optional<Image> findByGalleryPiece(GalleryPiece galleryPiece);
	List<Image> findAll();
	
}