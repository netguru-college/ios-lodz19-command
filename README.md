# NetguruCollegeApp

Welcome to the **NetguruCollegeApp** project. It is a base application created for Netguru College: iOS Weekend Edition workshops.

## Team

* [Anna-Mariia Shkarlinska](mailto:anna-mariia.shkarlinska@netguru.com) - Project leader, Mentor
* [Marcin Siemaszko](mailto:marcin.siemaszko@netguru.com) - Mentor
* [Przemysław Cholewa](mailto:przemyslaw.cholewa@netguru.com) - Mentor
* [Michał Warchał](mailto:michal.warchal@netguru.com) - Mentor

## Tools 

- Xcode 10.2.1 with latest iOS SDK (12.1)
- [CocoaPods](https://github.com/CocoaPods/CocoaPods) 1.7.5 or higher

### Prerequisites

- [Bundler](http://bundler.io) (`gem install bundler`)
- [CocoaPods](https://cocoapods.org)

### Instalation

1. Clone repository:

	```bash
	# over https:
	git clone https://github.com/netguru/nc-ios.git
	# or over SSH:
	git@github.com:netguru/nc-ios.git
	```

2. Install required Gems:

	```bash
	bundle install
	```

3. Install pods through Bundler:

	```bash
	bundle exec pod install
	```

4. Open `NetguruCollegeApp.xcworkspace` file and build the project.


## Coding guidelines

- Respect Swift [API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- The code must be readable and self-explanatory - full variable names, meaningful methods, etc.
- Don't leave any commented-out code.
- Write documentation for every method and property accessible outside the class. For example well documented method looks as follows:

	```swift
	/// Tells the magician to perform a given trick.
	///
	/// - Parameter trick: The magic trick to perform.
	/// - Returns: Whether the magician succeeded in performing the magic trick.
	func perform(magicTrick trick: MagicTrick) -> Bool {
		// body
	}
	```
