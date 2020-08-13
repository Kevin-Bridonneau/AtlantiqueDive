<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AdminController extends Controller
{
    function listUsers(request $request){
        $list = \DB::table('users')->get();
        return response()->json(array(
            'list'   =>  $list
        ), 200);
    }

    function getUser(request $request){
        if(isset($request->only('id')['id'])){
            $id = $request->only('id')['id'];
            $userData = \DB::table('users')->where('id', $id)->get();
            if(count($userData) === 0){
                return response()->json(array(
                    'message'   =>  'User not exist'
                ), 404);
            }
            return response()->json(array(
                'UserData'   =>  $userData
            ), 200);
        }
        return response()->json(array(
            'message'   =>  'Invalid request i can\'t see the user Id !'
        ), 400);
    }

    function deleteUser(request $request){
        if(isset($request->only('id')['id'])){
            $id = $request->only('id')['id'];
            $userData = \DB::table('users')->where('id', $id)->get();
            if(count($userData) === 0){
                return response()->json(array(
                    'message'   =>  'User not exist'
                ), 404);
            }
            else{
                \DB::table('users')
                    ->where('id', $id)
                    ->delete();
                    return response()->json(array(
                        'Message'   =>  'User deleted'
                    ), 200);
            }
        }
        return response()->json(array(
            'message'   =>  'Invalid request i can\'t see the user Id !'
        ), 400);
    }

    function updateProfile(request $request){

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
        if($userData[0]->type !== $type){
            $updateData['type'] = $type;
        }
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
        if(count($updateData) === 0){
            return response()->json(array(
                'message'   =>  'Nothing to change'
            ), 204);
        }
        \DB::table('users')
                ->where('id', $id)
                ->update($updateData);

            return response()->json(array(
                'message'   =>  "Profile Updated"
            ), 200);
    }

    function listProposals(request $request){
        $listProposals = \DB::table('divesites')->where('verified', 0 )->get();
        if(count($listProposals) === 0){
            return response()->json(array(
                'message'   =>  '0 new proposal found'
            ), 204);
        }
        return response()->json(array(
            'listProposal'   =>  $listProposals
        ), 200);
    }

    function acceptProposal(request $request){
        if(isset($request->only('id')['id'])){
            $id = $request->only('id')['id'];
            $proposal = \DB::table('divesites')->where('verified', 0 )->where('id', $id)->get();
            if(count($proposal) === 0){
                return response()->json(array(
                    'message'   =>  'proposal not exist'
                ), 404);
            }
            else{
                \DB::table('divesites')
                    ->where('id', $id)
                    ->update(['verified' => 1]);
                    return response()->json(array(
                        'Message'   =>  'New dive site accepted'
                    ), 200);
            }
        }
        return response()->json(array(
            'message'   =>  'Invalid request i can\'t see the proposal Id !'
        ), 400);
    }

    function refuseProposal(request $request){
        if(isset($request->only('id')['id'])){
            $id = $request->only('id')['id'];
            $proposal = \DB::table('divesites')->where('verified', 0 )->where('id', $id)->get();
            if(count($proposal) === 0){
                return response()->json(array(
                    'message'   =>  'proposal not exist'
                ), 404);
            }
            else{
                \DB::table('divesites')
                    ->where('id', $id)
                    ->delete();
                    return response()->json(array(
                        'Message'   =>  'Dive site refused and deleted in database'
                    ), 200);
            }
        }
        return response()->json(array(
            'message'   =>  'Invalid request i can\'t see the proposal Id !'
        ), 400);
    }
}
