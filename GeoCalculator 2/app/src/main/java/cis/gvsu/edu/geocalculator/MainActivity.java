package cis.gvsu.edu.geocalculator;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Button;
import android.widget.TextView;
import android.location.Location;
import java.text.DecimalFormat;
import java.math.RoundingMode;
import android.view.inputmethod.InputMethodManager;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button clearButton = (Button)this.findViewById(R.id.clear);
        Button calcButton = (Button)this.findViewById(R.id.calc);
        final EditText p1Lat = (EditText) this.findViewById(R.id.p1Lat);
        final EditText p1Lng = (EditText) this.findViewById(R.id.p1Lng);
        final EditText p2Lat = (EditText) this.findViewById(R.id.p2Lat);
        final EditText p2Lng = (EditText) this.findViewById(R.id.p2Lng);
        TextView distance = (TextView) this.findViewById(R.id.distance);
        TextView bearing = (TextView) this.findViewById(R.id.bearing);
/*
        clearButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                p1Lat.getText().clear();
                p1Lng.getText().clear();
                p2Lat.getText().clear();
                p2Lng.getText().clear();
            }
        });
 */
        clearButton.setOnClickListener(v -> {
            hideKeyboard();
            p1Lat.getText().clear();
            p1Lng.getText().clear();
            p2Lat.getText().clear();
            p2Lng.getText().clear();
            distance.setText("Distance:");
            bearing.setText("Bearing:");
        });

        calcButton.setOnClickListener(v -> {

            try {
                Double lat1 = Double.parseDouble(p1Lat.getText().toString());
                Double lng1 = Double.parseDouble(p1Lng.getText().toString());
                Double lat2 = Double.parseDouble(p2Lat.getText().toString());
                Double lng2 = Double.parseDouble(p2Lng.getText().toString());


                Location p1 = new Location("");//provider name is unecessary
                p1.setLatitude(lat1);//your coords of course
                p1.setLongitude(lng1);

                Location p2 = new Location("");
                p2.setLatitude(lat2);
                p2.setLongitude(lng2);

                double b = p1.bearingTo(p2);
                double d = p1.distanceTo(p2) / 1000.0d;

                DecimalFormat df = new DecimalFormat("#.##");
                df.setRoundingMode(RoundingMode.CEILING);


                String dStr = "Distance: " + df.format(d) + " kilometers.";
                distance.setText(dStr);

                String bStr = "Bearing: " + df.format(b) + " degrees.";
                bearing.setText(bStr);
                hideKeyboard();
            } catch (Exception e) {
                return;
            }

        });
    }

    private void hideKeyboard()
    {
        // Check if no view has focus:
        View view = this.getCurrentFocus();
        if (view != null) {
            //this.getSystemService(Context.INPUT_METHOD_SERVICE);
            InputMethodManager imm = (InputMethodManager) this.getSystemService(Context.INPUT_METHOD_SERVICE);
            imm.hideSoftInputFromWindow(view.getWindowToken(), 0);
        }
    }
}
