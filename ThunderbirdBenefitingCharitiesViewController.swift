//
//  ThunderbirdBenefitingCharitiesViewController.swift
//  Test
//
//  Created by Chaz Helsing on 1/18/17.
//  Copyright © 2017 Helsing Productions. All rights reserved.
//

import Foundation
import UIKit

class ThunderbirdBenefitingCharitiesViewController : UIViewController {
    
    let thunderbirdCharityImage = UIImage(named: "thunderbirdCharityGift")
    
    let golfBall = UIImage(named: "tbirdGolfBall1")
    
    let benefitingCharities = "A New Leaf\nA Stepping Stone Foundation\nAbout Care\nACCEL\nAccep\nThe Challenge\nAid to Adoption of Special Kids\nAlzheimer’s Association Desert Southwest Chapter\nAmerican Cancer Society, Great West Division\nArizona Bridge To Independent Living\nArizona Burn Foundation\nArizona Center For The Blind And Visually Impaired\nArizona Council On Economic Education\nArizona Friends Of Foster Children Foundation\nArizona Helping Hands\nArizona Literacy And Learning Center (ALLC)\nArizona Recreation Center For The Handicapped ARCH\nArizona Science Center\nArizona Women’s Education & Employment AWEE\nArizonans For Children\nArizona’s Children Association\nAssistance League of East Valley Arizona\nAssistance League of Phoenix\nAudubon Arizona\nBack-To-School Clothing Drive\nBanner Health Foundation\nBarrow Neurological Foundation\nBe A Leader Foundation (BALF)\nBenevilla\nBest Buddies Arizona\nBig Brothers Big Sisters of Central Arizona\nBoy Scouts Of America, Grand Canyon Council\nBoys & Girls Clubs of Metropolitan Phoenix\nBoys & Girls Clubs Of Scottsdale\nBoys & Girls Clubs of the East Valley\nBoys Hope Girls Hope Arizona\nCancer Support Community-Arizona\nCenters For Habilitation\nCentral Arizona Shelter Services\nChicanos Por La Causa\nChild & Family Resources\nChild Crisis Center\nChildhelp\nChildrens Museum Of Phoenix\nChildsplay\nChrist Child Society Of Phoenix\nChrysalis Shelter\nCircle the City\nCivitan Foundation\nCommunities In Schools of Arizona\nCortney’s Foundation\nCraniofacial Foundation Of Arizona\nCreciendo Unidos Growing Together\nCrisis Nursery\nCrossroads\nDesert Botanical Garden\nDesert Mission\nDesert Voices Oral Learning Center\nDetour Company Theater\nDoves\nDrug Free AZ\nDuet: Partners in Health & Aging\nEducare Arizona\nElevate Phoenix\nFamily Promise-Greater Phoenix\nFeeding Matters\nFirst Tee of Phoenix\nFlorence Crittenton\nFoundation for Blind Children\nFoundation For Senior Living\nFree Arts of Arizona\nFresh Start Women’s Foundation\nFriendly House\nFuture For Kids\nGabriel’s Angels\nGenesis City\nGirl Scout Council Arizona Cactus-Pine\nGompers Habilitation Center\nGreat Arizona Puppet Theater\nGreater Paradise Valley Community Assistance Team\nHandsOn Greater Phoenix\nHappily Ever After League\nHomeward Bound\nHope & A Future\nHopeKids\nHospice of the Valley\nHuman Services Campus\nICAN: Positive Programs for Youth\nIndependence Plus\nJobs For Arizonas Graduates JAG\nJunior Golf Association Of Arizona\nKitchen On The Street\nLeukemia & Lymphoma Society\nLeukemia Foundation of Arizona\nLions Vision Center Arizona\nLiteracy Volunteers Of Maricopa County\nLodestar Day Resource Center\nMaggies Place\nMake-A-Wish Foundation® of Arizona\nMarc Community Resources\nMaricopa Health Foundation\nMentorkids Usa\nMiracle League Of Arizona\nMission Of Mercy\nNational Advocacy & Training Network\nNational Council On Alcoholism Greater Phoenix Area\nNavigator Supporters\nNeighborhood Christian Clinic\nNeighborhood Ministries\nNeighbors Who Care\nNew Life Center\nNew Pathways for Youth\nnotMykid\nOne Small Step\nOne Step Beyond\nPartners For Paiute Neighborhood Center\nPhoenix Art Museum\nPhoenix Childrens Hospital\nPhoenix Rescue Mission\nPhoenix Symphony Association\nPhoenix Theatre\nPhoenix Zoo\nProstate On-Site Project\nRebuilding Together Valley Of The Sun\nRelease The Fear\nRonald McDonald House Charities of Phoenix\nRosie’s House A Music Academy For Children\nRyan House\nSalvation Army\nSave The Family Foundation Of Arizona\nSharing Down Syndrome Arizona\nShoebox Ministry\nSociety of St Vincent De Paul\nSojourner Center\nSouthwest Autism Research And Resource Center SARRC\nSouthwest Center For HIV/AIDS\nSouthwest Human Development\nSpecial Olympics of Arizona\nSt Mary’s Food Bank Alliance\nSt. Joseph the Worker\nStardust Non-Profit Building Supplies\nSummer Youth Program Fund SYPF\nTeach For America\nTeen Lifeline\nTreasures 4 Teachers\nTumbleweed Center For Youth Development\nUMOM New Day Centers\nUnited Cerebral Palsy Association of Central Arizona UCP\nUnited Food Bank\nUnited States Veterans Initiative\nUnlimited Potential\nUpward Foundation\nUSO Arizona\nValle Del Sol\nValley Youth Theatre\nVALLEYLIFE\nVisionquest 20 20\nWaste Not\nYMCA\nYoung Arts Arizona"
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var thunderbirdImageView: UIImageView!
    
    @IBOutlet weak var benefitingCharitiesTextView: UITextView!
    
    @IBAction func donateButton(_ sender: Any) {

        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "Donate")

        self.navigationController?.pushViewController(nextViewController, animated: true)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImageView.image = golfBall
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.layer.cornerRadius = 15
        logoImageView.layer.masksToBounds = true
        
        thunderbirdImageView.image = thunderbirdCharityImage
        thunderbirdImageView.translatesAutoresizingMaskIntoConstraints = false
        thunderbirdImageView.layer.cornerRadius = 15
        thunderbirdImageView.layer.masksToBounds = true
        
        benefitingCharitiesTextView.text = benefitingCharities
        benefitingCharitiesTextView.translatesAutoresizingMaskIntoConstraints = false
        benefitingCharitiesTextView.layer.cornerRadius = 15
        benefitingCharitiesTextView.layer.masksToBounds = true
        
    }
}
