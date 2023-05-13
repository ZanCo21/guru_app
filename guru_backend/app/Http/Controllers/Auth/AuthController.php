<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Guru;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Mockery\Expectation;
use Laravel\Sanctum\PersonalAccessToken;
use App\Models\PersonalToken;

class AuthController extends Controller
{

    private $response = [
        'message' => null,
        'data' => null,
    ];

    public function register(Request $req)
    {
        $req->validate([
            'nama_lengkap' => 'required',
            'email' => 'required',
            'password' => 'required'
        ]);

        try {
            $guru = Guru::create([
                'nama_lengkap' => $req->nama_lengkap,
                'email' => $req->email,
                'password' => Hash::make($req->password),
            ]);
            $response = ['status' => 200, 'message' => 'Register Successfully! Welcome to Our Community'];
            return response()->json($response);
        } catch (Expectation $e) {
            $response = ['status' => 500, 'message' => $e];
        }
    }

    public function login(Request $request)
    {

        // $request->validate([
        //     'email' => 'required',
        //     'password' => 'required'
        // ]);

        $guru = Guru::where('email', $request->email)->first();
        if ($guru != '[]' && Hash::check($request->password, $guru->password)) {
            $token = $guru->createToken('Personal Access Token')->plainTextToken;
            $response = ['status' => 200, 'token' => $token, 'guru' => $guru, 'message' => 'Successfully Login! Welcome Back'];
            return response()->json($response);
        } else if ($guru == '[]') {
            $response = ['status' => 500, 'message' => 'No account found with this email'];
            return response()->json($response);
        } else {
            $response = ['status' => 500, 'message' => 'Wrong email or password! please try again'];
            return response()->json($response);
        }

        // if (!$guru || !Hash::check($request->password, $guru->password)) {
        //     return response()->json([
        //         'message' => "failed"
        //     ]);
        // }

        // $token =  $guru->createToken($request->device_name)->plainTextToken;
        // $this->response['message'] = 'success';
        // $this->response['data'] = [
        //     'token' => $token
        // ];

        // return response()->json($this->response, 200);
    }


    // public function verifyToken(Request $request)
    // {
    //     $user = Auth::user();
    //     $token = $request->bearerToken();

    //     if ($user->tokens()->where('token', $token)->exists()) {
    //         return response()->json(['message' => 'Token is valid'], 200);
    //     } else {
    //         return response()->json(['message' => 'Token is invalid'], 401);
    //     }
    // }


    // public function aftergettoken()
    // {
    //     $user = Auth::user();
    //     $guru = $user->guru;

    //     $this->response['message'] = 'success';
    //     $this->response['data'] = $user;

    //     return response()->json($this->response, 200);
    // }


    public function logout()
    {
        $user = Auth::user();
        $token = PersonalAccessToken::findToken(request()->bearerToken());
        if ($token && $token->tokenable_id === $user->id) {
            $token->delete();
            return response()->json(['message' => 'Berhasil keluar'], 200);
        } else {
            return response()->json(['message' => 'Token autentikasi tidak ditemukan'], 400);
        }
    }
}
