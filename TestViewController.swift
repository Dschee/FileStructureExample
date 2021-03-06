//
//  TestViewController.swift
//  File Structure & Use Of MARK
//
//  Created by Frederick Pietschmann on 30.01.18.
//  Copyright © 2018 Frederick Pietschmann. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    // MARK: - Subtypes
    typealias CompletionHandler = ((TestEnum) -> Void)

    class TestClass {
        // 10 lines
    }

    struct TestStruct {
        // 3 lines
    }

    enum TestEnum {
        // 5 lines
    }

    // MARK: - Properties
    var shouldLayoutView1: Bool!
    private var hasLayoutedView1 = false
    private var hasLayoutedView2 = false

    @IBOutlet private var view1: UIView!
    @IBOutlet private var view2: UIView!

    // MARK: - Initializers
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods: Life-Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view1.setNeedsLayout()
        view1.layoutIfNeeded()
        hasLayoutedView1 = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        view2.setNeedsLayout()
        view2.layoutIfNeeded()
        hasLayoutedView2 = true
    }

    // MARK: Transitions
    func goToNextVc() { }

    func goToInfoVc() { }

    func goToRandomVc() {
        let vc = getRandomVc()
        present(vc, animated: true)
    }

    // MARK: Actions
    @IBAction func goNextButtonPressed() {
        goToNextVc()
    }

    @objc
    func goToRandomVcButtonPressed() {
        goToRandomVc()
    }

    // MARK: Helpers
    private func getRandomVc() -> UIViewController { return UIViewController() }
    
    // MARK: - Subscripts
    subscript(_ someIndexThatIsNotEvenUsed: Int) -> String {
        get {
            return "This is just a test"
        }
        
        set {
            print("Just a test", newValue)
        }
    }
}

// MARK: - UITableViewDataSource
extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - SomeDesparetelyNeededSubtypeThatCannotBeOutsourced
extension TestViewController {
    class SomeDesparetelyNeededSubtypeThatCannotBeOutsourced {
        // 100 lines
    }
}
