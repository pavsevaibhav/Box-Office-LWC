public with sharing class ResponseProcessor {

	public Integer page;
	public List<Results> results;
	public Integer total_pages;
	public Integer total_results;

	public class Results {
		public Boolean adult;
		public String backdrop_path;
		public String first_air_date;
		public List<Integer> genre_ids;
		public Integer id;
		public String name;
		public List<String> origin_country;
		public String original_language;
		public String original_title;
        public String original_name;
		public String overview;
		public Double popularity;
		public String poster_path;
		public String release_date;
		public String title;
		public Boolean video;
		public Double vote_average;
		public Integer vote_count;
	}

	
	public static ResponseProcessor parse(String json) {
		return (ResponseProcessor) System.JSON.deserialize(json, ResponseProcessor.class);
	}
}