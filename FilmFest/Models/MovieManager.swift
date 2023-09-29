//
//  MovieManager.swift
//  FilmFest
//
//  Created by Alice’z Poy on 2023-09-29.
//  Copyright © 2023 Author. All rights reserved.
//

import Foundation

class MovieManager {
    var moviesToSeeCount: Int { return moviesToSeeArray.count }
    var moviesSeenCount: Int { return moviesSeenArray.count }
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    func addMovie(movie: Movie) {
//        moviesToSeeCount += 1
        if !moviesToSeeArray.contains(movie) {
            moviesToSeeArray.append(movie)
        }
    }
    
    func movieAtIndex(index: Int) -> Movie {
//        return Movie(title: "Teen Comedy")
        return moviesToSeeArray[index]
    }
    
    func checkOffMovieAtIndex(index: Int) {
        guard index < moviesToSeeCount else { return }
        
//        moviesToSeeCount -= 1
//        moviesSeenCount += 1
        
        let checkedMovie = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(checkedMovie)
    }
    
    func checkedOffMovieAtIndex(index: Int) -> Movie {
        return moviesSeenArray[index]
    }
    
    func clearArrays() {
        moviesToSeeArray.removeAll()
        moviesSeenArray.removeAll()
    }
    
    
}
