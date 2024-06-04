<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RoleHasPermissionsTableSeeder extends Seeder
{
    public function run()
    {
        // Fetch roles
        $superadminRole = Role::where('name', 'Super Admin')->first();
        $adminRole = Role::where('name', 'Admin')->first();
        $memberRole = Role::where('name', 'Member')->first();

        // Fetch permissions
        $createNewsPermission = Permission::where('name', 'create_news')->first();
        $editNewsPermission = Permission::where('name', 'edit_news')->first();
        $deleteNewsPermission = Permission::where('name', 'delete_news')->first();
        $createTagsPermission = Permission::where('name', 'create_tags')->first();
        $editTagsPermission = Permission::where('name', 'edit_tags')->first();
        $deleteTagsPermission = Permission::where('name', 'delete_tags')->first();
        $createCategoriesPermission = Permission::where('name', 'create_categories')->first();
        $editCategoriesPermission = Permission::where('name', 'edit_categories')->first();
        $deleteCategoriesPermission = Permission::where('name', 'delete_categories')->first();
        $manageAdminPermission = Permission::where('name', 'manage_admin')->first();

        // Assign permissions to roles
        $superadminRole->givePermissionTo($createNewsPermission);
        $superadminRole->givePermissionTo($editNewsPermission);
        $superadminRole->givePermissionTo($deleteNewsPermission);
        $superadminRole->givePermissionTo($createTagsPermission);
        $superadminRole->givePermissionTo($editTagsPermission);
        $superadminRole->givePermissionTo($deleteTagsPermission);
        $superadminRole->givePermissionTo($createCategoriesPermission);
        $superadminRole->givePermissionTo($editCategoriesPermission);
        $superadminRole->givePermissionTo($deleteCategoriesPermission);
        $superadminRole->givePermissionTo($manageAdminPermission);

        $adminRole->givePermissionTo($createNewsPermission);
        $adminRole->givePermissionTo($editNewsPermission);
        $adminRole->givePermissionTo($deleteNewsPermission);
        $adminRole->givePermissionTo($createTagsPermission);
        $adminRole->givePermissionTo($editTagsPermission);
        $adminRole->givePermissionTo($deleteTagsPermission);
        $adminRole->givePermissionTo($createCategoriesPermission);
        $adminRole->givePermissionTo($editCategoriesPermission);
        $adminRole->givePermissionTo($deleteCategoriesPermission);

        $memberRole->givePermissionTo($createNewsPermission);
        $memberRole->givePermissionTo($editNewsPermission);
        $memberRole->givePermissionTo($deleteNewsPermission);
        $memberRole->givePermissionTo($createTagsPermission);
        $memberRole->givePermissionTo($editTagsPermission);
        $memberRole->givePermissionTo($deleteTagsPermission);
        $memberRole->givePermissionTo($createCategoriesPermission);
        $memberRole->givePermissionTo($editCategoriesPermission);
        $memberRole->givePermissionTo($deleteCategoriesPermission);
    }
}
