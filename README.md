# ios-swinject-storyboard-demo
DIコンテナを使って、画面遷移時にパラメタを渡す

## 実装手順
### 1. PodFile

```
pod 'Swinject', '2.0.0'
pod 'SwinjectStoryboard', '1.0.0'
```

### 2. import する
```
import Swinject
import SwinjectStoryboard
```

### 3. Containerのインスタンスを生成

```
    let container = Container()
```

### 4. AnimalViewControllerとCatオブジェクト(Animalプロトコル)を関連付ける

```
container.register(Animal.self) { _ in Cat(name: "Mer") }

container.storyboardInitCompleted(AnimalViewController.self) { r, c in
            c.animal = r.resolve(Animal.self)
        }
        
```        
    
### 5. Storyboardを呼び出す

```
        let sb = SwinjectStoryboard.create(name: "Main",
                                           bundle: nil,
                                           container: container)
        let vc = sb.instantiateViewController(withIdentifier: "AnimalViewController")
            as! AnimalViewController
        self.present(vc, animated: true, completion: nil)
```

## 用語
- Container 
<br>一般にDIコンテナと言われる。

- Service 
<br>何かしらに依存しているオブジェクトの型

## 参考
- https://github.com/Swinject/Swinject/blob/master/README.md
- [[Swift] Swinjectを使ったDependency Injection](http://dev.classmethod.jp/smartphone/swinject-dependency-injection/)
- https://news.realm.io/jp/news/tryswift-veronica-ray-real-world-mocking-swift/
- [The Difference Between Mocks and Stubs](https://www.martinfowler.com/articles/mocksArentStubs.html#TheDifferenceBetweenMocksAndStubs)