package inc.guide.g_orientation_lock

import android.content.pm.ActivityInfo
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


enum class OrientationMode(val rawValue: String) {
    PORTRAIT("portrait"),
    PORTRAIT_UPSIDE_DOWN("portraitUpsideDown"),
    ALL_BUT_UPSIDE_DOWN("allButUpsideDown")
}


class GOrientationLockPlugin : FlutterPlugin, ActivityAware, MethodCallHandler {
    private var activityBinding: ActivityPluginBinding? = null
    private val methodChangeOrientation = "change_screen_orientation"

    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "g_orientation_lock")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == methodChangeOrientation) {
            val orientation = call.arguments as String
            changeOrientation(orientation)
            result.success(orientation)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activityBinding = binding
    }

    override fun onDetachedFromActivity() {
        activityBinding = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    private fun changeOrientation(orientation: String) {
        val requestedOrientation = when (orientation) {
            OrientationMode.PORTRAIT.rawValue -> ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
            OrientationMode.PORTRAIT_UPSIDE_DOWN.rawValue -> ActivityInfo.SCREEN_ORIENTATION_REVERSE_PORTRAIT
            OrientationMode.ALL_BUT_UPSIDE_DOWN.rawValue -> ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED
            else -> ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED
        }
        this.activityBinding?.also {
            it.activity.requestedOrientation = requestedOrientation
        }
    }
}
