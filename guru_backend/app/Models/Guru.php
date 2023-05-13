<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Guru extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'no_induk_pegawai', 'nama_lengkap', 'mapel', 'tgl_lahir', 'jenis_kelamin', 'email', 'password',
    ];

    protected $table = 'guru';
    protected $primaryKey = 'id'; 
}
