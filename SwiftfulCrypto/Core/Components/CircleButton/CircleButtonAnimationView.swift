//
//  CircleButtonAnimationView.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-16.
//

import SwiftUI

struct CircleButtonAnimationView: View {
  
  // Binding cannot be private since it's set by the parent view
  @Binding var animate: Bool
  
  var body: some View {
    Circle()
      .stroke(lineWidth: 5.0)
      .scale(animate ? 1.0 : 0.0)
      .opacity(animate ? 0.0 : 1.0)
      .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
      .onAppear {
        // on the timing of the view appear, toggle the animate to start the animation
        animate.toggle()
      }
  }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    CircleButtonAnimationView(animate: .constant(false))
      .frame(width: 100, height: 100)
  }
}
