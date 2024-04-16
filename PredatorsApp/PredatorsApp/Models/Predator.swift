//
//  Predator.swift
//  PredatorsApp
//
//  Created by Matvei Khlestov on 16.04.2024.
//

struct Predator {
    let name: String
    let description: String
    let photo: Photo
    
    static func getPredators() -> [Predator] {
        
        [
            Predator(
                name: "Simba",
                description: "Лев — вид хищных млекопитающих, один из пяти представителей рода пантер.",
                photo: Photo(
                    largePhoto: "Lion large",
                    smallPhotos: ["Lion small1", "Lion small2", "Lion small3"]
                )
            ),
            Predator(
                name: "Sherkhan",
                description: "Тигр — это млекопитающее рода больших кошек семейства кошачьих.",
                photo: Photo(
                    largePhoto: "Tiger large",
                    smallPhotos: ["Tiger small1", "Tiger small2", "Tiger small3"]
                )
            ),
            Predator(
                name: "Akella",
                description: "Волк — млекопитающее семейства волчьих (псовых).",
                photo: Photo(
                    largePhoto: "Wolf large",
                    smallPhotos: ["Wolf small1", "Wolf small2", "Wolf small3"]
                )
            )
        ]
    }
}

struct Photo {
    let largePhoto: String
    let smallPhotos: [String]
}


