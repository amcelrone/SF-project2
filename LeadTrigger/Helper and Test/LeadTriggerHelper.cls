public class LeadTriggerHelper {
	public static void beforeInsert(List<Lead> input){
        for(Lead l:input){
                if(l.Status == 'Open - Not Contacted'){
                	l.Rating = 'Cold';
                	System.debug(l.Rating);
                	System.debug('before insert fired');
                }
            }
    }
    
    public static void beforeUpdate(List<Lead> input){
        for(Lead l:input){
                if(l.Rating == 'Hot'){
                    System.debug('before update fired');
                    l.description = 'Please Contact Sales Manager';
                }
           }
    }
    
    
}