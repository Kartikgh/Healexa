//
//  CategoryAndDoctorListViewModel.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 04/02/25.
//

import Foundation

class CategoryAndDoctorListViewModel: ObservableObject {
    @Published var simpleCards: [SimpleCard] = [
        SimpleCard(imageName: ImageAssetName.heartIcon, title: Constants.cardiologistTitle),
        SimpleCard(imageName: ImageAssetName.dentistIcon, title: Constants.dentist),
        SimpleCard(imageName: ImageAssetName.brainIcon, title: Constants.neurologist),
        SimpleCard(imageName: ImageAssetName.lungIcon, title: Constants.pulmonologist),
        SimpleCard(imageName: ImageAssetName.eyeIcon, title: Constants.ophthalmologist),
        SimpleCard(imageName: ImageAssetName.earIcon, title: Constants.otolaryngologist),
        SimpleCard(imageName: ImageAssetName.heartIcon, title: Constants.cardiologistTitle),
        SimpleCard(imageName: ImageAssetName.dentistIcon, title: Constants.dentist),
        SimpleCard(imageName: ImageAssetName.brainIcon, title: Constants.neurologist),
        SimpleCard(imageName: ImageAssetName.lungIcon, title: Constants.pulmonologist),
        SimpleCard(imageName: ImageAssetName.eyeIcon, title: Constants.ophthalmologist),
        SimpleCard(imageName: ImageAssetName.earIcon, title: Constants.otolaryngologist),
        SimpleCard(imageName: ImageAssetName.heartIcon, title: Constants.cardiologistTitle),
        SimpleCard(imageName: ImageAssetName.dentistIcon, title: Constants.dentist),
        SimpleCard(imageName: ImageAssetName.brainIcon, title: Constants.neurologist),
        SimpleCard(imageName: ImageAssetName.lungIcon, title: Constants.pulmonologist),
        SimpleCard(imageName: ImageAssetName.eyeIcon, title: Constants.ophthalmologist),
        SimpleCard(imageName: ImageAssetName.earIcon, title: Constants.otolaryngologist)
    ]
    
    @Published var multiCards: [MultiCard] = [
        MultiCard(imageName: ImageAssetName.doctor1, title: Constants.doctorName1, specialist: Constants.cardiologistTitle, rating: Constants.rating4Point6),
        MultiCard(imageName: ImageAssetName.doctor2, title: Constants.doctorName2, specialist: Constants.dentist, rating: Constants.rating4Point9),
        MultiCard(imageName: ImageAssetName.doctor3, title: Constants.doctorName3, specialist: Constants.neurologist, rating: Constants.rating4Point8),
        MultiCard(imageName: ImageAssetName.doctor1, title: Constants.doctorName1, specialist: Constants.cardiologistTitle, rating: Constants.rating4Point8),
        MultiCard(imageName: ImageAssetName.doctor2, title: Constants.doctorName2, specialist: Constants.dentist, rating: Constants.rating4Point9),
        MultiCard(imageName: ImageAssetName.doctor3, title: Constants.doctorName3, specialist: Constants.neurologist, rating: Constants.rating4Point6),
        MultiCard(imageName: ImageAssetName.doctor1, title: Constants.doctorName1, specialist: Constants.cardiologistTitle, rating: Constants.rating4Point6),
        MultiCard(imageName: ImageAssetName.doctor2, title: Constants.doctorName2, specialist: Constants.dentist, rating: Constants.rating4Point9),
        MultiCard(imageName: ImageAssetName.doctor3, title: Constants.doctorName3, specialist: Constants.neurologist, rating: Constants.rating4Point8),
        MultiCard(imageName: ImageAssetName.doctor1, title: Constants.doctorName1, specialist: Constants.cardiologistTitle, rating: Constants.rating4Point8),
        MultiCard(imageName: ImageAssetName.doctor2, title: Constants.doctorName2, specialist: Constants.dentist, rating: Constants.rating4Point9),
        MultiCard(imageName: ImageAssetName.doctor3, title: Constants.doctorName3, specialist: Constants.neurologist, rating: Constants.rating4Point6)
    ]
}
