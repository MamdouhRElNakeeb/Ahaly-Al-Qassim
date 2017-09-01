package com.khaled.hegg.activity;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.CardView;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.khaled.hegg.R;

import butterknife.BindView;
import butterknife.ButterKnife;

public class AboutUsActivity extends AppCompatActivity implements OnMapReadyCallback {
    private GoogleMap mMap;
    @BindView(R.id.background)
    ImageView iv_background;
    @BindView(R.id.cv_website)
    CardView cv_website;
    @BindView(R.id.tv_phone1)
    TextView tv_phone1;

    @BindView(R.id.tv_phone2)
    TextView tv_phone2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_about_us);
        ButterKnife.bind(this);

        iv_background.post(new Runnable() {
            @Override
            public void run() {
                Glide.with(iv_background.getContext())
                        .load(R.drawable.splash_bg)
                        .asBitmap()
                        .crossFade()
                        .centerCrop()
                        .override(iv_background.getWidth(), iv_background.getHeight())
                        .into(iv_background);
            }
        });

        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager()
                .findFragmentById(R.id.map);
        mapFragment.getMapAsync(this);

        openWebsite();
        String phone = getResources().getString(R.string.number);
        openPhoneCall(phone);

    }

    private void openPhoneCall(final String phone) {
        tv_phone1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (isPhonePermissionGranted()) {
                    Intent intent = new Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + getResources().getString(R.string.number)));
                    if (ActivityCompat.checkSelfPermission(AboutUsActivity.this, Manifest.permission.CALL_PHONE) == PackageManager.PERMISSION_GRANTED) {
                        // TODO: Consider calling

                        //    ActivityCompat#requestPermissions
                        // here to request the missing permissions, and then overriding
                        //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
                        //                                          int[] grantResults)
                        // to handle the case where the user grants the permission. See the documentation
                        // for ActivityCompat#requestPermissions for more details.
                        startActivity(intent);
                    }
                    else
                        ActivityCompat.requestPermissions(AboutUsActivity.this, new String[]{Manifest.permission.CALL_PHONE}, 1);
                }
        }
    });

        tv_phone2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (isPhonePermissionGranted()) {
                    Intent intent = new Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + getResources().getString(R.string.number2)));
                    if (ActivityCompat.checkSelfPermission(AboutUsActivity.this, Manifest.permission.CALL_PHONE) == PackageManager.PERMISSION_GRANTED) {
                        // TODO: Consider calling

                        //    ActivityCompat#requestPermissions
                        // here to request the missing permissions, and then overriding
                        //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
                        //                                          int[] grantResults)
                        // to handle the case where the user grants the permission. See the documentation
                        // for ActivityCompat#requestPermissions for more details.
                        startActivity(intent);
                    }
                    else
                        ActivityCompat.requestPermissions(AboutUsActivity.this, new String[]{Manifest.permission.CALL_PHONE}, 1);
                }
            }
        });

    }

    private void openWebsite() {
        cv_website.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent= new Intent(Intent.ACTION_VIEW, Uri.parse("http://www.ahalyalqassim.com"));
                startActivity(intent);

            }
        });
    }


    @Override
    public void onMapReady(GoogleMap googleMap)  {
      mMap = googleMap;
        Log.e("Tag","Map Ready");
        createMarker("مكتب القصيم بريدة","أسواق الغد",26.342,43.95425);
        createMarker("مكتب الرياض","شارع البطحاء",24.643111,46.715472);
        mMap.setBuildingsEnabled(true);
        mMap.animateCamera(CameraUpdateFactory.newLatLngZoom(new LatLng(26.342,43.95425),16));


    }

    public void createMarker(String title,String description,double lat,double lon){
        LatLng loc = new LatLng(lat,lon);
        MarkerOptions locationMarker=new MarkerOptions();
        locationMarker.position(loc)
                .title(title)
                .icon(BitmapDescriptorFactory.fromResource(R.mipmap.marker_ic))
                .snippet(description)
        ;
        Marker marker = mMap.addMarker(locationMarker);
        marker.showInfoWindow();
    }

    public  boolean isPhonePermissionGranted() {
        if (Build.VERSION.SDK_INT >= 23) {
            if (checkSelfPermission(Manifest.permission.CALL_PHONE)
                    == PackageManager.PERMISSION_GRANTED) {
                Log.v("Permisson","Permission is granted");
                return true;
            } else {

                Log.v("Permisson","Permission is revoked");
                ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.CALL_PHONE}, 1);
                return false;
            }
        }
        else { //permission is automatically granted on sdk<23 upon installation
            Log.v("Permisson","Permission is granted");
            return true;
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if(grantResults[0]== PackageManager.PERMISSION_GRANTED){
            Log.v("Permisson","Permission: "+permissions[0]+ "was "+grantResults[0]);
            //resume tasks needing this permission
        }
        else {
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.CALL_PHONE}, 1);
        }
    }
}
