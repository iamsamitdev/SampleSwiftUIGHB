//
//  ContentView.swift
//  DemoMVVMApp
//
//  Created by Samit Koyom on 16/6/2568 BE.
//

import SwiftUI

struct ContentViewOLD: View {
    
    // การสร้างตัวแปรแบบ @State
    @State var count: Int = 0
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Modern gradient background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(.systemBlue).opacity(0.1),
                        Color(.systemPurple).opacity(0.1),
                        Color(.systemIndigo).opacity(0.1)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    // Modern counter display card
                    VStack(spacing: 16) {
                        Text("COUNTER")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                            .tracking(2)
                        
                        Text("\(count)")
                            .font(.system(size: 72, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                            .scaleEffect(isAnimating ? 1.1 : 1.0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isAnimating)
                    }
                    .frame(width: 200, height: 200)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.ultraThinMaterial)
                            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                    )
                    
                    // Modern button stack
                    VStack(spacing: 16) {
                        // Increment button
                        ModernButton(
                            icon: "plus.circle.fill",
                            title: "เพิ่ม",
                            color: .blue,
                            action: {
                                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                    count += 1
                                    triggerAnimation()
                                }
                            }
                        )
                        
                        HStack(spacing: 16) {
                            // Decrement button
                            ModernButton(
                                icon: "minus.circle.fill",
                                title: "ลด",
                                color: .green,
                                action: {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                        count -= 1
                                        triggerAnimation()
                                    }
                                }
                            )
                            
                            // Reset button
                            ModernButton(
                                icon: "arrow.clockwise.circle.fill",
                                title: "รีเซ็ต",
                                color: .orange,
                                action: {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                        count = 0
                                        triggerAnimation()
                                    }
                                }
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
    
    private func triggerAnimation() {
        isAnimating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            isAnimating = false
        }
    }
}

// Modern Button Component
struct ModernButton: View {
    let icon: String
    let title: String
    let color: Color
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .semibold))
                
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color,
                                color.opacity(0.8)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: color.opacity(0.3), radius: 8, x: 0, y: 4)
            )
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: isPressed)
        }
        .buttonStyle(PlainButtonStyle())
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
    }
}

#Preview {
    ContentViewOLD()
}
