package com.khaled.hegg.adapter;

import android.content.Context;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;

import com.khaled.hegg.fragment.ChooseOne;
import com.khaled.hegg.fragment.ChooseTwo;

/**
 * Created by khaled on 24/08/17.
 */

public class MainAdapter extends FragmentPagerAdapter {

    Context mContext ;

    public MainAdapter(FragmentManager fm) {
        super(fm);
    }


    @Override
    public Fragment getItem(int position) {

        switch (position){
            case 0:
                return new ChooseOne();
            case 1:
                return new ChooseTwo();
            default:
                return new ChooseOne();
        }

    }

    @Override
    public int getCount() {
        return 2;
    }
}
