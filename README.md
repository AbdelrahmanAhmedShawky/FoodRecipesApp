# FoodRecipesApp

## Swift-MVVM-C
iOS application in Swift presenting usage of MVVM-C pattern.

## Application Features
First screen: List of recipes
- The list of recipes loaded from the recipes api.

Second screen: Details page of a recipe
- A recipe can be favorited or unfavorited.

Third screen: Log in
- A user should be able to enter a valid email and password to proceed.

## Implementation features
- Reactive Programming using `RXSwift`
- Dendency Injection using `Swinject`
- Session management
- Translations fetched from backend
- UI controls with settable translations on Storyboard
- Api endpoints defined in OOP manner by subclassing `BaseApiRequest<T>`
- Logging

## Architecture
This project is POC for MVVM-C pattern where:
- View is represented by `UIViewController` designed in Storyboard
- Model represents state and domain objects
- ViewModel interacts with Model and prepares data to be displayed. View uses ViewModel's data either directly or through bindings (using RxSwift) to configure itself. View also notifies ViewModel about user actions like button tap.
- Coordinator is responsible for handling application flow, decides when and where to go based on events from ViewModel (using RxSwift bindings).

`View` <- `ViewController` <- bindings -> (`ViewModel` -> `Model`) <- bindings -> `Coordinator`


## Compilation
Project uses [CocoaPods](https://cocoapods.org) for dependencies, so install it first and then run:

    pod install
    
# License
Distributed under the MIT License. Copyright (c) 2021 Abdelrahman Ahmed Shawky

