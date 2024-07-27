// Archivo: Main.java
package com.example;

public class Main {
    public static void main(String[] args) {
        OrderService orderService = new OrderService();
        
        for (int i = 1; i <= 20; i++) {
            String orderId = "ORD-" + String.format("%03d", i);
            try {
                orderService.processOrder(orderId);
            } catch (RuntimeException e) {
                System.err.println(e.getMessage());
            }
        }
    }
}