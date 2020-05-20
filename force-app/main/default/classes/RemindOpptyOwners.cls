//implement the Schedulable interface 
//must implement the only method that this interface contains, 
//which is the execute method.
global class RemindOpptyOwners implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Opportunity> opptys = [SELECT Id, Name, OwnerId, CloseDate 
            FROM Opportunity 
            WHERE IsClosed = False AND 
            CloseDate < TODAY];
        // Create a task for each opportunity in the list
        TaskUtils.remindOwners(opptys);
    }
    
}
