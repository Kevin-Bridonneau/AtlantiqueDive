<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    function login(request $request){
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            
            $user = Auth::user();
            return response()->json($user);

        }

        return response()->json('unknown User');

    }


    function register(request $request){

        $type = $request->only('type')['type'];
        
        if($type === "plongeur"){
            $email = $request->only('email')['email'];
            $name = $request->only('name')['name'];
            $password = $request->only('password')['password'];
            User::create([
                'type' => $type,
                'name' => $name,
                'email' => $email,
                'password' => Hash::make($password),
            ]);
            return response()->json('user created');
        }
        elseif($type === "club"){
            $email = $request->only('email')['email'];
            $name = $request->only('name')['name'];
            $password = $request->only('password')['password'];
            $adress = $request->only('adress')['adress'];
            $phone = $request->only('phone')['phone'];
            $website = $request->only('website')['website'];
            User::create([
                'type' => $type,
                'name' => $name,
                'email' => $email,
                'adress' => $adress,
                'phone' => $phone,
                'website' => $website,
                'password' => Hash::make($password),
            ]);
            return response()->json('user created');
        }

        return response()->json('user not created');

    }
}
