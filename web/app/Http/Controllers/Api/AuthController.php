<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Validator;
use App\User;

class AuthController extends Controller
{
    private $response = [
        'message' => null,
        'data' => null,
        'errors' => null
    ];

    public function login(Request $request)
    {
        $credentials = $request->only(['email', 'password']);

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $this->response['message'] = 'login success';
            $this->response['data'] = $user;
            return response()->json($this->response, 200);
        }
        $this->response['message'] = 'login failed';
        return response()->json($this->response, 401);
    }

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'name' => 'required',
            'password' => 'required|min:8'
        ]);

        if( $validator->fails() ) {
            $this->response['errors'] = $validator->errors()->all();
            $this->response['message'] = 'an error has occured';
            return response()->json($this->response, 422);
        }

        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->api_token = Str::random(60);
        $user->remember_token = Str::random(10);
        $user->save();

        $this->response['message'] = 'register success';
        $this->response['data'] = $user;
        return response()->json($this->response, 201);
    }
}
