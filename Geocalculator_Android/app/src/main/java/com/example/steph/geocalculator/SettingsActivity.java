package com.example.steph.geocalculator;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

public class SettingsActivity extends AppCompatActivity {
    private String distanceMetric = "km";
    private String bearingsMetric = "degrees";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
//                        .setAction("Action", null).show();
                Intent intent = new Intent();
                intent.putExtra("distanceMetric", distanceMetric);
                intent.putExtra("bearingMetric", bearingsMetric);
                setResult(Calculator.SETTINGS_RESULT, intent);

                finish();
            }
        });

        Spinner distanceSpinner = (Spinner) findViewById(R.id.distanceSpinner);
        Spinner bearingSpinner = (Spinner) findViewById(R.id.bearingSpinner);

        ArrayAdapter<CharSequence> adapterDistance = ArrayAdapter.createFromResource(this, R.array.distance, android.R.layout.simple_spinner_item);
        ArrayAdapter<CharSequence> adapterBearing = ArrayAdapter.createFromResource(this, R.array.bearing, android.R.layout.simple_spinner_item);

        adapterDistance.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        adapterBearing.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        distanceSpinner.setAdapter(adapterDistance);
        bearingSpinner.setAdapter(adapterBearing);

        distanceSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i,long l){
                distanceMetric = (String) adapterView.getItemAtPosition(i);
            }

            @Override
            public void onNothingSelected(AdapterView adapterView){

            }
        });

        bearingSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i,long l){
                bearingsMetric = (String) adapterView.getItemAtPosition(i);
            }

            @Override
            public void onNothingSelected(AdapterView adapterView){

            }
        });
    }

}
