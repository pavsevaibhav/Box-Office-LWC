import { LightningElement, api, wire, track } from 'lwc';

export default class DetailsPage extends LightningElement {
    @track movie;
    @api movies;

    connectedCallback() {
        console.log('under:'+this.movies);
        this.movie = JSON.parse(this.movies);
    }
}