import { LightningElement, track } from 'lwc';
import noHeader from '@salesforce/resourceUrl/noHeader';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';
import LOGO from '@salesforce/resourceUrl/appLogo';

export default class HomePageScreen extends LightningElement {
    @track appLogo;
    @track isLoading = false;
    connectedCallback() {
        loadStyle(this, noHeader);
        this.appLogo = LOGO;
    }
}