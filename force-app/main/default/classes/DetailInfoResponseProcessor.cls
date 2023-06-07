public with sharing class DetailInfoResponseProcessor {
	public Boolean adult;
	public String backdrop_path;
	public Integer budget;
	public List<Genres> genres;
	public String homepage;
	public Integer id;
	public String imdb_id;
	public String original_language;
	public String original_title;
	public String overview;
	public Double popularity;
	public String poster_path;
	public String release_date;
	public Integer revenue;
	public Integer runtime;
	public String status;
	public String tagline;
	public String title;
	public Boolean video;
	public Double vote_average;
	public Integer vote_count;
    public String image_url;
    public List<Trailers> trailers {get;set;}
    
    public List<Cast_Z> cast_Z {get;set;} // in json: cast
	public List<Crew> crew {get;set;} 
    
    public String setImageURL() {
        return 'https://image.tmdb.org/t/p/w500'+this.poster_path;
    }
    public class Trailers {
		public String iso_639_1;
		public String iso_3166_1;
		public String name;
		public String key;
		public String published_at;
		public String site;
		public Integer size;
		public String type;
		public Boolean official;
		public String id;
        public Trailers(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'iso_639_1') {
							iso_639_1 = parser.getText();
						} else if (text == 'iso_3166_1') {
							iso_3166_1 = parser.getText();
						} else if (text == 'name') {
							name = parser.getText();
						} else if (text == 'key') {
							key = parser.getText();
						} else if (text == 'published_at') {
							published_at = parser.getText();
						} else if (text == 'site') {
							site = parser.getText();
						} else if (text == 'size') {
							size = parser.getIntegerValue();
						} else if (text == 'type') {
							type = parser.getText();
						} else if (text == 'official') {
							official = parser.getBooleanValue();
                        } else if(text == 'id') {
                            id = parser.getText();
                        }else {
							
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
    
	public class Genres {
		public Integer id;
		public String name;
	}

	public class Crew {
		public Boolean adult {get;set;} 
		public Integer gender {get;set;} 
		public String known_for_department {get;set;} 
		public String name {get;set;} 
		public String original_name {get;set;} 
		public Double popularity {get;set;} 
		public String profile_path {get;set;} 
		public String credit_id {get;set;} 
		public String department {get;set;} 
		public String job {get;set;} 

		public Crew(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'adult') {
							adult = parser.getBooleanValue();
						} else if (text == 'gender') {
							gender = parser.getIntegerValue();
						} else if (text == 'known_for_department') {
							known_for_department = parser.getText();
						} else if (text == 'name') {
							name = parser.getText();
						} else if (text == 'original_name') {
							original_name = parser.getText();
						} else if (text == 'popularity') {
							popularity = parser.getDoubleValue();
						} else if (text == 'profile_path') {
							profile_path = (string)parser.readValueAs(String.class);
						} else if (text == 'credit_id') {
							credit_id = parser.getText();
						} else if (text == 'department') {
							department = parser.getText();
						} else if (text == 'job') {
							job = parser.getText();
						} else {
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Cast_Z {
		public Boolean adult {get;set;} 
		public Integer gender {get;set;} 
		public Integer id {get;set;} 
		public String known_for_department {get;set;} 
		public String name {get;set;} 
		public String original_name {get;set;} 
		public Double popularity {get;set;} 
		public String profile_path {get;set;} 
		public Integer cast_id {get;set;} 
		public String character {get;set;} 
		public String credit_id {get;set;} 
		public Integer order {get;set;} 

		public Cast_Z(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'adult') {
							adult = parser.getBooleanValue();
						} else if (text == 'gender') {
							gender = parser.getIntegerValue();
						} else if (text == 'id') {
							id = parser.getIntegerValue();
						} else if (text == 'known_for_department') {
							known_for_department = parser.getText();
						} else if (text == 'name') {
							name = parser.getText();
						} else if (text == 'original_name') {
							original_name = parser.getText();
						} else if (text == 'popularity') {
							popularity = parser.getDoubleValue();
						} else if (text == 'profile_path') {
							profile_path = parser.getText();
						} else if (text == 'cast_id') {
							cast_id = parser.getIntegerValue();
						} else if (text == 'character') {
							character = parser.getText();
						} else if (text == 'credit_id') {
							credit_id = parser.getText();
						} else if (text == 'order') {
							order = parser.getIntegerValue();
						} else {
							//System.debug(LoggingLevel.WARN, 'Cast_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static DetailInfoResponseProcessor parseData(String json, DetailInfoResponseProcessor processor) {
		System.JSONParser parser = System.JSON.createParser(json);
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'id') {
						processor.id = parser.getIntegerValue();
					} else if (text == 'cast') {
						processor.cast_Z = arrayOfCast_Z(parser);
					} else if (text == 'crew') {
						processor.crew = arrayOfCrew(parser);
                    } else if(text == 'results'){
                        processor.trailers = arrayOfTrailers(parser);
                    } else {
						//System.debug(LoggingLevel.WARN, 'JSON2Apex consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
		return processor;
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
    
    private static List<Cast_Z> arrayOfCast_Z(System.JSONParser p) {
        List<Cast_Z> res = new List<Cast_Z>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Cast_Z(p));
        }
        return res;
    }

	private static List<Crew> arrayOfCrew(System.JSONParser p) {
        List<Crew> res = new List<Crew>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Crew(p));
        }
        return res;
    }
    
    private static List<Trailers> arrayOfTrailers(System.JSONParser p) {
        List<Trailers> trailers = new List<Trailers>();
        if(p.getCurrentToken() == null) p.nextToken();
        while(p.nextToken() != System.JSONToken.END_ARRAY) {
            trailers.add(new Trailers(p));
        }
        return trailers;
    }
	public static DetailInfoResponseProcessor parse(String json) {
		return (DetailInfoResponseProcessor) System.JSON.deserialize(json, DetailInfoResponseProcessor.class);
	}
}