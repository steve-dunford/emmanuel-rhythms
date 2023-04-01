package com.emmanuel.rhythms.emmanuel_rhythms_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import com.google.android.gms.common.GoogleApiAvailability
import com.google.android.gms.common.ConnectionResult

class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        if(GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(this) != ConnectionResult.SUCCESS) {
            GoogleApiAvailability.getInstance().makeGooglePlayServicesAvailable(this)
        }
    }

    override fun onResume() {
        if(GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(this) != ConnectionResult.SUCCESS) {
            GoogleApiAvailability.getInstance().makeGooglePlayServicesAvailable(this)
        }
    }

}
