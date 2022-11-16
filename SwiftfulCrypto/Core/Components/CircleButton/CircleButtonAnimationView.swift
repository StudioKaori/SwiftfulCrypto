//
//  CircleButtonAnimationView.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-16.
//

import SwiftUI

struct CircleButtonAnimationView: View {
  
  @State private var animate: Bool = false
  
  var body: some View {
    Circle()
      .stroke(lineWidth: 5.0)
      .scale(animate ? 1.0 : 0.0)
    // on the timing of the view appear, toggle the animate to start the animation
      .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
      .onAppear {
        animate.toggle()
      }
  }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    CircleButtonAnimationView()
  }
}
