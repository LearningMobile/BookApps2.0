package com.example.mycontactlist;

/**
 * Created by Michael Eierman on 11/2/2016.
 */

import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.text.format.Time;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.DatePicker;

import java.util.Calendar;

public class DatePickerDialog extends DialogFragment {                           //1

    public interface SaveDateListener {                                         //2
        void didFinishDatePickerDialog(Calendar selectedTime);
    }

    public DatePickerDialog() {                                                  //3
        // Empty constructor required for DialogFragment
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {                                           //4
        final View view = inflater.inflate(R.layout.select_date, container);

        getDialog().setTitle("Select Date");

        final DatePicker dp = (DatePicker) view.findViewById(R.id.birthdayPicker);

        Button saveButton = (Button) view.findViewById(R.id.buttonSelect);
        saveButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View arg0) {
                Calendar selectedTime = Calendar.getInstance();                //5
                selectedTime.set(dp.getYear(), dp.getMonth(), dp.getDayOfMonth());
                saveItem(selectedTime);
            }
        });
        Button cancelButton = (Button) view.findViewById(R.id.buttonCancel);
        cancelButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                getDialog().dismiss();
            }
        });
        return view;
    }

    private void saveItem(Calendar selectedTime) {                               //6
        SaveDateListener activity = (SaveDateListener) getActivity();
        activity.didFinishDatePickerDialog(selectedTime);
        getDialog().dismiss();
    }
}
