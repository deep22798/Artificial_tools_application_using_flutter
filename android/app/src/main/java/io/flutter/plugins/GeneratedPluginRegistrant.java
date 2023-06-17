package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.camera.CameraPlugin;
import io.github.edufolly.fluttermobilevision.FlutterMobileVisionPlugin;
import io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin;
import com.google_ml_kit.GoogleMlKitPlugin;
import vn.hunghd.flutter.plugins.imagecropper.ImageCropperPlugin;
import io.flutter.plugins.imagepicker.ImagePickerPlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;
import sq.flutter.tflite.TflitePlugin;
import io.flutter.plugins.urllauncher.UrlLauncherPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    CameraPlugin.registerWith(registry.registrarFor("io.flutter.plugins.camera.CameraPlugin"));
    FlutterMobileVisionPlugin.registerWith(registry.registrarFor("io.github.edufolly.fluttermobilevision.FlutterMobileVisionPlugin"));
    FlutterAndroidLifecyclePlugin.registerWith(registry.registrarFor("io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin"));
    GoogleMlKitPlugin.registerWith(registry.registrarFor("com.google_ml_kit.GoogleMlKitPlugin"));
    ImageCropperPlugin.registerWith(registry.registrarFor("vn.hunghd.flutter.plugins.imagecropper.ImageCropperPlugin"));
    ImagePickerPlugin.registerWith(registry.registrarFor("io.flutter.plugins.imagepicker.ImagePickerPlugin"));
    SharedPreferencesPlugin.registerWith(registry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
    TflitePlugin.registerWith(registry.registrarFor("sq.flutter.tflite.TflitePlugin"));
    UrlLauncherPlugin.registerWith(registry.registrarFor("io.flutter.plugins.urllauncher.UrlLauncherPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
