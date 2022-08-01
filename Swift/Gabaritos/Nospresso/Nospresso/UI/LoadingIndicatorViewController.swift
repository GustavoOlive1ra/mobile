import UIKit
import SnapKit

class LoadingIndicatorViewController: UIViewController {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Paleta.cinzaSobreposicao()
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .white
        view.startAnimating()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configViews()
        buildViews()
        buildConstraints()
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func configViews() {
        view.backgroundColor = Paleta.pretoSobreposicao()
    }
    
    private func buildViews() {
        view.addSubview(containerView)
        containerView.addSubview(indicatorView)
    }
    
    private func buildConstraints() {
        containerView.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide.snp.center)
            make.height.width.equalTo(150)
        }
        
        indicatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(50)
        }
    }

}

protocol LoadingIndicatorViewType: AnyObject {
    var loadingIndicatorViewController: LoadingIndicatorViewController? { get set }
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showLoadingIndicator(completion: (() -> Void)?)
    func hideLoadingIndicator(completion: (() -> Void)?)
}

extension LoadingIndicatorViewType where Self: UIViewController {
    func showLoadingIndicator() {
        showLoadingIndicator(completion: nil)
    }
    
    func hideLoadingIndicator() {
        hideLoadingIndicator(completion: nil)
    }
    
    func showLoadingIndicator(completion: (() -> Void)?) {
        DispatchQueue.main.async {
            self.loadingIndicatorViewController = LoadingIndicatorViewController()
            self.present(self.loadingIndicatorViewController!, animated: true, completion: completion)
        }
    }
    
    func hideLoadingIndicator(completion: (() -> Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loadingIndicatorViewController?.dismiss(animated: true, completion: completion)
            self.loadingIndicatorViewController = nil
        }
    }
}
