public with sharing class RESTRequestController {
    @AuraEnabled
    public static List<Account> getExternalData() {
        // The URL of the external API
        String apiUrl = 'https://dev-1ryx843z3515ih5.api.raw-labs.com/aura_JSON';

        // Make the REST request
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(apiUrl);
        request.setHeader('Authorization', 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlFUaERPVGc1TXpkQ1FUbENRVGd6TVRsRU1URTFOVFl3TVRrM1JUTkdRall6TWtNME1qSkZPUSJ9.eyJodHRwczovL3Jhdy1sYWJzLmNvbS9wZXJtaXNzaW9ucyI6W3siZGV2LTFyeXg4NDN6MzUxNWloNSI6eyJjb25zdW1lciI6WyIiXSwicHJvZHVjZXIiOlsiYWRtaW4iXX19XSwiaXNzIjoiaHR0cHM6Ly9yYXcuZXUuYXV0aDAuY29tLyIsInN1YiI6ImF1dGgwfDYzZTAxM2IzOTc3MTczMTM3ODIxODY4YSIsImF1ZCI6WyJodHRwczovL3Jhdy1sYWJzLmNvbS9yYXcvYWRtaW4iLCJodHRwczovL3Jhdy5ldS5hdXRoMC5jb20vdXNlcmluZm8iXSwiaWF0IjoxNjc3MDk1MDQ4LCJleHAiOjE2NzcxODE0NDgsImF6cCI6IkdPTFVIM05VM1dtY2R5T2tVekVCNHAwZ2FmN2N2NkhaIiwic2NvcGUiOiJvcGVuaWQgcHJvZmlsZSBlbWFpbCIsInBlcm1pc3Npb25zIjpbXX0.WPge74QgDukiZhSTSvR3ftLZ45uM86RXhZbChqlGbC4IpHZ7PXOYsJUluTXXb6ccAh224f5Id5XTshRN1zePkrtVQcq3PzZKPMoLp9gGKviWjNJMMDumumuTWvpnM6PwIeo4DXV_I-Gv_WrYUDpn_qNPnbStMtg1QBmNoIZCNl3idJpysnru1NRLZftRHi4wN5INmhIS95SDuOz6N-0LC2SjrV0ZbNigUx5dWJ0C0RU9kPLUs6JO_8Va8CIY5MIS2MfiSjJiDzRZnvxB-nFSnVRreDPeQUsjEl7iU8h4jbl1Ca8Y9qbQiDgh9BhO6MidT0tbaJsfDKGSVeR_P776Rg');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            List<Account> accounts = (List<Account>) JSON.deserialize(response.getBody(), List<Account>.class);
            return accounts;
        }
        return null;
    }

    
    @AuraEnabled
    public static void updateRecords(List<Account> accounts) {
        accounts = getExternalData();
        insert accounts;
    }
}