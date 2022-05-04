@isTest
public class LeadTriggerTest {
	@isTest
    static void testBeforeInsertPos(){
        Lead testLead = new Lead(LastName = 'PositiveTest', Company = 'Revature', Status = 'Open - Not Contacted');
        
        Test.startTest();
        insert testLead;
        Test.stopTest();
        
        testLead = [SELECT Rating FROM Lead WHERE Id =:testLead.Id];
     
        System.assertEquals( 'Cold', testLead.Rating);
        
    }
     @isTest
    static void testBeforeInsertNeg(){
        Lead testLead = new Lead(LastName = 'NegativeTest', Company = 'Revature', Status = 'Working - Contacted');
        
        Test.startTest();
        insert testLead;
        Test.stopTest();
        
        testLead = [SELECT Rating FROM Lead WHERE Id =:testLead.Id];
       
        System.assertEquals( null, testLead.Rating);
        
        
    }
    @isTest
    static void testBeforeUpdatePos(){
        Lead testLead = new Lead(LastName = 'Test', Company = 'Revature', Status = 'Open - Not Contacted', Rating = 'Hot');
        
        Test.startTest();
        insert testLead;
        testLead.Status = 'Working - Contacted';
        update testLead;
        Test.stopTest();
        
        testLead = [SELECT Description FROM Lead WHERE Id =:testLead.Id];
        
        System.assertEquals( 'Please Contact Sales Manager', testLead.description);
        
    }
    @isTest
    static void testBeforeUpdateNeg(){
        Lead testLead = new Lead(LastName = 'Test', Company = 'Revature', Status = 'Open - Not Contacted', Rating = 'Cold');
        
        Test.startTest();
        insert testLead;
        testLead.Status = 'Working - Contacted';
        update testLead;
        Test.stopTest();
        
        testLead = [SELECT Description FROM Lead WHERE Id =:testLead.Id];
       
        
        System.assertEquals( null, testLead.description);
        
    }
    
    /*@isTest
    static void testConvertedLead(){
        List<Lead> testLead = [SELECT Id, Status FROM Lead WHERE Id = '00Q8b00001vR6dQEAS'];
        for (Lead l : testLead){
            l.Status = 'Closed - Converted';
        }
        update testLead;
        
        List<Task> taskList = [SELECT WhatId FROM Task WHERE WhatId = '00Q8b00001vR6dQEAS'];
        
        System.assertEquals(1, taskList.size());
    }*/
}