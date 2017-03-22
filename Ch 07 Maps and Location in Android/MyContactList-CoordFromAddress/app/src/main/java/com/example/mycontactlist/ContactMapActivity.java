package com.example.mycontactlist;

import android.content.Intent;
import android.location.Address;
import android.location.Geocoder;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;
import java.io.IOException;
import java.util.List;

public class ContactMapActivity extends AppCompatActivity {



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_contact_map);

        initListButton();
        initMapButton();
        initSettingsButton();

        initGetLocationButton();

    }

    private void initGetLocationButton() {
        Button locationButton = (Button) findViewById(R.id.buttonGetLocation);
        locationButton.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                EditText editAddress = (EditText) findViewById(R.id.editAddress);
                EditText editCity = (EditText) findViewById(R.id.editCity);
                EditText editState = (EditText) findViewById(R.id.editState);
                EditText editZipCode = (EditText) findViewById(R.id.editZipcode);

                String address = editAddress.getText().toString() + ", " +
                        editCity.getText().toString() + ", " +
                        editState.getText().toString() + ", " +
                        editZipCode.getText().toString();

                List<Address> addresses = null;
                Geocoder geo = new Geocoder(ContactMapActivity.this);
                try {
                    addresses = geo.getFromLocationName(address, 1);
                }
                catch (IOException e) {
                    e.printStackTrace();
                }

                TextView txtLatitude = (TextView) findViewById(R.id.textLatitude);
                TextView txtLongitude = (TextView) findViewById(R.id.textLongitude);
                //5
                txtLatitude.setText(String.valueOf(addresses.get(0).getLatitude()));
                txtLongitude.setText(String.valueOf(addresses.get(0).getLongitude()));
            }
        });
    }


    private void initListButton() {
        ImageButton ibList = (ImageButton) findViewById(R.id.imageButtonList);
        ibList.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Intent intent = new Intent(ContactMapActivity.this, ContactListActivity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                startActivity(intent);
            }
        });
    }

    private void initMapButton() {
        ImageButton ibList = (ImageButton) findViewById(R.id.imageButtonMap);
        ibList.setEnabled(false);
    }

    private void initSettingsButton() {
        ImageButton ibList = (ImageButton) findViewById(R.id.imageButtonSettings);
        ibList.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                Intent intent = new Intent(ContactMapActivity.this, ContactSettingsActivity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                startActivity(intent);
            }
        });
    }


 }
