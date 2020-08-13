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

    function update(request $request){
        if($request->only('type')['type'] === NULL){
            return response()->json(array(
                'message'   =>  "Type not found"
            ), 400);
        }
        elseif($request->only('id')['id'] === NULL){
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
        if($request->only('name')['name'] !== NULL){
            $name = $request->only('name')['name'];
            $updateData['name'] = $name;
        }
        if($request->only('email')['email'] !== NULL){
            $email =$request->only('email')['email'] ;
            $updateData['email'] = $email;
        }
        if($request->only('password')['password'] !== NULL){
            $password = $request->only('password')['password'];
            $updateData['password'] = Hash::make($password);
        }
        if($type === "club"){
            if($request->only('adress')['adress'] !== NULL){
                $adress = $request->only('adress')['adress'];
                $updateData['adress'] = $adress;
            }
            if($request->only('phone')['phone'] !== NULL){
                $phone = $request->only('phone')['phone'];
                $updateData['phone'] = $phone;
            }
            if($request->only('website')['website'] !== NULL){
                $website = $request->only('website')['website'];
                $updateData['$website'] = $website;
            }
        }
            \DB::table('users')
                    ->where('id', $id)
                    ->update($updateData);

            return response()->json('user updated');
    }
}
