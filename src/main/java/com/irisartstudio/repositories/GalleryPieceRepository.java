package com.irisartstudio.repositories;

import java.util.List;
import org.springframework.data.repository.CrudRepository;

import com.irisartstudio.models.GalleryPiece;

public interface GalleryPieceRepository extends CrudRepository<GalleryPiece, Long> {

	List<GalleryPiece> findAll();
	List<GalleryPiece> findAllByMedia(String media);
	
}