import { api, LightningElement, track, wire } from 'lwc';
import accessToken from '@salesforce/label/c.Access_Token';
import getTrendingData from '@salesforce/apex/MoviesDataController.getTrendingData';
// Example :- import TRAILHEAD_LOGO from '@salesforce/resourceUrl/trailhead_logo';'

export default class TrendingPage extends LightningElement {
    @track isTodayClicked = true;
    @track moviesData;
    @track searchQuery = '';
    @track dayOrWeek = 'day';
    @track isLoading = false;

    @wire(getTrendingData, {isDaySelected: '$isTodayClicked'})
    fetchTrendingData({data, error}) {
        if(data) {
            let movies = JSON.parse(data);
            this.moviesData = movies.map(movie => ({
                                ...movie,
                               imageUrl: `https://image.tmdb.org/t/p/w500${movie.poster_path}`
                           }));
        }
    }
    
    handleClick(event) {
        if(event.target.value == 'Today') {
            this.isTodayClicked = true;
        } else {
            this.isTodayClicked = false;
        }
    }

    get toggleClassToday() {
        return this.isTodayClicked ? 'search-btn' : 'disable-style';
    }

    get toggleClassWeek() {
        return !this.isTodayClicked ? 'search-btn' : 'disable-style';
    }

}