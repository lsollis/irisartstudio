package com.irisartstudio.models;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PastOrPresent;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="gallery")
public class GalleryPiece {
	
	//@OneToOne(cascade = CascadeType.ALL)
	//@JoinColumn(name = "image_id", referencedColumnName = "id")
	//private Image image;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message = "title must not be blank")
	private String title; 
	
	@NotBlank(message = "size must not be blank")
	private String size;
	
	@NotBlank(message = "media type must not be blank")
	private String media;
	
	@PastOrPresent(message = "must select a past or present date")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdOn;
	
	private String imageUrl;
	
	private String simpleDate;

	@Column(updatable=false)
	private Date uploadedAt;
	
	private Date updatedAt;
	
	/*
	public GalleryPiece(@NotBlank(message = "title must not be blank") String title,
			@NotBlank(message = "size must not be blank") String size,
			@NotBlank(message = "media type must not be blank") String media,
			@PastOrPresent(message = "must select a past or present date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date createdOn, String imageUrl) {
		super();
		this.id = id;
		this.title = title;
		this.size = size;
		this.media = media;
		this.createdOn = createdOn;
		this.imageUrl = imageUrl;
		this.uploadedAt = uploadedAt;
		this.updatedAt = updatedAt;
	}
	*/

	public GalleryPiece() {}
	
	 @PrePersist
	 protected void onUpload(){
	     this.uploadedAt = new Date();
	 }
	 
	 @PreUpdate
	 protected void onUpdate(){
	     this.updatedAt = new Date();
	 }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getMedia() {
		return media;
	}

	public void setMedia(String media) {
		this.media = media;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getUploadedAt() {
		return uploadedAt;
	}

	public void setUploadedAt(Date uploadedAt) {
		this.uploadedAt = uploadedAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	public String getSimpleDate() {
		return simpleDate;
	}

	public void setSimpleDate(String simpleDate) {
		this.simpleDate = simpleDate;
	}
}
