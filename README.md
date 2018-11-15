# Simple Slider

Simple Image Slider

## How to Use

1. Add this dependency to your pubspec.yaml
```yaml

dependencies:
    simple_slider:
        git:
            url: https://github.com/kevinalexandersurjadi/simple_slider.git
            ref: 0.0.1

```
2. Import package
```dart

import 'package:simple_slider/simple_slider.dart';

```
3. Use
```dart

List<Images> images = [
    Image.network("https://i2.wp.com/www.rxwallpaper.site/wp-content/uploads/beautiful-scenery-backgrounds-wallpaper-hd-wallpapers-pinterest-800x800.jpg?resize=800%2C800&ssl=1"),
    Image.network("https://cdn.shopify.com/s/files/1/2317/9603/products/HD-Picture-Love-Elephant-Mother-and-Son-Beautiful-Scenery-Oil-Painting-Animal-Picture-Art-Printed-On_800x.jpg?v=1528290384"),
    Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRqYELakI_Gr2cB_dAUSs5g2s_yDLP-SLSay-rS4gvOtUzzOjL"),
];

Container(
    child: SimpleSlider(images);
);

```

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
