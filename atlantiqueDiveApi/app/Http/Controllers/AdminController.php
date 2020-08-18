<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    function listUsers(request $request){
        $list = \DB::table('users')->where('type','!=','admin')->get();
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


    function createUser(request $request){
        if(!isset($request->only('type')['type'])){
            return response()->json(array(
                'message'   =>  'Invalid request i can\'t see the user type !'
            ), 400);
        }
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
                'message'   =>  'User created'
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
                'message'   =>  'User created'
            ), 200);
        }
        if($type === "admin"){
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
                'message'   =>  'User created'
            ), 200);
        }
        return response()->json(array(
            'message'   =>  'Unknow user type !'
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
                $updateData['website'] = $website;
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

    function createDiveSite(request $request){
        if(!isset($request->only('name')['name']) || !isset($request->only('description')['description']) ||!isset($request->only('depth')['depth']) || !isset($request->only('lat')['lat']) || !isset($request->only('lat')['lat']) || !isset($request->only('lng')['lng']) || !isset($request->only('verified')['verified']) ){
            return response()->json(array(
                'message'   =>  'Invalid request we need name, description,lat,lng and depth at least'
            ), 400);
        }
        $name = $request->only('name')['name'];
        $description = $request->only('description')['description'];
        $depth = $request->only('depth')['depth'];
        $lat = $request->only('lat')['lat'];
        $lng = $request->only('lng')['lng'];
        $verified = $request->only('verified')['verified'];

        if(isset($request->only('visibility')['visibility'])){
            $visibility = $request->only('visibility')['visibility'];
        }
        else $visibility = "";

        if(isset($request->only('current')['current'])){
            $current = $request->only('current')['current'];
        }
        else $current = "";

        if(isset($request->only('pathToPicture')['pathToPicture'])){
            $pathToPicture = $request->only('pathToPicture')['pathToPicture'];
        }
        else $pathToPicture = "";
        
        \DB::insert('insert into divesites (name, description, depth, visibility, current, pathtopicture, lat, lng,verified)
         values (?, ?, ?, ?, ?, ?, ?, ?, ?)', 
         [$name, $description, $depth, $visibility, $current, $pathToPicture, $lat, $lng,$verified]);
        
        return response()->json(array(
            'Message'   =>  'Dive site created'
        ), 200);
    }

    function updateDiveSite(request $request){
        if(!isset($request->only('id')['id'])){
         return response()->json(array(
                'message'   =>  'Invalid request we need dive site id'
            ), 400);
        }
        $id = $request->only('id')['id'];
        $diveData = \DB::table('divesites')->where('id', $id)->get();
        if(count($diveData) === 0){
            return response()->json(array(
                'message'   =>  "user not found"
            ), 400);
        }
        $updateData = [];
        if(isset($request->only('name')['name'])){
            $name = $request->only('name')['name'];
            $updateData['name'] = $name;
        }
        if(isset($request->only('description')['description'])){
            $description = $request->only('description')['description'];
            $updateData['description'] = $description;
        }
        if(isset($request->only('lat')['lat'])){
            $lat = $request->only('lat')['lat'];
            $updateData['lat'] = $lat;
        }
        if(isset($request->only('lng')['lng'])){
            $lng = $request->only('lng')['lng'];
            $updateData['lng'] = $lng;
        }
        if(isset($request->only('depth')['depth'])){
            $depth = $request->only('depth')['depth'];
            $updateData['depth'] = $depth;
        }
        if(isset($request->only('visibility')['visibility'])){
            $visibility = $request->only('visibility')['visibility'];
            $updateData['visibility'] = $visibility;
        }
        if(isset($request->only('current')['current'])){
            $current = $request->only('current')['current'];
            $updateData['current'] = $current;
        }
        \DB::table('divesites')
                    ->where('id', $id)
                    ->update($updateData);
        
        return response()->json(array(
            'Message'   =>  'Dive site updated'
        ), 200);
    }

    function deleteDiveSite(request $request){
        if(isset($request->only('id')['id'])){
            $id = $request->only('id')['id'];
            $divesitesData = \DB::table('divesites')->where('id', $id)->get();
            if(count($divesitesData) === 0){
                return response()->json(array(
                    'message'   =>  'Dive Site not exist'
                ), 404);
            }
            else{
                \DB::table('divesites')
                    ->where('id', $id)
                    ->delete();
                    return response()->json(array(
                        'Message'   =>  'Dive site deleted'
                    ), 200);
            }
        }
        return response()->json(array(
            'message'   =>  'Invalid request i can\'t see the dive site Id !'
        ), 400);
    }

    function deleteNotice(request $request){
        if(isset($request->only('id')['id'])){
            $id = $request->only('id')['id'];
            $noticeData = \DB::table('notice')->where('id', $id)->get();
            if(count($noticeData) === 0){
                return response()->json(array(
                    'message'   =>  'Notice not exist'
                ), 404);
            }
            else{
                \DB::table('notice')
                    ->where('id', $id)
                    ->delete();
                    return response()->json(array(
                        'Message'   =>  'Notice deleted'
                    ), 200);
            }
        }
        return response()->json(array(
            'message'   =>  'Invalid request i can\'t see the notice Id !'
        ), 400);
    }

    function deletePresence(request $request){
        if(isset($request->only('id')['id'])){
            $id = $request->only('id')['id'];
            $presenceData = \DB::table('presence')->where('id', $id)->get();
            if(count($presenceData) === 0){
                return response()->json(array(
                    'message'   =>  'Presence not exist'
                ), 404);
            }
            else{
                \DB::table('presence')
                    ->where('id', $id)
                    ->delete();
                    return response()->json(array(
                        'Message'   =>  'Presence deleted'
                    ), 200);
            }
        }
        return response()->json(array(
            'message'   =>  'Invalid request i can\'t see the presence Id !'
        ), 400);
    }
}
