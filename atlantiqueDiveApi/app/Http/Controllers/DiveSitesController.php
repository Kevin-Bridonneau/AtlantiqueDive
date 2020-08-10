<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DiveSitesController extends Controller
{
    function add(request $request){
        $name = $request->only('name')['name'];
        $description = $request->only('description')['description'];
        $depth = $request->only('depth')['depth'];
        $visibility = $request->only('visibility')['visibility'];
        $current = $request->only('current')['current'];
        $pathToPicture = $request->only('pathToPicture')['pathToPicture'];
        $lat = $request->only('lat')['lat'];
        $lng = $request->only('lng')['lng'];
        \DB::insert('insert into divesites (name, description, depth, visibility, current, pathtopicture, lat, lng)
         values (?, ?, ?, ?, ?, ?, ?, ?)', 
         [$name, $description, $depth, $visibility, $current, $pathToPicture, $lat, $lng]);

        return response()->json('Dive site created');

    }

    function getAllDiveSites(){
        $datas = DB::table('divesites')->get();
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
                ->join('users', 'users.id', '=', 'presence.club_id')
                ->where('dive_id', $dive_id)
                ->get();

        return response()->json($presences);
    }
}
