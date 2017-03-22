package com.example.mycompany.helloworld;

import android.content.res.Resources;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class HelloWorldActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_hello_world);

        initDisplayButton();
    }

    private void initDisplayButton() {
        Button displayButton = (Button) findViewById(R.id.buttonDisplay);
        displayButton.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View arg0) {
                EditText editName = (EditText) findViewById(R.id.editTextName);
                TextView textDisplay = (TextView) findViewById(R.id.textViewDisplay);
                String nameToDisplay = editName.getText().toString();
                Resources res = getResources();
                String displayString = res.getString(R.string.welcome_messages, nameToDisplay);
                textDisplay.setText(displayString);
            }
        });
    }

}
