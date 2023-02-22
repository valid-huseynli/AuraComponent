
global with sharing class MultiRecordEditorController {
    @AuraEnabled
    public static List<Account> getRecords() {
      return [SELECT Id, Name, Industry, Type FROM Account LIMIT 10];
    }
  
    @AuraEnabled
    public static void updateRecords(List<Account> records) {
      update records;
    }
  }
  