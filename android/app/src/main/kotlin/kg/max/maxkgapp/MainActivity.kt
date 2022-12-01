package kg.max.maxkgapp

import com.yandex.mapkit.MapKitFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.SplashScreen
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {



    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setLocale("YOUR_LOCALE")
        MapKitFactory.setApiKey("99bb7987-93c2-4a6d-bb10-7e61e1ea41b0")
        super.configureFlutterEngine(flutterEngine)
    }
}
