# TOM3DTouchGestureRecognizer
A simple library that makes 3D Touch easier to interact with via a normal UIGestureRecognizer

In fact, it's as easy as this:

```obj-c
TOM3DTouchGestureRecognizer *recognizer = [[TOM3DTouchGestureRecognizer alloc] initWithTarget:self action:@selector(touched3D:)];
recognizer.minimumForceRequired = 0.8;
[self.view addGestureRecognizer:recognizer];
```

The code is pretty well internally documented (available via Xcode's Quick Help), so this is as extensive as the example code gets. Honestly though, there's really not many more examples I could give - that's about all there is to it. 

<br>

## Contact 
Please report all bugs to the "Issues" page here on GitHub. 
If you've got a cool project that uses TOM3DTouchGestureRecognizer, have suggestions for improvements, or you just want to say hi, you can contact me here: <br>

Twitter: <br>
[@tomnific](https://www.twitter.com/tomnific "Tom's Twitter") <br>

Email: <br>
[tom@southernderd.us](tom@southernderd.us "Tom's Email") <br>

<br>

- - -
**Inspiration** <br>
This library was developed in its entirety by me, however some aspects were inspired by [PSForceTouchGestureRecognizer](https://github.com/nolanbrown/PSForceTouchGestureRecognizer).
