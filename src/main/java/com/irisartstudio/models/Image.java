package com.irisartstudio.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name="images")
public class Image {

	@Id
	@GeneratedValue
	Long id;
	
	@Lob
	byte[] content;
	
	
	@NotBlank(message = "name must not be blank")
	String name;
	
	//@OneToOne(mappedBy="image")
	//private GalleryPiece galleryPiece;


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public byte[] getContent() {
		return content;
	}


	public void setContent(byte[] content) {
		this.content = content;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	//public GalleryPiece getGalleryPiece() {
		//return galleryPiece;
	//}


	//public void setGalleryPiece(GalleryPiece galleryPiece) {
		//this.galleryPiece = galleryPiece;
	//}
	
}
