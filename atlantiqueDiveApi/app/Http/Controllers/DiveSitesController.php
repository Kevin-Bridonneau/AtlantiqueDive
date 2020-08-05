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
}
