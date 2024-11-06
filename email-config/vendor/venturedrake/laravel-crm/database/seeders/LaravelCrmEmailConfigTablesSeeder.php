<?php

namespace VentureDrake\LaravelCrm\Database\Seeders;

use Illuminate\Database\Seeder;
use Ramsey\Uuid\Uuid;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use VentureDrake\LaravelCrm\Models\Lead;
use VentureDrake\LaravelCrm\Models\Setting;

class LaravelCrmEmailConfigTablesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $viewPermission = Permission::create(['name' => 'view crm email config']);
        $createPermission = Permission::create(['name' => 'create crm email config']);
        $editPermission = Permission::create(['name' => 'edit crm email config']);
        $deletePermission = Permission::create(['name' => 'delete crm email config']);

        $adminRole = Role::findOrCreate('Owner');

        $adminRole->givePermissionTo($createPermission);
        $adminRole->givePermissionTo($editPermission);
        $adminRole->givePermissionTo($viewPermission);
        $adminRole->givePermissionTo($deletePermission);
        
        $adminRole = Role::findOrCreate('Admin');

        $adminRole->givePermissionTo($createPermission);
        $adminRole->givePermissionTo($editPermission);
        $adminRole->givePermissionTo($viewPermission);
        $adminRole->givePermissionTo($deletePermission);
    }
}
