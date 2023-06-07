public class UtilityClass {
    @AuraEnabled(cacheable=true)
    public static List<String> getCarousel() {
        List<DataList__c> listOfData = [select Name, url__c from DataList__c];
        List<String> urls = new List<String>();
        for(DataList__c data : listOfData) {
            urls.add(data.url__c);
        }
        return urls;
    }
}