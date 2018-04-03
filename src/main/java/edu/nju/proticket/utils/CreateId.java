package edu.nju.proticket.utils;

public class CreateId {

    private static Integer count = 0;

    public static String createOrderId(int memberId){
        Long timeMillis = System.currentTimeMillis();
        String orderId = String.valueOf(memberId) + String.valueOf(timeMillis);
        return orderId;
    }

    public static int createVenueId(){
        count ++;
        return 1200503 + count;
    }
}
