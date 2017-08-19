package com.khaled.hegg;


import android.app.Application;

import com.androidnetworking.AndroidNetworking;

/**
 * Created by khaled on 16/08/17.
 */

public class Hegg extends Application {

    @Override
    public void onCreate() {
        super.onCreate();

        AndroidNetworking.initialize(getApplicationContext());
    }
}
