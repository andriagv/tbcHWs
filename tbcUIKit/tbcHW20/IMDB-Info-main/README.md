# IMDB info


### Networking
- **MovieManager**  
  - Line 31 .resume() 
- **GenreManager**  
  - Line 19 

### Model
- **MovieList**  
- **Movie**
- **GenreList**
    - Line11 
- **Genre** 
    - Line11 
### prezenter
- MovieCollectionView
    - Line 20
    - Line 57
- CollectionViewHeader
- MovieCollectionViewCell
- FeaturedCell
    - Line 23
    - Line 29
    - Line 48
    - Line 60
- NowInTheaters
    - Line 21
    - Line 28
    - Line 52 - 58

## Project Structure


```
IMDB-Info-main/ 
  ├── IMDB Info/
  │   ├── AppDelegate.swift
  │   ├── Info.plist
  │   ├── SceneDelegate.swift
  │   ├── Networking/
  │   │   ├── MovieManager.swift
  │   │   └── GenreManager.swift
  │   ├── Presenter/
  │   │   ├── MovieCollectionView/
  │   │   │   ├── MovieCollectionView.swift
  │   │   │   └── MovieCollectionView.xib
  │   │   ├── Search/
  │   │   │   ├── SearchViewController.swift
  │   │   │   └── SearchViewController.storyboard
  │   │   ├── NowInTheaters/
  │   │   │   ├── NowInTheaters.storyboard
  │   │   │   └── NowInTheaters.swift
  │   │   ├── CollectionViewHeader/
  │   │   │   ├── CollectionViewHeader.swift
  │   │   │   └── CollectionViewHeader.xib
  │   │   ├── DetailsView/
  │   │   │   ├── DetailsView.swift
  │   │   │   └── DetailsView.storyboard
  │   │   ├── FeaturedCell/
  │   │   │   ├── FeaturedCell.swift
  │   │   │   └── FeaturedCell.xib
  │   │   ├── MovieCollectionViewCell/
  │   │   │   ├── MovieCollectionViewCell.swift
  │   │   │   └── MovieCollectionViewCell.xib
  │   │   ├── Main/
  │   │   │   └── Base.lproj/
  │   │   │       └── Main.storyboard
  │   │   └── MovieCell/
  │   │       ├── MovieCell.swift
  │   │       └── MovieCell.xib
  │   ├── Assets.xcassets/
  │   │   
  │   ├── Base.lproj/
  │   │   └── LaunchScreen.storyboard
  │   └── Model/
  │       ├── GenreList.swift
  │       ├── Movie.swift
  │       ├── Genre.swift
  │       └── MovieList.swift

```
