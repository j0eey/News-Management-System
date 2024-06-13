<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class AdminMemberController extends Controller
{
    // Index method to display all members
    public function index()
    {
        $members = User::paginate(10);
        return view('modules.admin.members.index', compact('members'));
    }

    // Show the form to create a new member
    public function create()
    {
        $roles = Role::all(); 
        return view('modules.admin.members.create', compact('roles'));
    }

    // Store a newly created member in the database
    public function store(Request $request)
    {
        // Validate the request
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users|max:255',
            'password' => 'required|string|min:8',
            'role' => 'required|exists:roles,name', 
        ]);

        try {
            // Convert role name to lowercase
            $roleName = strtolower($validatedData['role']);

            // Find the role by name
            $role = Role::where('name', $roleName)->firstOrFail();

            // Determine if the user is a super admin
            $isSuperAdmin = $role->name === 'super admin';

            // Create the user
            $user = User::create([
                'name' => $validatedData['name'],
                'email' => $validatedData['email'],
                'password' => bcrypt($validatedData['password']),
                'role_id' => $role->id,
                'is_super_admin' => $isSuperAdmin,
            ]);

            // Assign the role to the user
            $user->assignRole($role);

            // Redirect back with a success message
            return redirect()->route('admin.members.index')->with('success', 'Member created successfully!');
        } catch (\Exception $e) {
            // Log any validation errors
            Log::error('Validation error: ' . $e->getMessage());

            // Redirect back with an error message
            return redirect()->back()->withInput()->with('error', 'Validation error: ' . $e->getMessage());
        }
    }

    // Show the form to edit an existing member
    public function edit($id)
    {
        $member = User::findOrFail($id);
        $roles = Role::all();
        $permissions = Permission::all();
        return view('modules.admin.members.edit', compact('member', 'roles', 'permissions'));
    }

    // Update an existing member in the database
    public function update(Request $request, $id)
    {
        // Validate the request
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,'.$id.'|max:255',
            'password' => 'nullable|string|min:8',
            'role' => 'required|exists:roles,name',
        ]);

        try {
            // Find the user by id
            $user = User::findOrFail($id);

            // Update the user details
            $user->name = $validatedData['name'];
            $user->email = $validatedData['email'];

            // Update the password only if provided
            if (!empty($validatedData['password'])) {
                $user->password = bcrypt($validatedData['password']);
            }

            // Find the role by name
            $role = Role::where('name', $validatedData['role'])->firstOrFail();

            // Log the role details
            Log::info('Role found: ' . $role->name);

            // Determine if the user is a super admin (case-insensitive comparison)
            $isSuperAdmin = strtolower($role->name) === 'super admin';

            // Log the super admin determination
            Log::info('Is Super Admin: ' . ($isSuperAdmin ? 'Yes' : 'No'));

            // Update the role and is_super_admin flag
            $user->role_id = $role->id;
            $user->is_super_admin = $isSuperAdmin;

            // Save the user
            $user->save();

            // Sync the role
            $user->syncRoles([$role->name]);

            // Log the user update
            Log::info('Member updated: ' . $user->email . ' with role ' . $role->name);

            // Redirect back with a success message
            return redirect()->route('admin.members.index')->with('success', 'Member updated successfully!');
        } catch (\Exception $e) {
            // Log any validation errors
            Log::error('Validation error: ' . $e->getMessage());

            // Redirect back with an error message
            return redirect()->back()->withInput()->with('error', 'Validation error: ' . $e->getMessage());
        }
    }

    // Delete a member from the database
    public function destroy($id)
    {
        try {
            // Find the user by id and delete them
            User::findOrFail($id)->delete();
            
            // Redirect back with a success message
            return redirect()->route('admin.members.index')->with('success', 'Member deleted successfully!');
        } catch (\Exception $e) {
            // Log any errors
            Log::error('Error deleting member: ' . $e->getMessage());

            // Redirect back with an error message
            return redirect()->back()->with('error', 'Error deleting member: ' . $e->getMessage());
        }
    }

    public function savePermissions(Request $request)
    {
        $memberId = $request->input('member_id');
        $permissions = $request->input('permissions', []);

        try {
            $user = User::findOrFail($memberId);

            // Detach all existing permissions
            $user->permissions()->detach();

            // Get the permission IDs to sync
            foreach ($permissions as $permissionTitle) {
                $permission = Permission::where('title', $permissionTitle)->firstOrFail();
                DB::table('model_has_permissions')->insert([
                    'permission_id' => $permission->id,
                    'model_type' => User::class,
                    'model_id' => $user->id,
                ]);
            }

            return response()->json(['message' => 'Permissions saved successfully']);
        } catch (\Exception $e) {
            Log::error('Error saving permissions: ' . $e->getMessage());
            return response()->json(['error' => 'Error saving permissions: ' . $e->getMessage()], 500);
        }
    }
    // Inside the getPermissions method
    public function getPermissions($memberId)
    {
        $user = User::findOrFail($memberId);
        $allPermissions = Permission::get(['title', 'id']); // Fetch only the 'title' and 'id' columns
        $memberPermissions = $user->permissions()->get(['title', 'id']); // Fetch only the 'title' and 'id' columns

        Log::info('Permissions for user with ID ' . $memberId . ': ' . json_encode($allPermissions));

        return response()->json([
            'allPermissions' => $allPermissions,
            'memberPermissions' => $memberPermissions
        ]);
    }

    public function getUserPermissions()
    {
        $user = auth()->user();
        $permissions = $user->permissions->pluck('name')->toArray();

        return response()->json(['permissions' => $permissions]);
    }    

}