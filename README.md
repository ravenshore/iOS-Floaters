# ios Floaters 

Easily add animated icons/emoji/images, similar to the Periscope floating hearts effect.

![](floaties1.gif)
![](floaties2.gif)
![](floaties3.gif)
![](Floaters1.png)
![](Floaters2.png)

## Usage

Usage is as easy as:

```
@IBOutlet weak var floaterView: Floater!

@IBAction func startTapped(sender: AnyObject) {
floaterView.startAnimation()
}

@IBAction func endTapped(sender: AnyObject) {
floaterView.stopAnimation()
}
```

Take a look at the project to see a full example.

## Requirements

* iOS 8 or later
* Xcode 6 or later

## Author
Razvigor Andreev - helpMeCodeSwift @ Twitter
http://helpMeCodeSwift.com

## License

ProcessButton is available under the MIT license. See the [LICENSE](https://github.com/ravenshore/floaters/blob/master/LICENSE) file for more info.