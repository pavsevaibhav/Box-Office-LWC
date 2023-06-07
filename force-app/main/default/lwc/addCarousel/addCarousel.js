import { api,wire, LightningElement } from 'lwc';
import getCarousel from '@salesforce/apex/UtilityClass.getCarousel'


export default class AddCarousel extends LightningElement {
    data = [];
    item = [];
    @wire(getCarousel)
    dataList({ error, data }) {
         if (data) {
            this.data = data;
            this.item = data[0];
        }
    }


    
}