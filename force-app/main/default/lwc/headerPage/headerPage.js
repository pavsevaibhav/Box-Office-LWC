import { LightningElement, api } from 'lwc';

export default class HeaderPage extends LightningElement {
    @api appLogo;
    @api menuItems;
}