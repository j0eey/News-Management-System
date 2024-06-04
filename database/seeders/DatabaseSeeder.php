<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;



class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call(RoleSeeder::class);

        // Create permissions
        Permission::create(['name' => 'create news']);
        Permission::create(['name' => 'edit news']);
        Permission::create(['name' => 'delete news']);
        // Define other permissions as needed

        // Find the user
        $user = User::find(1);

        // Assign role to the user
        $user->assignRole('super-admin');

        // Assign permissions to the role
        $role = Role::findByName('super-admin');
        $role->givePermissionTo(['create news', 'edit news', 'delete news']);
    }
}
