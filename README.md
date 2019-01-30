# Swift - Objective-C Bridge

![Swift5](https://img.shields.io/badge/swift-5-blue.svg)
![macOS](https://img.shields.io/badge/os-macOS-green.svg?style=flat)

Part of this blog post:
[@dynamicCallable Part 2: Swift/ObjC Bridge](http://www.alwaysrightinstitute.com/swift-objc-bridge/).

In December we demonstrated how to use the new Swift 5
[Dynamic Callable](https://github.com/apple/swift-evolution/blob/master/proposals/0216-dynamic-callable.md)
feature to 
[run Unix commands as Swift functions](http://www.alwaysrightinstitute.com/swift-dynamic-callable/),
like `shell.ls()`.
Today we implement our very own Swift / Objective-C bridge using the same!

Of course Swift already has Objective-C integrated on the Apple platforms,
directly supported by the compiler, as well as the associated
bridging runtime.
<br>
Yet using 
[Dynamic Callable](https://github.com/apple/swift-evolution/blob/master/proposals/0216-dynamic-callable.md)
you can actually build something similar at the library level,
and we want to show you how that would look like.

> Swift also runs on Linux, but it doesn't come with the
> Objective-C runtime and bridging features.
> Using the approach shown here with either
> [libFoundation](https://github.com/AlwaysRightInstitute/libFoundation)
> or
> [GNUstep](http://gnustep.org)
> you could also combine Swift and Objective-C on Linux.

This is what we want to end up with:
```swift
let ma = ObjC.NSMutableArray()
ma.addObject("Hello")
  .addObject("World")
print("Array:", ma.description())
```

**For demonstration purposes only**: 
This is just a demo showing what you can do with 
[@dynamicCallable](https://github.com/apple/swift-evolution/blob/master/proposals/0216-dynamic-callable.md),
nothing more!
(*we also cheat a few times and silently rely on builtin bridging.*)


## Install a Swift 5 Snapshot

For this to work, you need to have Swift 5 installed.
As of today Swift 5 hasn't been released yet, but Apple is providing
prebuilt Swift 5 development toolchains over at:
[swift.org](https://swift.org/download/#swift-50-development),
and you can also use the 
[Xcode 10.2beta](https://developer.apple.com/download/).
Just install the toolchain, and select it in the Xcode "Toolchains" menu.

If you are living on the commandline, make sure to call 
`export TOOLCHAINS=swift` to get access to the selected version.

To try out the samples below, you can either open a Swift 5 Playground or create
a command line tool project project in Xcode.

## Links

- [SE-0195 Dynamic Member Lookup](https://github.com/apple/swift-evolution/blob/master/proposals/0195-dynamic-member-lookup.md)
- [SE-0216 Dynamic Callable](https://github.com/apple/swift-evolution/blob/master/proposals/0216-dynamic-callable.md)


## Who

Brought to you by
[ZeeZide](http://zeezide.de).
We like
[feedback](https://twitter.com/ar_institute),
GitHub stars,
cool [contract work](http://zeezide.com/en/services/services.html),
presumably any form of praise you can think of.
