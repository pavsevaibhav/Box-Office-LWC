import { api, LightningElement, track, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import DetailPageModal from 'c/detailPageModal';

export default class MovieCard extends NavigationMixin(LightningElement) {
    @api movie;
    @track isModalShow = false;
    get title() {
        return this.movie.title != null ? this.movie.title : this.movie.name;
    }

    get releasedDate() {
        var options = { month: 'short', day: 'numeric', year: 'numeric' };
        var releasedDate = new Date(this.movie.release_date != null ? this.movie.release_date : this.movie.first_air_date);
        return releasedDate.toLocaleDateString("en-US", options);
    }

    navigateToNext(event) {
        event.preventDefault();
        console.log('under movie:' + JSON.stringify(this.movie));
        let isMovie = this.movie.title != null && this.movie.title != '' ? true : false;
        DetailPageModal.open({
            movie_id: this.movie.id,
            isMovie: isMovie
        })

    }
}