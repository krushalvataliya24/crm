<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        if (!Schema::hasTable('email_config')) {
            Schema::create('email_config', function (Blueprint $table) {
                $table->id();
                $table->enum('protocol', ['SMTP', 'POP3', 'IMAP'])->default('SMTP')->nullable();
                $table->string('host')->nullable();
                $table->enum('ssl_tls', ['SSL', 'TLS'])->default('SSL');
                $table->integer('port')->default(25);
                $table->string('username')->nullable();
                $table->string('password')->nullable();
                $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
                $table->timestamp('updated_at')->nullable()->default(null)->onUpdate(DB::raw('CURRENT_TIMESTAMP'));
                $table->softDeletes();
            });
            Schema::table('email_config', function (Blueprint $table) {
                $table->unique(['protocol', 'username']);
            });
        }
    }

    public function down()
    {
       Schema::dropIfExists('email_config');
    }
};
