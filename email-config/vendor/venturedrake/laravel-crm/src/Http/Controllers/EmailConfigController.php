<?php

namespace VentureDrake\LaravelCrm\Http\Controllers;

use App\User;
use Symfony\Component\HttpKernel\HttpCache\Store;
use VentureDrake\LaravelCrm\Http\Requests\StoreEmailConfigRequest;
use VentureDrake\LaravelCrm\Http\Requests\UpdateEmailConfigRequest;
use VentureDrake\LaravelCrm\Models\EmailConfig;

class EmailConfigController extends Controller
{

    public function index(User $user)
    {
        if (EmailConfig::all()->count() < 30) {
            $email_config = EmailConfig::latest()->get();
        } else {
            $email_config = EmailConfig::latest()->paginate(30);
        }

        return view('laravel-crm::email-config.index', [
            'email_config' => $email_config,
        ]);
    }

    public function create()
    {
        return view('laravel-crm::email-config.create');
    }

    public function store(StoreEmailConfigRequest $request)
    {
        $existingConfig = EmailConfig::where('protocol', $request->protocol)
                             ->where('username', $request->username)
                             ->first();

        if ($existingConfig) {
            return back()->with('error', 'This configuration already exists.');
        } else {
            EmailConfig::create([
                        'protocol' => $request->protocol,
                        'host' => $request->host,
                        'ssl_tls' => $request->ssl_tls,
                        'port' => $request->port,
                        'username' => $request->username,
                        'password' => bcrypt($request->password),
                    ]);
            flash(ucfirst(trans('laravel-crm::lang.email_config_created')))->success()->important();

            return redirect(route('laravel-crm.email-config.index'));
        }
    }

    public function show(EmailConfig $email)
    {
        return view('laravel-crm::email-config.show', [
            'email' => $email,
        ]);
    }

    public function edit(EmailConfig $email)
    {
        return view('laravel-crm::email-config.edit', [
            'email' => $email,
        ]);
    }

    public function update(UpdateEmailConfigRequest $request, EmailConfig $email)
    {
        try {
            $email->update([
                'protocol' => $request->protocol,
                'host' => $request->host,
                'ssl_tls' => $request->ssl_tls,
                'port' => $request->port,
                'username' => $request->username,
                'password' => $request->has('password') ? bcrypt($request->password) : $email->password, // Hash password only if provided
            ]);

            flash(ucfirst(trans('laravel-crm::lang.email_config_updated')))->success()->important();
            return redirect(route('laravel-crm.email-config.show', $email));
        } catch (\Exception $e) {
            \Log::error('Email config update failed: ' . $e->getMessage());

            if (strpos($e->getMessage(), 'Duplicate entry') !== false) {
                $errorMessage = 'The email configuration with the provided username and protocol already exists.';
            } else {
                $errorMessage = 'An error occurred while updating the email configuration. Please try again.';
            }

            return back()->withInput()->withErrors(['email_config_error' => $errorMessage]);
        }
    }

    public function destroy(EmailConfig $email)
    {
        $email->delete();

        flash(ucfirst(trans('laravel-crm::lang.email_config_deleted')))->success()->important();
        return redirect(route('laravel-crm.email-config.index'));
    }
}
