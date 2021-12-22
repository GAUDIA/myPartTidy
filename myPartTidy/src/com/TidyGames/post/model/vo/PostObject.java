package com.TidyGames.post.model.vo;

public class PostObject {

	private String search;
	private String word;
	
	public PostObject() {}

	public PostObject(String search, String word) {
		super();
		this.search = search;
		this.word = word;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	@Override
	public String toString() {
		return "PostObject [search=" + search + ", word=" + word + "]";
	}
	
	
	
}
