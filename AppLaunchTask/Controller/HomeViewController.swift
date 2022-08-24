//
//  HomeViewController.swift
//  AppLaunchTask
//
//  Created by Ganga Durgarao Kothapalli on 24/08/22.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var restaurants = RestaurantsData()
    var isSearch:Bool = false
    let headerId = "headerId"
     let categoryHeaderId = "categoryHeaderId"
    var searchData = [Restaurant]()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
        locationManager.delegate = self
        locationManager.startUpdatingLocation()

        }

        searchBar.delegate = self
        searchBar.showsCancelButton = true
        setupCollectionView()
        
    }
    //MARK: Register CollectionView Cells
    func setupCollectionView() {

        self.collectionView.register(Header.self, forSupplementaryViewOfKind: categoryHeaderId, withReuseIdentifier: headerId)
        self.collectionView.register(UINib(nibName: "SectionFiveCell", bundle: nil), forCellWithReuseIdentifier: "SectionFiveCell")
        self.collectionView.register(UINib(nibName: "SectionOneCell", bundle: nil), forCellWithReuseIdentifier: "SectionOneCell")
        self.collectionView.register(UINib(nibName: "SectionTwoCell", bundle: nil), forCellWithReuseIdentifier: "SectionTwoCell")
        self.collectionView.register(UINib(nibName: "SectionThreeCell", bundle: nil), forCellWithReuseIdentifier: "SectionThreeCell")
        self.collectionView.register(UINib(nibName: "SectionSixCell", bundle: nil), forCellWithReuseIdentifier: "SectionSixCell")
        self.collectionView.register(UINib(nibName: "SearchCell", bundle: nil), forCellWithReuseIdentifier: "SearchCell")
        
        self.collectionView.collectionViewLayout = createLayout()
        
        
    }
    
    //MARK: Create Compositional Layout
     func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, ent) -> NSCollectionLayoutSection? in
            
            if self.isSearch{
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 2
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .none
                
                return section
            }else{
                if sectionNumber == 0 {

                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .estimated(66), heightDimension: .absolute(72)))
                    item.contentInsets = .init(top: 8.0, leading: 8.0, bottom: 16.0, trailing: 8.0)
                   

                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(66), heightDimension: .absolute(50)), subitems: [item])

                    let section = NSCollectionLayoutSection(group: group)
                   

                    section.orthogonalScrollingBehavior = .continuous

                    return section


                }else if sectionNumber == 1{
                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                    item.contentInsets.trailing = 2
                    
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80)), subitems: [item])
                    
                    let section = NSCollectionLayoutSection(group: group)
                    
                    section.orthogonalScrollingBehavior = .paging
                    
                    return section
                }else if sectionNumber == 2{
                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(150)))
                    item.contentInsets.trailing = 8
                    item.contentInsets.bottom = 16
                    
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                    
                    let section = NSCollectionLayoutSection(group: group)
                    section.contentInsets.leading = 8
                    section.orthogonalScrollingBehavior = .continuous
                    
                    
                    
                    return section
                    
                }else if sectionNumber == 3{
                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150)))
                    item.contentInsets.trailing = 8
                    item.contentInsets.bottom = 16
                    
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                    
                    let section = NSCollectionLayoutSection(group: group)
                    section.contentInsets.leading = 8
                    
                    section.boundarySupplementaryItems = [
                        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),
                              elementKind: self.categoryHeaderId,
                              alignment: .topLeading)
                    ]
                    
                    return section
                   
                }else{
                    
                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(360)))
                    //item.contentInsets.trailing = 12
                    item.contentInsets = .init(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
                    
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                    

                    let section = NSCollectionLayoutSection(group: group)
                    
                    section.orthogonalScrollingBehavior = .none
                    return section
                }
                
                
            }
           
           
        }
    }

}

//MARK: Collection Delegate and datasource methods


extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if isSearch{
            return 1
        }else{
           return 5
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isSearch{
            return searchData.count
        }else{
            if section == 0{
                
                return restaurants.sectionOne.count
            }else if section == 1{
                return 1
            }else if section == 2{
                return 4
            }else if section == 3{
                return restaurants.dishName.count
            }else {
                return restaurants.data.count
            }
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isSearch{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell
            cell.img.image = searchData[indexPath.row].image
            cell.nameLbl.text = searchData[indexPath.row].name
            cell.categoryLbl.text = searchData[indexPath.row].category
            
            return cell
        }else{
            if indexPath.section == 0{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionOneCell", for: indexPath) as! SectionOneCell
                cell.title.text = restaurants.sectionOne[indexPath.row]
                
                return cell
            }else if indexPath.section == 1{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionTwoCell", for: indexPath) as! SectionTwoCell
                
                return cell
                
            }else if indexPath.section == 2{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionThreeCell", for: indexPath) as! SectionThreeCell
                
                return cell
                
            }else if indexPath.section == 3{
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionFiveCell", for: indexPath) as! SectionFiveCell
                
                cell.dishName.text = restaurants.dishName[indexPath.row]
                cell.dishImg.image = UIImage(named: restaurants.dishImages[indexPath.row])
                
                return cell
                
            }
            
            else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionSixCell", for: indexPath) as! SectionSixCell
                
                cell.resImg.image = restaurants.data[indexPath.row].image
                cell.resNameLbl.text = restaurants.data[indexPath.row].name
                cell.categoryLbl.text = restaurants.data[indexPath.row].category
                cell.offerLbl.text = restaurants.data[indexPath.row].offer
                cell.price.text = restaurants.data[indexPath.row].price
                cell.ratingLbl.text = restaurants.data[indexPath.row].rating
                cell.timeLbl.text = restaurants.data[indexPath.row].time
                
                return cell
            }
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as? Header
        
            return header!
        
        
        
    }

}
//MARK:- CoreLocation Delegate
extension HomeViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            locationManager.stopUpdatingLocation()
            let location = CLLocation(latitude: location.coordinate.latitude , longitude: location.coordinate.longitude )
            location.placemark { placemark, error in
                guard let placemark = placemark else {
                    print("Error:", error ?? "nil")
                    return
                }
                self.locationName.text = (placemark.subLocality ?? "") + ", " + (placemark.locality ?? "") + ", " + (placemark.administrativeArea ?? "")
                

            }
        }
        print("Got your location")
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
//MARK: Reverse GeoCoding
extension CLLocation {
    func placemark(completion: @escaping (_ placemark: CLPlacemark?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first, $1) }
    }
}

//MARK: SearchBar delegate
extension HomeViewController:UISearchBarDelegate{
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        isSearch = false
        self.collectionView.reloadData()
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0{
            isSearch = false
            self.collectionView.reloadData()
        }else{
            isSearch = true
            searchData = restaurants.data.filter{ $0.name.localizedCaseInsensitiveContains(searchText) }
            
            self.collectionView.reloadData()
        }
        
        
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        print(searchText)
        searchData = restaurants.data.filter{ $0.name.localizedCaseInsensitiveContains(searchText) }
        
        self.collectionView.reloadData()
        
    }

}

