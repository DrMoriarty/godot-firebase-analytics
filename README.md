# Firebase Analytics plugin for godot engine

Use [NativeLib Addon](https://github.com/DrMoriarty/nativelib) or [NativeLib-CLI](https://github.com/DrMoriarty/nativelib-cli) for installation.

Now it only supports Android. iOS support will be coming soon.
Don't forget to enable Android platform in NativeLib before install this plugin.

## For Android
You should put `google-services.json` into `android/build` folder.
The `google-services.json` you could download from your firebase console where you manage platforms of your project.


# API

## screen(name: String, screen_class: String)

Inform that user open this screen.

## setUserId(id: String)

Set custom user id

## logEvent(event: String, params: Dictionary = {})

Log specific event in you application. Params is optional.

## userProperties(props: Dictionary)

Set user properties. Firebase will store the last value for every property.

## start_checkout(item_id: String, item_name: String, item_category: String, price: float, currency: String = 'USD')

Inform that user starts purchasing in your app.

## revenue(price: float, quantity: int, product: String, currency: String = 'USD', signature: String = '', receipt: String = '')

Inform that user finished purchasing. Optionally you could provide signature and receipt for purchase verification.
