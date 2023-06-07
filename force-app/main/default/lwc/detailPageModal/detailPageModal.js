import { api, LightningElement, track, wire } from 'lwc';
import LightningModal from 'lightning/modal';
import getMovieDetails from '@salesforce/apex/MoviesDataController.getMoviesDetails';

export default class DetailPageModal extends LightningModal {
    @track movie;
    @api movie_id;
    @track isLoading = false;
    @api isMovie;

    connectedCallback() {
        this.isLoading = true;
        console.log('movie id:'+this.movie_id);
        getMovieDetails({id:this.movie_id, isMovie:this.isMovie})
            .then((result)=>{
                console.log('result:'+result);
                this.movie = JSON.parse(result);
                this.isLoading = false;
            }).catch((error)=>{
                console.log(error);
                console.error('OUTPUT: ',error);
                this.isLoading = false;
            })
    }
    handleCloseClick() {
        this.close('closed');
    }

    get title() {
        return this.movie.title != null ? this.movie.title : this.movie.name;
    }

    get releasedDate() {
        var options = { month: 'short', day: 'numeric', year: 'numeric' };
        var releasedDate = new Date(this.movie.release_date != null ? this.movie.release_date : this.movie.first_air_date);
        return releasedDate.toLocaleDateString("en-US", options);
    }
}