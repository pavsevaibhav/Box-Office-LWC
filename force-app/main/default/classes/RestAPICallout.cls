public with sharing class RestAPICallout {
    public static ResponseProcessor getPopularMoviesOrTvSeries(string movieOrSeries) {
        string url = 'https://api.themoviedb.org/3/'+movieOrSeries+'/popular?language=en-US&page=1';
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer '+Label.Access_Token);
        String response = '';
        try {
            Http http = new Http();
            HTTPResponse res = http.send(req);
            if(res.getStatusCode() == 200) {
                response = JSON.serializePretty(JSON.deserializeUntyped(res.getBody()));
                return (ResponseProcessor)JSON.deserialize(response, ResponseProcessor.class);
            } else {
                throw new CalloutException(res.getBody());
            }
        } catch(Exception ex) {
            throw ex;
        }
    }
    
    public static ResponseProcessor getTrendingMoviesData(string dayOrWeek){
        string url = 'https://api.themoviedb.org/3/trending/all/'+dayOrWeek+'?language=en-US';
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer '+Label.Access_Token);
        String response = '';
        try {
            Http http = new Http();
            HTTPResponse res = http.send(req);
            if(res.getStatusCode() == 200) {
                response = JSON.serializePretty(JSON.deserializeUntyped(res.getBody()));
                return (ResponseProcessor)JSON.deserialize(response, ResponseProcessor.class);
            } else {
                throw new CalloutException(res.getBody());
            }
        } catch(Exception ex) {
            throw ex;
        }
    }

    public static DetailInfoResponseProcessor getMoviesDetails(integer movie_id) {
        string url = 'https://api.themoviedb.org/3/movie/'+movie_id+'?language=en-US';
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer '+Label.Access_Token);
        String response = '';
        try{
            Http http = new Http();
            HTTPResponse resp = http.send(request);
            if(resp.getStatusCode() == 200) {
                response = JSON.serializePretty(JSON.deserializeUntyped(resp.getBody()));
                return (DetailInfoResponseProcessor)JSON.deserialize(response, DetailInfoResponseProcessor.class);
            } else {
                throw new CalloutException(resp.getBody());
            }
        } catch(Exception ex) {
            throw ex;
        }
    }
    
    public static string getMovieCastDetail(integer movie_id) {
        string url = 'https://api.themoviedb.org/3/movie/'+movie_id+'/credits?language=en-US';
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer '+Label.Access_Token);
        String response = '';
        try{
            Http http = new Http();
            HTTPResponse resp = http.send(request);
            if(resp.getStatusCode() == 200) {
                response = JSON.serializePretty(JSON.deserializeUntyped(resp.getBody()));
                return response;
            } else {
                throw new CalloutException(resp.getBody());
            }
        } catch(Exception ex) {
            throw ex;
        }
    }
    
    public static string getVideoTrailer(integer movie_id) {
        string url = 'https://api.themoviedb.org/3/movie/'+movie_id+'/videos?language=en-US';
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer '+Label.Access_Token);
        String response = '';
        try{
            Http http = new Http();
            HTTPResponse resp = http.send(request);
            if(resp.getStatusCode() == 200) {
                response = JSON.serializePretty(JSON.deserializeUntyped(resp.getBody()));
                return response;
            } else {
                throw new CalloutException(resp.getBody());
            }
        } catch(Exception ex) {
            throw ex;
        }
    }
}