//
//  ViewController.swift
//  ViperSampleApp
//
//  Created by Nidhi Gupta on 12/06/21.
//

import UIKit
import Kingfisher

class ViewController: UIViewController  {
    
    // MARK: - Properties
    var presenter: ImageListViewToPresenterProtocol?
//    var shapeArrayList: Array<LiveNewsModel> = Array()

    var feedArticles: [LiveNewsModel] = Array()
    var articlesTitle: [String]?
    
    lazy var feedCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    


    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemPurple
        self.title = News.NEWS_TITLE
       // setupUI()
        setUpScreen()
//        cardSetUp()
       presenter?.startFetchingShapes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension ViewController: ImageListPresenterToViewProtocol{
    
    func fetchSuccess(shapeArrayList:Array<LiveNewsModel>){
        let feed = shapeArrayList[0]
        print(feed.urlToImage as Any)
        print(feed.title ?? "")
        
        self.feedArticles = shapeArrayList
        self.articlesTitle = shapeArrayList.compactMap { $0.title }

        self.feedCollectionView.reloadData()
    }
    
    func fetchError(){
        
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedArticles.count
//        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as! FeedCell
        cell.backgroundColor = UIColor.blue
        
        let feed = feedArticles[indexPath.row]
        if let urlString = feed.urlToImage{
            let url = URL(string: urlString)
            cell.imageView.kf.setImage(with:url)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let feed = feedArticles[indexPath.row]
        if let author = feed.author{
            presenter?.showImageDetail(author: author)
        }
        print("User tapped on item \(indexPath.row)")
    }
}

// MARK: - UI Setup
extension ViewController {
    
    func setUpScreen(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        feedCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        feedCollectionView.register(FeedCell.self, forCellWithReuseIdentifier: "FeedCell")
//        feedCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "FeedCell")
        feedCollectionView.backgroundColor = UIColor.white
        self.view.addSubview(feedCollectionView)
        
        view.addConstraints([
            feedCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            feedCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            feedCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            feedCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        feedCollectionView.reloadData()
    }

    /*
    func cardSetUp(){
        let cardView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .gray
            view.layer.cornerRadius = 8
            return view
        }()
                
        let imageView: UIImageView = {
            let image = UIImageView(image: .checkmark)
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 17)
            label.text = "Title to set here. Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            label.textColor = .black
            label.backgroundColor = .yellow
            label.numberOfLines = 0
            return label
        }()
        
        let descriptionLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 17)
            label.text = "Description: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
            label.textColor = .black
            label.backgroundColor = .yellow
            label.numberOfLines = 0
            return label
        }()
        
        view.addSubview(cardView)
        view.addConstraints([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        cardView.addSubview(imageView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(descriptionLabel)

        cardView.addConstraints([
            imageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 80),
        ])
        
        cardView.addConstraints([
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: imageView.bottomAnchor)
        ])
        
        cardView.addConstraints([
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8)
        ])

        let url = URL(string: "https://techcrunch.com/wp-content/uploads/2021/05/GettyImages-888792680.jpg?w=659")
        imageView.kf.setImage(with: url)

    }

    func setupUI() {
        let namelabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.text = "Hello World Hello World Hello"
            label.textColor = .black
            label.backgroundColor = .red
            return label
        }()
               
        let secondLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.text = "Apple Macbook Pro Retina 2013"
            label.textColor = .black
            label.backgroundColor = .yellow
            return label
        }()
        
        view.addSubview(namelabel)
        view.addSubview(secondLabel)
        view.addConstraints([
            namelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            namelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)

        ])
//        namelabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for:.horizontal)

        view.addConstraints([
            secondLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            secondLabel.leadingAnchor.constraint(equalTo: namelabel.trailingAnchor, constant: 16),
            secondLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
//        secondLabel.setContentHuggingPriority(UILayoutPriority.defaultLow, for:.horizontal)

        namelabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
        secondLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)

        

    }
    */
    
}
