package ru.mobilap.firebaseanalytics;

import android.app.Activity;
import android.util.Log;
import android.view.View;
import android.os.Bundle;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import org.godotengine.godot.Godot;
import org.godotengine.godot.plugin.GodotPlugin;
import org.godotengine.godot.plugin.SignalInfo;
import org.godotengine.godot.Dictionary;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;

//import com.google.firebase.analytics.FirebaseAnalytics;

public class FirebaseAnalytics extends GodotPlugin {

    private final String TAG = FirebaseAnalytics.class.getName();
    //final private SignalInfo loadedSignal = new SignalInfo("loaded");
    private Godot activity = null;
    private boolean _loaded = false;
    private com.google.firebase.analytics.FirebaseAnalytics fa;

    public FirebaseAnalytics(Godot godot) {
        super(godot);
        activity = godot;
        init();
    }

    @Override
    public String getPluginName() {
        return "FirebaseAnalytics";
    }

    @Override
    public List<String> getPluginMethods() {
        return Arrays.asList("logEvent", "setUserId", "setUserProperty");
    }

    /*
    @Override
    public Set<SignalInfo> getPluginSignals() {
        return Collections.singleton(loadedSignal);
    }
    */

    @Override
    public View onMainCreate(Activity activity) {
        return null;
    }

    private void init() {
        fa = com.google.firebase.analytics.FirebaseAnalytics.getInstance(activity);
    }
    
    public void logEvent(final String event, final Dictionary params) {
        if(params == null)
            fa.logEvent(event, null);
        else {
            Bundle bundle = new Bundle();
            for(String key: params.get_keys()) {
                bundle.putString(key, params.get(key).toString());
            }
            fa.logEvent(event, bundle);
        }
    }

    public void setUserId(final String uid) {
        fa.setUserId(uid);
    }

    public void setUserProperty(final String name, final String value) {
        fa.setUserProperty(name, value);
    }
}
