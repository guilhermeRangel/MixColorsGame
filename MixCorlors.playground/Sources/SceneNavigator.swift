import SpriteKit

// MARK: - SceneNavigating

/// Describes the navigation operations available between game scenes.
public protocol SceneNavigating: AnyObject {
    func navigateToPlay(from scene: SKScene)
    func navigateToCredits(from scene: SKScene)
    func navigateToLogin(from scene: SKScene)
}

// MARK: - SceneNavigator

/// Default `SceneNavigating` implementation backed by SpriteKit's `presentScene(_:transition:)`.
public final class SceneNavigator: SceneNavigating {

    public static let shared = SceneNavigator()

    private init() {}

    // MARK: SceneNavigating

    public func navigateToPlay(from scene: SKScene) {
        guard let destination = GameScenePlay(fileNamed: "GameScene") else { return }
        present(destination, from: scene)
    }

    public func navigateToCredits(from scene: SKScene) {
        guard let destination = GameSceneCredits(fileNamed: "GameScene") else { return }
        present(destination, from: scene)
    }

    public func navigateToLogin(from scene: SKScene) {
        guard let destination = LoginScene(fileNamed: "GameScene") else { return }
        present(destination, from: scene)
    }

    // MARK: Private helpers

    private func present(_ destination: SKScene, from source: SKScene) {
        guard let view = source.view else { return }
        destination.scaleMode = .aspectFit
        destination.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let transition = SKTransition.fade(withDuration: 0.4)
        view.presentScene(destination, transition: transition)
    }
}
