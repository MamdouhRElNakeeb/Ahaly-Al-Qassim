package com.khaled.hegg.activity;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import com.khaled.hegg.R;

import butterknife.ButterKnife;

public class AmaknTagmoActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_amakn_tagmo);
        ButterKnife.bind(this);
    }


}
