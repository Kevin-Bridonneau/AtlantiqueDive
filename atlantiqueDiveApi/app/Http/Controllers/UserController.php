<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserController extends Controller
{
    function login(request $request){
        $credentials = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {

            $token = Str::random(60);
            $user = Auth::user();
            $id = $user->id;
            \DB::table('users')
                    ->where('id', $id)
                    ->update(['remember_token' => $token]);

            $user = \DB::table('users')
                    ->where('id', $id)
                    ->get();

            return response()->json($user);
        }
        return response()->json(array(
            'Message'   =>  'Invalid credentials'
        ), 535);
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
            return response()->json(array(
                'Message'   =>  'User created'
            ), 200);
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
            return response()->json(array(
                'Message'   =>  'User created'
            ), 200);
        }
        return response()->json(array(
            'Message'   =>  'Unknown type'
        ), 400);
    }

    function update(request $request){
        if(!isset($request->only('type')['type'])){
            return response()->json(array(
                'message'   =>  "Type not found"
            ), 400);
        }
        elseif(!isset($request->only('id')['id'])){
            return response()->json(array(
                'message'   =>  "id not found"
            ), 400);
        }
        $type = $request->only('type')['type'];
        $id = $request->only('id')['id'];
        $userData = \DB::table('users')->where('id', $id)->get();
        if(count($userData) === 0){
            return response()->json(array(
                'message'   =>  "user not found"
            ), 400);
        }
        $updateData = [];
        if(isset($request->only('name')['name'])){
            $name = $request->only('name')['name'];
            $updateData['name'] = $name;
        }
        if(isset($request->only('email')['email'])){
            $email =$request->only('email')['email'] ;
            $updateData['email'] = $email;
        }
        if(isset($request->only('password')['password'])){
            $password = $request->only('password')['password'];
            $updateData['password'] = Hash::make($password);
        }
        if($type === "club"){
            if(isset($request->only('adress')['adress'])){
                $adress = $request->only('adress')['adress'];
                $updateData['adress'] = $adress;
            }
            if(isset($request->only('phone')['phone'])){
                $phone = $request->only('phone')['phone'];
                $updateData['phone'] = $phone;
            }
            if(isset($request->only('website')['website'])){
                $website = $request->only('website')['website'];
                $updateData['$website'] = $website;
            }
        }
            \DB::table('users')
                    ->where('id', $id)
                    ->update($updateData);

            return response()->json(array(
                'Message'   =>  'User updated'
            ), 200);
    }
}
