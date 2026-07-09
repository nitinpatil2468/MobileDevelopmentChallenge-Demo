//
//  MovieCell.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import SwiftUI

struct MovieCell: View {
    var movie: MovieDTO
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(movie.name)
                .font(.title3)
                .fontWeight(.semibold)
                .lineLimit(1)  
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
            
            Text("RottenTomatoScore: \(movie.rating)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 2)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(Color.white)
        .cornerRadius(8)
    }
}
