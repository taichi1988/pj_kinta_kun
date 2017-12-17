package com.example.ishigakishun.kinta_kun.activity

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.support.v7.app.AppCompatActivity
import com.example.ishigakishun.kinta_kun.R
import com.example.ishigakishun.kinta_kun.utilities.SharedPreferencesUtil

class SplashActivity : AppCompatActivity() {
    private val mHandler = Handler()
    private val mRunnable = Runnable {
        var  intent: Intent
        if (SharedPreferencesUtil().getFirstLaunchStatus(this)) {
            // 初回起動
            // TODO: 初回起動画面に遷移
            SharedPreferencesUtil().setFirstLaunchStatus(this, false)
            intent = Intent(this, MainActivity::class.java)
        } else {
            // 非初回起動
            intent = Intent(this, MainActivity::class.java)
        }
        startActivity(intent)
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash)

        mHandler.postDelayed(mRunnable, 2000)
    }
}