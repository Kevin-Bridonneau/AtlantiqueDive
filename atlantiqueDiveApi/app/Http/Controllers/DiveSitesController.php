<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class DiveSitesController extends Controller
{
    function add(request $request){
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
        
        if($request->only('visibility')['visibility']) {
            $visibility = $request->only('visibility')['visibility'];
        }
        else $visibility = "";
        if($request->only('current')['current']){
            $current = $request->only('current')['current'];
        }
        else $current = "";
         if($request->file('pathToPicture')){
            $img = $request->file('pathToPicture');
            $imgName = Str::slug($name .'_'.time());
            $folder = '/'.$name;
            $filePath = $imgName. '.' . $img->getClientOriginalExtension();
            $fullPath = $folder.'/'.$filePath;
            $img->storeAs($folder, $filePath, 'public');
        }
        else $pathToPicture = "";
        
        \DB::insert('insert into divesites (name, description, depth, visibility, current, pathtopicture, lat, lng,verified)
         values (?, ?, ?, ?, ?, ?, ?, ?, ?)', 
         [$name, $description, $depth, $visibility, $current, $fullPath, $lat, $lng,$verified]);
        
        return response()->json(array(
            'Message'   =>  'Dive site created'
        ), 200);
    }

    function getAllDiveSites(){
        $datas = DB::table('divesites')->where('verified', 1 )->get();
        return response()->json($datas);
    }

    function addNotice(request $request){
        $dive_id = $request->only('dive_id')['dive_id'];
        $user_id = $request->only('user_id')['user_id'];
        $msg = $request->only('msg')['msg'];
        $rate = $request->only('rate')['rate'];

        \DB::insert('insert into notice (dive_id, user_id, created_at, msg, rate)
         values (?, ?, ?, ?, ?)', 
         [$dive_id, $user_id, now(),$msg,$rate]);

        return response()->json('notice added');
    }

    function getNotice(request $request){
        $dive_id = $request->only('dive_id')['dive_id'];
        $notices  = DB::table('notice')
                ->select('notice.id','dive_id','notice.created_at','msg','rate','user_id','users.name','users.email')
                ->join('users', 'users.id', '=', 'notice.user_id')
                ->where('dive_id', $dive_id)
                ->get();
        return response()->json($notices);
    }



    function addPresence(request $request){
        $dive_id = $request->only('dive_id')['dive_id'];
        $club_id = $request->only('club_id')['club_id'];
        $datas  = DB::table('presence')
                ->where('dive_id', $dive_id)
                ->where('club_id', $club_id)
                ->get()
                ->count();
        if($datas > 0){
            return response()->json('presence already added');
        }

        \DB::insert('insert into presence (dive_id, club_id)
         values (?, ?)', 
         [$dive_id, $club_id ]);

        return response()->json('presence added');
    }

    function getPresence(request $request){
        $dive_id = $request->only('dive_id')['dive_id'];
        $presences  = DB::table('presence')
                ->select('presence.id','dive_id','club_id','users.name','users.email','users.adress','users.website','users.phone')
                ->join('users', 'users.id', '=', 'presence.club_id')
                ->where('dive_id', $dive_id)
                ->get();

        return response()->json($presences);
    }

}
