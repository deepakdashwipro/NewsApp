//
//  ViewController.swift
//  News
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import UIKit

class NewsListViewController: UIViewController {
	
	@IBOutlet var listTableview:UITableView!
	var viewmodel = NewsListViewModel(_service: MostPopularService())
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
        self.title = "The New York Times"        
        self.addObservers()
		self.setup()
	}
	
	/// Method for adding observer on response and etc
	func addObservers()  {
		viewmodel.feedList.bind { [weak self] _ in
			DispatchQueue.main.async {
				self?.listTableview.reloadData()
			}
		}
		
		viewmodel.errorMessage.bind {  (message) in
			print(message)
		}
	}
	
	func setup() {
		viewmodel.fetchMostPopularFeed(feedays: .thirtyday)
	}
	
	
	/// function to navigate to Detail screen
	/// - Parameter feed: news model of popular api
	func moveDetail(feed:Feed)  {
		guard let detailcont = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
		detailcont.detailViewModel = DetailViewModel(_feed: feed)
		self.navigationController?.pushViewController(detailcont, animated: true)
	}
}

// MARK:- Delegate and datasorce secion

extension NewsListViewController : UITableViewDelegate , UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewmodel.feedList.value.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard  let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell else {
			fatalError("please check NewsTableViewCell registaration")
		}
		cell.news = viewmodel.feedList.value[indexPath.row]
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		 let feed = viewmodel.feedList.value[indexPath.row]
		 self.moveDetail(feed: feed)
	}
}
