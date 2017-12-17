package com.example.ishigakishun.kinta_kun.utilities

import android.content.Context
import android.content.SharedPreferences

class SharedPreferencesUtil {
    private final val PREFERENCE_NAME: String = "kinta_preferences"
    private final val FIRST_LAUNCH: String = "first_launch"

    public fun setFirstLaunchStatus(context: Context, isFirstLaunch: Boolean) {
        val sharedPreference = context.getSharedPreferences(PREFERENCE_NAME, Context.MODE_PRIVATE)
        sharedPreference.edit().putBoolean(PREFERENCE_NAME, isFirstLaunch).apply()
    }

    public fun getFirstLaunchStatus(context: Context) : Boolean {
        val sharedPreference = context.getSharedPreferences(FIRST_LAUNCH, Context.MODE_PRIVATE)
        return sharedPreference.getBoolean(FIRST_LAUNCH, true)
    }
}