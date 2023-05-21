<?php

namespace App\Http\Controllers;

use App\Models\Postingan;
use Illuminate\Http\Request;

class PostinganApiController extends Controller
{
    public function index()
    {
        $Postingans = Postingan::all();
        return response()->json(['message' => 'berhasil', 'data'=> $Postingans]);
    }

    public function show($id)
    {
        $Postingan = Postingan::find($id);
        return response()->json(['message' => 'berhasil', 'data'=> $Postingan]);
    }

    public function store(Request $request)
    {
        $Postingan = Postingan::create($request->all());
        return response()->json(['message' => 'berhasil di tambah', 'data'=> $Postingan]);
    }

    public function update(Request $request, $id)
    {
        $Postingan = Postingan::find($id);
        $Postingan->update($request->all());
        return response()->json(['message' => 'berhasil di edit', 'data'=> $Postingan]);
    }

    public function destroy($id)
    {
        $Postingan = Postingan::find($id);
        $Postingan->delete();
        return response()->json(['message' => 'berhasil di hapus', 'data'=> null]);
    }
    
}
