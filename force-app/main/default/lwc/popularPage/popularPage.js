import { api, LightningElement, track, wire } from 'lwc';
import getPopularMoviesOrSeries from '@salesforce/apex/MoviesDataController.getPopularMoviesOrSeries';
export default class PopularPage extends LightningElement {
    @track isMovieClicked = true;
    @track moviesData;
    @track searchQuery = '';
    @track error;

    @wire(getPopularMoviesOrSeries, {isPopularMovies: '$isMovieClicked'})
    fetchData({data, error}){
		if(data) {
            let movies = JSON.parse(data);
			this.error = undefined;
            this.moviesData = movies.map(movie => ({
                                ...movie,
                               imageUrl: `https://image.tmdb.org/t/p/w500${movie.poster_path}`
                           }));
		}else {
			this.moviesData =undefined;
			this.error = error;
		}
	};

        // fetchMoviesHandler(event) {
        //     this.searchQuery = event.detail.toLowerCase();
        //     console.log('search:'+this.searchQuery);
        // }
    
        // get filteredMovies() {
        //     if (!this.searchQuery) {
        //       return this.moviesData;
        //     }
            
        //     const queryLetters = this.searchQuery.toLowerCase().split('');
        //     let movieList =  this.moviesData.filter(movie => {
        //     const movieTitle = movie.title.toLowerCase();
        //     return queryLetters.every(letter => movieTitle.includes(letter));
        //     });
        //     if(movieList == null || movieList == 'undefined') {
        //         fetch('https://api.themoviedb.org/3/search/$this.searchQuery?page=1')
        //         .then(response => response.json())
        //         .then(response => {
        //             console.log('response from search:'+response);
        //             movieList = response.results.map(movie => ({
        //                 ...movie,
        //                 imageUrl: `https://image.tmdb.org/t/p/w500${movie.poster_path}`
        //             }));
        //         })
        //         .catch(err => console.error(err));
        //     }
        //     return movieList;
        // }
    handleClick(event) {
        if(event.target.value == 'Movies') {
            this.isMovieClicked = true;

        } else {
            this.isMovieClicked = false;
        }
    }

    get toggleClassMovie() {
        return this.isMovieClicked ? 'search-btn' : 'disable-style';
    }

    get toggleClassTV() {
        return !this.isMovieClicked ? 'search-btn' : 'disable-style';
    }

}