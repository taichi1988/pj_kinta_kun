package com.example.ishigakishun.kinta_kun.activity

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.support.v7.app.AppCompatActivity
import com.example.ishigakishun.kinta_kun.R

class SplashActivity : AppCompatActivity() {
    private val mHandler = Handler()
    private val mRunnable = Runnable {
        val intent = Intent(this, MainActivity::class.java)
        startActivity(intent)
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash)

        mHandler.postDelayed(mRunnable, 2000)
    }
}