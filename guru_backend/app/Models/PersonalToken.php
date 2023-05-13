<?php

namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class PersonalToken extends Model
{
    use HasFactory, HasApiTokens;

    protected $fillable = [
        'id', 'tokennable_type', 'tokennable_id',
    ];

    protected $table = 'pesonal_access_tokens';
}
