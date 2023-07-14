package com.example.fire_base;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class ProfileActivity extends AppCompatActivity {

    TextView submit;
    FirebaseDatabase database;
    DatabaseReference myRef;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);

        submit=findViewById(R.id.submitbutton);



        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                database = FirebaseDatabase.getInstance();
                myRef = database.getReference("OtherData").push();

                Log.d("TTT", "ref: "+myRef);
                String id = myRef.getKey();
                Log.d("TTT", "ID=: "+id);

                Producs_Data producs_data=new Producs_Data(id,"Ravi","123","Developer");
                myRef.setValue(producs_data);
            }
        });
    }
}