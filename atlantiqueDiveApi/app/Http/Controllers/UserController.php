<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use GuzzleHttp\Client;

class UserController extends Controller
{
    function login(request $request){
        $email = json_decode($request->getcontent())->username;
        $password = json_decode($request->getcontent())->password;

        $http = new \GuzzleHttp\Client;

        $response = $http->post('http://localhost:8000//oauth/token', [
            'form_params' => [
                'grant_type' => 'password',
                'client_id' => '2',
                'client_secret' => 'client-secret',
                'username' => $email,
		        'password'  => $password
            ],
        ]);

        return response()->json(array(
            'response' => $response
        ), 200);
    }
}
