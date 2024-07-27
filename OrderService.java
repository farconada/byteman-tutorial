// Archivo: OrderService.java
package com.example;

import java.util.Random;
import java.util.concurrent.TimeUnit;

public class OrderService {
    private static final Random RANDOM = new Random();

    public void processOrder(String orderId) {
        System.out.println("Procesando orden: " + orderId);
        
        // Simular algún procesamiento
        try {
            TimeUnit.MILLISECONDS.sleep(RANDOM.nextInt(1000));
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        
        if (RANDOM.nextInt(10) == 0) {
            throw new RuntimeException("Error al procesar la orden: " + orderId);
        }
        
        System.out.println("Orden procesada con éxito: " + orderId);
    }
}