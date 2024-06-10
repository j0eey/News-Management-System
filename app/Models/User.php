<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\Concerns\HasAttributes;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Carbon\Carbon;

class User extends Authenticatable
{
    use HasRoles;

    protected $fillable = [
        'name', 
        'email',
        'password',
        'role_id', 
        'is_super_admin', 
        'last_login_date', 
    ];

    protected $casts = [
        'last_login_date' => 'datetime',
    ];

    // Define the permissions relationship
    public function permissions()
    {
        return $this->belongsToMany(Permission::class, 'model_has_permissions', 'model_id', 'permission_id');
    }
    
    
}

