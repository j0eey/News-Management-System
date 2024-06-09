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
        'name', // Ensure 'name' is fillable
        'email',
        'password',
        'role_id', // Add role_id field to fillable
        'is_super_admin', // Add is_super_admin field to fillable
        'last_login_date', // Add last_login_date field to fillable
    ];

    protected $casts = [
        'last_login_date' => 'datetime', // Cast last_login_date to a DateTime object
    ];

    // Define the permissions relationship
    public function permissions()
    {
        return $this->belongsToMany(Permission::class, 'model_has_permissions', 'model_id', 'permission_id');
    }
    
    
}

