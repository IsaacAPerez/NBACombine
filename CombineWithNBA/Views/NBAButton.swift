//
//  NBAButton.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/23/23.
//

import SwiftUI

/// A customizable button with NBA styling.
struct NBAButton: View {
    /// The title of the button.
    var title: String
    /// The action to be performed when the button is tapped.
    var action: () -> Void
    /// The background color of the button.
    var backgroundColor: Color = Color("NBARed")
    /// The text color of the button.
    var textColor: Color = .white

    /// The body of the NBAButton.
    var body: some View {
        Text(title)
            .foregroundColor(textColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .clipShape(.capsule)
            .onTapGesture {
                action()
            }
    }

    /// Sets the background color of the button.
    /// - Parameter color: The color to set as the background color.
    /// - Returns: A modified NBAButton with the specified background color.
    func backgroundColor(_ color: Color) -> Self {
        var view = self
        view.backgroundColor = color
        return view
    }

    /// Sets the text color of the button.
    /// - Parameter color: The color to set as the text color.
    /// - Returns: A modified NBAButton with the specified text color.
    func textColor(_ color: Color) -> Self {
        var view = self
        view.textColor = color
        return view
    }
}

// Preview for the NBAButton
struct NBAButton_Previews: PreviewProvider {
    static var previews: some View {
        NBAButton(title: "Button", action: {})
            .padding()
    }
}
