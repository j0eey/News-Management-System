<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class PermissionsTableSeeder extends Seeder
{
    public function run()
    {
        Permission::create(['name' => 'create_news']);
        Permission::create(['name' => 'edit_news']);
        Permission::create(['name' => 'delete_news']);
        Permission::create(['name' => 'create_tags']);
        Permission::create(['name' => 'edit_tags']);
        Permission::create(['name' => 'delete_tags']);
        Permission::create(['name' => 'create_categories']);
        Permission::create(['name' => 'edit_categories']);
        Permission::create(['name' => 'delete_categories']);
        Permission::create(['name' => 'manage_admin']);
    }
}

