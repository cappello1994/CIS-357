package com.example.steph.geocalculator;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.ButtonBarLayout;
import android.view.View;
import android.widget.EditText;
import android.widget.Button;
import android.widget.TextView;
import android.location.*;

public class Calculator extends AppCompatActivity {

    public static final int SETTINGS_RESULT = 1;

    public String dM = "km";
    public String bM = "degrees";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calculator);

        final EditText latp1 = (EditText) findViewById(R.id.latp1);
        EditText longp1 = (EditText) findViewById(R.id.longp1);
        EditText latp2 = (EditText) findViewById(R.id.latp2);
        EditText longp2 = (EditText) findViewById(R.id.longp2);

        Button calcButton = (Button) findViewById(R.id.calcButton);
        Button clearButton = (Button) findViewById(R.id.clearButton);
        Button settingsButton = (Button) findViewById(R.id.settingsButton);

        TextView distanceLabel = (TextView) findViewById(R.id.distanceLabel);
        TextView bearingLabel = (TextView) findViewById(R.id.bearingLabel);

        TextView distanceCalc = (TextView) findViewById(R.id.distanceCalc);
        TextView bearingCalc = (TextView) findViewById(R.id.bearingCalc);

        settingsButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){
                Intent intent = new Intent(Calculator.this, SettingsActivity.class);
                startActivityForResult(intent, SETTINGS_RESULT );
            }
        });

        clearButton.setOnClickListener(v -> {
            latp1.setText("");
            longp1.setText("");
            latp2.setText("");
            longp2.setText("");
            distanceCalc.setText("");
            bearingCalc.setText("");
        });

        calcButton.setOnClickListener(v ->{
            double latA = Double.parseDouble(latp1.getText().toString());
            double longA = Double.parseDouble(longp1.getText().toString());
            double latB = Double.parseDouble(latp2.getText().toString());
            double longB = Double.parseDouble(longp2.getText().toString());

            Location loc1 = new Location("point 1");
            Location loc2 = new Location("point 2");
            loc1.setLatitude(latA);
            loc1.setLongitude(longA);
            loc2.setLatitude(latB);
            loc2.setLongitude(longB);

            double distanceMeters = loc1.distanceTo(loc2);
            double km = distanceMeters/1000;
            double miles = km * 1.609344;
            double roundKm = Math.round(km*100)/100;
            double roundMiles = Math.round(miles*100)/100;
            if(dM=="km"){
                distanceCalc.setText(String.valueOf(roundKm) + dM);
            }else{
                distanceCalc.setText(String.valueOf(roundMiles) + dM);
            }

            double bearingDegrees = loc1.bearingTo(loc2);
            double bearingRadians = Math.toRadians(bearingDegrees);
            double roundRadians = Math.round(bearingRadians*100)/100;
            double roundDegrees = Math.round(bearingDegrees*100)/100;
            if(bM == "degrees") {
                bearingCalc.setText(String.valueOf(roundDegrees));
            }else{
                bearingCalc.setText(String.valueOf(roundRadians));
            }
        });


    }
        @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data){
        if(resultCode == SETTINGS_RESULT){
            dM = data.getStringExtra("distanceMetric");
            bM = data.getStringExtra("bearingMetric");
        }
    }
}
