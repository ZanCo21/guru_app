<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\PostinganApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('auth/verifyToken', [AuthController::class, 'verifyToken']);
    Route::post('auth/logout', [AuthController::class, 'logout']);
});


Route::post('auth/login', [AuthController::class, 'login']);
Route::post('auth/register', [AuthController::class, 'register']);


//crud postingan start

Route::get('/postingan',[PostinganApiController::class,'index']);//menampilakan semua data
Route::get('/postingan/{id}',[PostinganApiController::class,'show']);//menampilkan data sesuai id
Route::post('/postingan',[PostinganApiController::class,'store']);//menambah data baru
Route::put('/postingan/{id}',[PostinganApiController::class,'update']);//mengedit data 
Route::delete('/postingan/{id}',[PostinganApiController::class,'destroy']);//menghapus data sesuai id 

//crud postingan end

