package kg.max.maxkgapp

import android.graphics.drawable.Drawable

import io.flutter.embedding.android.DrawableSplashScreen
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.SplashScreen

class MainActivity: FlutterActivity() {
    override fun provideSplashScreen(): SplashScreen? {
        return AppSplashScreen()
    }
}
