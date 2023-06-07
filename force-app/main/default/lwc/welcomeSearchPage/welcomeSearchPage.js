import { api, LightningElement, track } from 'lwc';

export default class WelcomeSearchPage extends LightningElement {
    @track searchQuery='';

    handleChange(event) {
        this.searchQuery = event.target.value;
    }
    handleClick(event) {
        event.preventDefault();
        const searchEvent = new CustomEvent('search', {
            detail: this.searchQuery
        });
        this.dispatchEvent(searchEvent);
    }
}