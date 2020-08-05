<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Todo;

class TodoController extends Controller
{
    private $response = [
        'message' => null,
        'data' => null,
        'errors' => null
    ];

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();
        $this->response['message'] = 'success to get todos';
        $this->response['data'] = $user->todos;
        return response()->json($this->response, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'body' => 'max:255|required'
        ]);

        if( $validator->fails() ) {
            $this->response['errors'] = $validator->errors()->all();
            $this->response['message'] = 'an error has occured';
            return response()->json($this->response, 422);
        }

        $todo = Todo::create([
            'body' => $request->body,
            'user_id' => Auth::id()
        ]);
        
        $this->response['message'] = "success to create todo";
        $this->response['data'] = $todo;
        return response()->json($this->response, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Todo $todo)
    {
        if ($todo->user_id != Auth::id()) {
            $this->response['message'] = "failed to get todo with id $todo->id";
            $this->response['errors'] = ['you have no access to this todo'];
            return response()->json($this->response, 401);
        }
        $this->response['message'] = "success to get todo with id $todo->id";
        $this->response['data'] = $todo;
        return response()->json($this->response, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Todo $todo)
    {
        if ($todo->user_id != Auth::id()) {
            $this->response['message'] = "failed to update todo with id $todo->id";
            $this->response['errors'] = ['you have no access to this todo'];
            return response()->json($this->response, 401);
        }

        $validator = Validator::make($request->all(), [
            'body' => 'max:255|required'
        ]);

        if( $validator->fails() ) {
            $this->response['errors'] = $validator->errors()->all();
            $this->response['message'] = 'an error has occured';
            return response()->json($this->response, 422);
        }

        $todo->body = $request->body;
        $todo->save();
        $this->response['message'] = "success to update todo with id $todo->id";
        $this->response['data'] = $todo;
        return response()->json($this->response, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Todo $todo)
    {
        if ($todo->user_id != Auth::id()) {
            $this->response['message'] = "failed to update todo with id $todo->id";
            $this->response['errors'] = ['you have no access to this todo'];
            return response()->json($this->response, 401);
        }

        $todo->delete();
        $todos = Auth::user()->todos;
        $this->response['message'] = "success to delete todo with id $todo->id";
        $this->response['data'] = $todos;
        return response()->json($this->response, 200);
    }

    public function getFinished()
    {
        $user = Auth::user();
        $this->response['message'] = 'success to get todos';
        $this->response['data'] = $user->finishedTodos;
        return response()->json($this->response, 200);
    }

    public function setFinished(Todo $todo)
    {
        if ($todo->user_id != Auth::id()) {
            $this->response['message'] = "failed to update todo with id $todo->id";
            $this->response['errors'] = ['you have no access to this todo'];
            return response()->json($this->response, 401);
        }

        $todo->is_finished = true;
        $todo->save();
        $this->response['message'] = "success to update todo with id $todo->id";
        $this->response['data'] = $todo;
        return response()->json($this->response, 200);
    }
}
