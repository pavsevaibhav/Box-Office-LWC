public with sharing class MoviesDataController {
    @AuraEnabled(cacheable=true)
    public static string getPopularMoviesOrSeries(Boolean isPopularMovies){
        try {
            ResponseProcessor response;
            string movieOrSeries = isPopularMovies ? 'movie' : 'tv';
            response = RestAPICallout.getPopularMoviesOrTvSeries(movieOrSeries);
            return JSON.serializePretty(response.results);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static string getTrendingData(Boolean isDaySelected){
        try {
            ResponseProcessor response;
            string dayOrWeek = isDaySelected ? 'day' : 'week';
            response = RestAPICallout.getTrendingMoviesData(dayOrWeek);
            return JSON.serializePretty(response.results);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static DetailInfoResponseProcessor getMoviesDetails(integer movie_id){
        try {
            DetailInfoResponseProcessor detailInfo = RestAPICallout.getMoviesDetails(movie_id);
            detailInfo.image_url = detailInfo.setImageURL();
            String castResponse = RestAPICallout.getMovieCastDetail(movie_id);
            string trailerResponse = RestAPICallout.getVideoTrailer(movie_id);
            detailInfo = DetailInfoResponseProcessor.parseData(castResponse, detailInfo);
            detailInfo = DetailInfoResponseProcessor.parseData(trailerResponse, detailInfo);
            return detailInfo;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}